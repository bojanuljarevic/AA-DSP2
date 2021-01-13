#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include "common.h"
#include "tremolo.h"

#define ASSEMBLY_OPTIMIZATION

#define INPUT_GAIN (FRACT_NUM(0.501187))
#define HEADROOM_GAIN (FRACT_NUM(0.707946))
#define OUTPUT_GAIN (FRACT_NUM(0.794328))

#define NUM_IN_CHANNELS 2


// IO Buffers, different mem zones for potential parallel optimization
__memX fract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];
__memY fract tremoloBuffer[TREM_BUFF_CHANNELS][BLOCK_SIZE];


// tremolo block info
__memY tremolo_struct_t dataLeft;
__memY tremolo_struct_t dataRight;

// sampleBuffer iterators
__memX sample_iterator_t samples;

// Processing variables
__memX fract headroom;
__memY fract* __memY tremoloLeftIterator = tremoloBuffer[L_TREM];
__memY fract* __memY tremoloRightIterator = tremoloBuffer[R_TREM];


void resetIterators()
{
	samples.sampleLeftIterator = sampleBuffer[L_CHANNEL];
	samples.sampleRightIterator = sampleBuffer[R_CHANNEL];
	samples.sampleCenterIterator = sampleBuffer[C_CHANNEL];
	samples.sampleLSIterator = sampleBuffer[LS_CHANNEL];
	samples.sampleRSIterator = sampleBuffer[RS_CHANNEL];
}

#ifndef ASSEMBLY_OPTIMIZATION
void load_tremolo()
{
	int i;

	resetIterators();
	// No change in assembly after modifying
	if (selected_mode - MODE_2_0_0 != 0)
	{
		// HW Loop
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*tremoloLeftIterator = INPUT_GAIN * *samples.sampleLeftIterator++;
			*tremoloRightIterator = INPUT_GAIN * *samples.sampleRightIterator++;

			tremoloLeftIterator++;
			tremoloRightIterator++;
		}
		tremoloLeftIterator = tremoloBuffer[L_TREM];
		tremoloRightIterator = tremoloBuffer[R_TREM];

		processBlock(tremoloLeftIterator, tremoloLeftIterator, &dataLeft);
		processBlock(tremoloRightIterator, tremoloRightIterator, &dataRight);

	}
}

void calculate_gain()
{
	int i;

	resetIterators();
		// HW loop
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			if (selected_mode != MODE_0_2_0)
			{
				// MODE_2_0_0 & MODE_3_2_0
				// Channels L, R
				headroom = INPUT_GAIN *
						((*samples.sampleLeftIterator) + (*samples.sampleRightIterator));
				headroom = headroom * HEADROOM_GAIN;
				*samples.sampleLeftIterator = INPUT_GAIN * headroom;
				*samples.sampleRightIterator = INPUT_GAIN * headroom;

				*samples.sampleLeftIterator++;
				*samples.sampleRightIterator++;
			}
			if (selected_mode != MODE_2_0_0)
			{
				// MODE_0_2_0 & MODE_3_2_0
				// Channels Ls, Rs
				*samples.sampleLSIterator = OUTPUT_GAIN * *tremoloLeftIterator++;
				*samples.sampleRSIterator = OUTPUT_GAIN * *tremoloRightIterator++;

				*samples.sampleLSIterator++;
				*samples.sampleRSIterator++;
			}
			// Switched from a0 - a1 to a0 & a1
			if (selected_mode - MODE_3_2_0 == 0)
			{
				// MODE_3_2_0
				// Channel C
				*samples.sampleCenterIterator = headroom;

				*samples.sampleCenterIterator++;
			}
		}
}
#endif

void processing()
{
	load_tremolo();

	calculate_gain();

}

 
int main(int argc, char *argv[])
 {
    WAVREAD_HANDLE *wav_in;
    WAVWRITE_HANDLE *wav_out;
	
	char WavInputName[256];
	char WavOutputName[256];
	
    int nChannels;
	int bitsPerSample;
    int sampleRate;
    int iNumSamples;
    int i;
	int offset;						// for MODE_0_2_0 (writing in proper buffers)
	int additional_ch;				// generate 3 more channel on output for MODE_3_2_0


	// Init channel buffers, HW loop
	for(i=0; i<MAX_NUM_CHANNEL; i++)
		memset(&sampleBuffer[i],0,BLOCK_SIZE);
    
	// Open input wav file
	//-------------------------------------------------
	strcpy(WavInputName,argv[0]);
	wav_in = cl_wavread_open(WavInputName);
	 if(wav_in == NULL)
    {
        printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------
	
	// Read input wav header
	//-------------------------------------------------
	nChannels = cl_wavread_getnchannels(wav_in);
    bitsPerSample = cl_wavread_bits_per_sample(wav_in);
    sampleRate = cl_wavread_frame_rate(wav_in);
    iNumSamples =  cl_wavread_number_of_frames(wav_in);
	//-------------------------------------------------

    if (selected_mode == MODE_3_2_0)
    	additional_ch = 3;
    else
    	additional_ch = 0;

    nChannels += additional_ch;
	
	// Open output wav file
	//-------------------------------------------------
	strcpy(WavOutputName,argv[1]);
	wav_out = cl_wavwrite_open(WavOutputName, bitsPerSample, nChannels + additional_ch, sampleRate);
	if(!wav_out)
    {
        printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------
	
	// if MODEL_0_2_0 write in proper order (only 3, 4)
	if (selected_mode == MODE_0_2_0)
		offset = 3;
	else
		offset = 0;

	// Processing loop
	//-------------------------------------------------	
    {
		int i;
		int j;
		int k;
		int sample;
		
		// exact file length should be handled correctly...
		for(i=0; i<iNumSamples/BLOCK_SIZE; i++)
		{	// HW loop
			for(j=0; j<BLOCK_SIZE; j++)
			{	// Not a HW loop
				for(k=0; k < NUM_IN_CHANNELS; k++)
				{	
					sample = cl_wavread_recvsample(wav_in);
        			sampleBuffer[k][j] = rbits(sample);
				}
			}

			if(enabled) processing();
			// HW loop
			for(j=0; j<BLOCK_SIZE; j++)
			{	// Not a HW loop, nChannels not const
				for(k=0; k < nChannels; k++)
				{	
					sample = bitsr(sampleBuffer[k+offset][j]);
					cl_wavwrite_sendsample(wav_out, sample);
				}
			}		
		}
	}
	
	// Close files
	//-------------------------------------------------	
    cl_wavread_close(wav_in);
    cl_wavwrite_close(wav_out);
	//-------------------------------------------------	

    return 0;
 }

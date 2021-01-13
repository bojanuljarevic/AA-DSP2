
#include <stdlib.h>
#include <string.h>
#include "WAVheader.h"
#include "tremolo.h"
#include "common.h"

#define INPUT_GAIN (pow(10.0, input_gain / 20.0))
#define HEADROOM_GAIN (pow(10.0, headroom_gain / 20.0))
#define OUTPUT_GAIN (pow(10.0, output_gain / 20.0))

DSPfract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];
DSPfract tremoloBuffer[TREM_BUFF_CHANNELS][BLOCK_SIZE];

tremolo_struct_t dataLeft;
tremolo_struct_t dataRight;

sample_iterator_t samples;

void resetIterators()
{
	samples.sampleLeftIterator = sampleBuffer[L_CHANNEL];
	samples.sampleRightIterator = sampleBuffer[R_CHANNEL];
	samples.sampleCenterIterator = sampleBuffer[C_CHANNEL];
	samples.sampleLSIterator = sampleBuffer[LS_CHANNEL];
	samples.sampleRSIterator = sampleBuffer[RS_CHANNEL];
}

void processing()
{
	DSPfract headroom;
	resetIterators();
	DSPfract* tremoloLeftIterator = tremoloBuffer[L_TREM];
	DSPfract* tremoloRightIterator = tremoloBuffer[R_TREM];

	if (selected_mode != MODE_2_0_0)
	{
		for (int i = 0; i < BLOCK_SIZE; i++)
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

	resetIterators();

	for (int i = 0; i < BLOCK_SIZE; i++)
	{
		if (selected_mode != MODE_0_2_0)
		{
			// MODE_2_0_0 & MODE_3_2_0 
			// Channels L, R
			headroom = INPUT_GAIN *
					((*samples.sampleLeftIterator) + (*samples.sampleRightIterator));
			headroom *= HEADROOM_GAIN;
			*samples.sampleLeftIterator = INPUT_GAIN * headroom;
			*samples.sampleRightIterator = *samples.sampleLeftIterator;

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
		if (selected_mode == MODE_3_2_0)
		{
			// MODE_3_2_0
			// Channel C
			*samples.sampleCenterIterator = headroom;

			*samples.sampleCenterIterator++;
		}
	}
}

int main(int argc, char* argv[])
{
	// Parse command line arguments
// input.wav output.wav enable input_gain headroom_gain output_mode
	if (argc < 3 || argc > 7)
		return -1;

	if (argc > 3)
	{
		if (strcmp(argv[3], "0") == 0)
			enabled = 0;
	}
	if (argc > 4)
	{
		input_gain = atof(argv[4]);
		if (input_gain > 0)
		{
			printf("Input gain too large, using default (-6 dB)\n");
			input_gain = -6;
		}
	}
	if (argc > 5)
	{
		input_gain = atof(argv[5]);
		if (input_gain > 0)
		{
			printf("Headroom gain too large, using default (-3 dB)\n");
			input_gain = -3;
		}
	}
	if (argc == 7)
	{
		if (strcmp(argv[6], "0_2_0") == 0)
			selected_mode = MODE_0_2_0;
		else if (strcmp(argv[6], "3_2_0") == 0)
			selected_mode = MODE_3_2_0;
		else if (strcmp(argv[6], "2_0_0") == 0)
			selected_mode = MODE_2_0_0;
		else printf("Incorrect format, using default (2_0_0)\n");
	}

	FILE *wav_in = NULL;
	FILE *wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;

	// Init channel buffers
	for (int i = 0; i < MAX_NUM_CHANNEL; i++)
		memset(&sampleBuffer[i], 0, BLOCK_SIZE);

	// Open input and output wav files
	//-------------------------------------------------
	strcpy(WavInputName, argv[1]);
	wav_in = OpenWavFileForRead(WavInputName, "rb");
	strcpy(WavOutputName, argv[2]);
	wav_out = OpenWavFileForRead(WavOutputName, "wb");
	//-------------------------------------------------

	// Read input wav header
	//-------------------------------------------------
	ReadWavHeader(wav_in, inputWAVhdr);
	//-------------------------------------------------

	// Set up output WAV header
	// 5 output channels for MODE_3_2_0, otherwise 2
	//-------------------------------------------------	
	outputWAVhdr = inputWAVhdr;
	if (selected_mode == MODE_3_2_0)
	{
		outputWAVhdr.fmt.NumChannels = ALL_CHANNELS;
	} 
	else
	{
		outputWAVhdr.fmt.NumChannels = inputWAVhdr.fmt.NumChannels;
	}

	DSPint oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size/inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelByteRate = inputWAVhdr.fmt.ByteRate/inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign/inputWAVhdr.fmt.NumChannels;
	
	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out,outputWAVhdr);

	// Global structs for keeping tabs on tremolo phase
	init(&dataLeft);
	init(&dataRight);

	// if MODEL_0_2_0 write in proper order (only 3, 4)
	int offset;
	if (selected_mode == MODE_0_2_0)
		offset = 3;
	else
		offset = 0;

	// Processing loop
	//-------------------------------------------------	
	{
		DSPint sample;
		DSPint BytesPerSample = inputWAVhdr.fmt.BitsPerSample/8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		DSPint iNumSamples = inputWAVhdr.data.SubChunk2Size/(inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample/8);
		
		// exact file length should be handled correctly...
		for(int i=0; i<iNumSamples/BLOCK_SIZE; i++)
		{	
			for(int j=0; j<BLOCK_SIZE; j++)
			{
				for(int k=0; k<inputWAVhdr.fmt.NumChannels; k++)
				{	
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample / SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range		
				}
			}

			if(enabled) processing();

			for(int j=0; j<BLOCK_SIZE; j++)
			{
				for(int k=0; k<outputWAVhdr.fmt.NumChannels; k++)
				{	
					sample = sampleBuffer[k+offset][j] * SAMPLE_SCALE ;	// crude, non-rounding 			
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);		
				}
			}		
		}
	}
	
	// Close files
	//-------------------------------------------------	
	fclose(wav_in);
	fclose(wav_out);
	//-------------------------------------------------	

	return 0;
}
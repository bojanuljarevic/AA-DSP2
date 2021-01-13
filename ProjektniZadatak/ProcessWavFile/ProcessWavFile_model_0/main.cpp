
#include <stdlib.h>
#include <string.h>
#include "WAVheader.h"
#include "tremolo.h"
#include "common.h"

double sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];

tremolo_struct_t dataLeft;
tremolo_struct_t dataRight;

void processing()
{
	double headroom;
	double tremoloBuffer[2][BLOCK_SIZE];

	if (selected_mode != MODE_2_0_0)
	{
		for (int i = 0; i < BLOCK_SIZE; i++)
		{
			tremoloBuffer[L_TREM][i] = db2gain(input_gain) *sampleBuffer[L_CHANNEL][i];
			tremoloBuffer[R_TREM][i] = db2gain(input_gain) *sampleBuffer[R_CHANNEL][i];
		}
		processBlock(tremoloBuffer[L_TREM], tremoloBuffer[L_TREM], &dataLeft, BLOCK_SIZE);
		processBlock(tremoloBuffer[R_TREM], tremoloBuffer[R_TREM], &dataRight, BLOCK_SIZE);
	}
	

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		if (selected_mode != MODE_0_2_0)
		{
			// MODE_2_0_0 i MODE_3_2_0 
			// kanali L i R
			headroom = db2gain(input_gain) * (sampleBuffer[L_CHANNEL][i] + sampleBuffer[R_CHANNEL][i]);
			headroom *= db2gain(headroom_gain);
			sampleBuffer[L_CHANNEL][i] = db2gain(input_gain) * headroom;
			sampleBuffer[R_CHANNEL][i] = sampleBuffer[L_CHANNEL][i];
		}
		if (selected_mode != MODE_2_0_0)
		{
			// MODE_0_2_0 i MODE_3_2_0
			// kanali Ls i Rs
			sampleBuffer[LS_CHANNEL][i] = db2gain(output_gain)*tremoloBuffer[L_TREM][i];
			sampleBuffer[RS_CHANNEL][i] = db2gain(output_gain)*tremoloBuffer[R_TREM][i];
		}
		if (selected_mode == MODE_3_2_0)
		{
			// kanal C
			sampleBuffer[C_CHANNEL][i] = headroom;
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
	// 5 output channels for mode 3_2_0, otherwise 2
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

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size/inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate/inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign/inputWAVhdr.fmt.NumChannels;
	
	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out,outputWAVhdr);

	// For keeping tabs on tremolo phase
	init(&dataLeft);
	init(&dataRight);

	// Processing loop
	//-------------------------------------------------	
	{
		int sample;
		int BytesPerSample = inputWAVhdr.fmt.BitsPerSample/8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		int iNumSamples = inputWAVhdr.data.SubChunk2Size/(inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample/8);
		
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
				// ako je MODEL_0_2_0 upisuj samo kanale 3 i 4
				int offset;
				if (selected_mode == MODE_0_2_0)
					offset = 3;
				else
					offset = 0;

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
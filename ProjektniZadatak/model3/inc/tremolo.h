#ifndef TREMOLO_H
#define TREMOLO_H

#include "common.h"
#include "dsplib\dsp_math.h"
#include "stdfix_emu.h"

//==============================================================================

#define SAMPLE_RATE 48000
#define PI 3.14159265358979323846

typedef enum
{ 
	kWaveformSine = 1,
	kWaveformTriangle,
	kWaveformSquare,
	kWaveformSquareSlopedEdges,
	kNumWaveforms
} wave_forms_t;

// Adjustable parameters:
typedef struct {
	int numChannels;

	fract LFO_frequency;  // LFO frequency (Hz)

	fract depth;      // Depth of effect (0-1)

	wave_forms_t   waveform;      // What shape should be used for the LFO

	fract lfoPhase;

	fract inverseSampleRate;
} tremolo_struct_t;

void init(__memY tremolo_struct_t * data)
{

	// Set default values:
	data->LFO_frequency = FRACT_NUM(1.0);   // x / 2
	data->depth = FRACT_NUM(1.0);
	data->waveform = kWaveformSine;
	data->lfoPhase = FRACT_NUM(0.0);
	data->inverseSampleRate = FRACT_NUM(1.0) / SAMPLE_RATE;
}

#ifndef ASSEMBLY_OPTIMIZATION
fract lfo(fract phase, wave_forms_t waveform)

{

	switch (waveform)

	{

	case kWaveformTriangle:

		if (phase < 0.25r)

			return 0.5r + 2*phase;

		else if (phase < 0.75r)

			return 1.0r - 2*(phase - 0.25r);

		else

			return 2 *(phase - 0.75r);

	case kWaveformSquare:

		if (phase < 0.5r)

			return 1.0r;

		else

			return 0.0r;

	case kWaveformSquareSlopedEdges:

		if (phase < 0.48r)

			return 1.0r;

		else if (phase < 0.5r)

			return 1.0r - 50*(phase - 0.48r);

		else if (phase < 0.98r)

			return 0.0r;

		else

			return 50*(phase - 0.98r);

	case kWaveformSine:

	default:

		// cl_sin: input = x / pi
		return 0.5r + 0.5r*cl_sin(phase << 1);

	}

}
#else
fract lfo(fract phase, wave_forms_t waveform);
#endif

void processBlock(__memY fract* input, __memY fract* output, __memY tremolo_struct_t* data)
{

	fract ph;

	int i;


	// Make a temporary copy of any state variables which need to be

	// maintained between calls to processBlock(). Each channel needs to be processed identically

	// which means that the activity of processing one channel can't affect the state variable for

	// the next channel.



	ph = data->lfoPhase;



	for (i = 0; i < BLOCK_SIZE; ++i)

	{

		// Ring modulation is easy! Just multiply the waveform by a periodic carrier

		output[i] = input[i] * (fract)(1.0r - data->depth*lfo(ph, data->waveform));

		// Update the carrier and LFO phases, keeping them in the range 0-1

		ph += data->LFO_frequency*data->inverseSampleRate;
		ph <<= 1;

		if (ph >= 1.0r)

			ph -= 1.0r;

	}


	// Having made a local copy of the state variables for each channel, now transfer the result

	// back to the main state variable so they will be preserved for the next call of processBlock()



	data->lfoPhase = ph;

}

//==============================================================================






#endif

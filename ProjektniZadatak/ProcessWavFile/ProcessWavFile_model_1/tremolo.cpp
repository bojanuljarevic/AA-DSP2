#include "tremolo.h"

void init(tremolo_struct_t * data)
{

	// Set default values:
	data->LFO_frequency = 2.0;
	data->depth = 1.0;
	data->waveform = kWaveformSine;
	data->lfoPhase = 0.0;
	data->inverseSampleRate = 1.0 / SAMPLE_RATE;
}


void processBlock(double* input, double* output, tremolo_struct_t* data)
{

	float ph;


	// Make a temporary copy of any state variables which need to be

	// maintained between calls to processBlock(). Each channel needs to be processed identically

	// which means that the activity of processing one channel can't affect the state variable for

	// the next channel.



	ph = data->lfoPhase;



	for (int i = 0; i < BLOCK_SIZE; ++i)

	{

		// Ring modulation is easy! Just multiply the waveform by a periodic carrier

		output[i] = input[i] * (1.0f - data->depth*lfo(ph, data->waveform));

		// Update the carrier and LFO phases, keeping them in the range 0-1

		ph += data->LFO_frequency*data->inverseSampleRate;

		if (ph >= 1.0)

			ph -= 1.0;

	}


	// Having made a local copy of the state variables for each channel, now transfer the result

	// back to the main state variable so they will be preserved for the next call of processBlock()



	data->lfoPhase = ph;

}

//==============================================================================



float lfo(float phase, wave_forms_t waveform)

{

	switch (waveform)

	{

	case kWaveformTriangle:

		if (phase < 0.25f)

			return 0.5f + 2.0f*phase;

		else if (phase < 0.75f)

			return 1.0f - 2.0f*(phase - 0.25f);

		else

			return 2.0f*(phase - 0.75f);

	case kWaveformSquare:

		if (phase < 0.5f)

			return 1.0f;

		else

			return 0.0f;

	case kWaveformSquareSlopedEdges:

		if (phase < 0.48f)

			return 1.0f;

		else if (phase < 0.5f)

			return 1.0f - 50.0f*(phase - 0.48f);

		else if (phase < 0.98f)

			return 0.0f;

		else

			return 50.0f*(phase - 0.98f);

	case kWaveformSine:

	default:

		return 0.5f + 0.5f*sinf(2.0 * PI * phase);

	}

}

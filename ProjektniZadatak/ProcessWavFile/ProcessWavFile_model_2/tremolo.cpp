#include "tremolo.h"

void init(tremolo_struct_t * data)
{

	// Set default values:
	data->LFO_frequency = FRACT_NUM(1.0);   // SCALE BACK TO 2 !
	data->depth = FRACT_NUM(1.0);
	data->waveform = kWaveformSine;
	data->lfoPhase = FRACT_NUM(0.0);
	data->inverseSampleRate = FRACT_NUM(1.0 / SAMPLE_RATE);
}


void processBlock(fract* input, fract* output, tremolo_struct_t* data)
{

	fract ph;


	// Make a temporary copy of any state variables which need to be

	// maintained between calls to processBlock(). Each channel needs to be processed identically

	// which means that the activity of processing one channel can't affect the state variable for

	// the next channel.



	ph = data->lfoPhase;



	for (int i = 0; i < BLOCK_SIZE; ++i)

	{

		// Ring modulation is easy! Just multiply the waveform by a periodic carrier

		output[i] = input[i] * (FRACT_NUM(1.0) - data->depth*lfo(ph, data->waveform));

		// Update the carrier and LFO phases, keeping them in the range 0-1

		fract rescaled_step = data->LFO_frequency*data->inverseSampleRate;
		rescaled_step <<= 1;
		ph += rescaled_step;
		// scale LFO_freq back with rescaled_step variable

		if (ph == FRACT_NUM(1.0))

			ph -= FRACT_NUM(1.0);

	}


	// Having made a local copy of the state variables for each channel, now transfer the result

	// back to the main state variable so they will be preserved for the next call of processBlock()



	data->lfoPhase = ph;

}

//==============================================================================



fract lfo(fract phase, wave_forms_t waveform)

{

	switch (waveform)

	{

	case kWaveformTriangle:

		if (phase < FRACT_NUM(0.25))

			return FRACT_NUM(0.5) + (fract)((long)2*phase);

		else if (phase < FRACT_NUM(0.75))

			return FRACT_NUM(1.0) - (fract)((long)2*(phase - FRACT_NUM(0.25)));

		else

			return 2.0f*(phase - FRACT_NUM(0.75));

	case kWaveformSquare:

		if (phase < FRACT_NUM(0.5))

			return FRACT_NUM(1.0);

		else

			return FRACT_NUM(0.0);

	case kWaveformSquareSlopedEdges:

		if (phase < FRACT_NUM(0.48))

			return FRACT_NUM(1.0);

		else if (phase < FRACT_NUM(0.5))

			return FRACT_NUM(1.0) - (fract)((long)50 * (phase - FRACT_NUM(0.48)));

		else if (phase < FRACT_NUM(0.98))

			return FRACT_NUM(0.0);

		else

			return 50*(phase - FRACT_NUM(0.98));

	case kWaveformSine:

	default:

		return FRACT_NUM(0.5) + FRACT_NUM(0.5)*FRACT_NUM(sin(2 * PI * phase.toDouble()));
	}

}

#ifndef TREMOLO_H
#define TREMOLO_H

#include <math.h>
#include "stdfix_emu.h"

//==============================================================================

#define SAMPLE_RATE 48000
#define BLOCK_SIZE 16
#define PI 3.14159265358979323846

#define L_TREM 0
#define R_TREM 1

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

void init(tremolo_struct_t * data);
void processBlock(fract* input, fract* output, tremolo_struct_t* data);
fract lfo(fract phase, wave_forms_t waveform);


#endif
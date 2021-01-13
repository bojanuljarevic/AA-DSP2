#ifndef COMMON_H
#define COMMON_H

#include "stdfix_emu.h"
#include "stdfix.h"


#define BLOCK_SIZE 16
#define MAX_NUM_CHANNEL 8
#define TREM_BUFF_CHANNELS 2

// Output mode macros
#define MODE_2_0_0 0
#define MODE_0_2_0 1
#define MODE_3_2_0 2

#define ALL_CHANNELS 5

// Channel name macros
#define L_CHANNEL 0
#define R_CHANNEL 1
#define C_CHANNEL 2
#define LS_CHANNEL 3
#define RS_CHANNEL 4

#define L_TREM 0
#define R_TREM 1

/* DSP type definitions */
/* TO DO: Add type definition */		/* DSP integer */
typedef short DSPshort;
/* TO DO: Add type definition */		/* DSP unsigned integer */
typedef unsigned short DSPushort;
/* TO DO: Add type definition */		/* native integer */
typedef int DSPint;
/* TO DO: Add type definition */		/* DSP fixed-point fractional */
typedef double DSPfract;

/* Controls: Enable, Output mode, input gain, headroom gain */

__memY DSPushort enabled = 1;
__memY DSPushort selected_mode = MODE_0_2_0;

__memY fract input_gain;
__memY fract headroom_gain;
__memY fract output_gain;

void load_tremolo();
void calculate_gain();

typedef struct sample_iterator_t {
	__memX fract* sampleLeftIterator;
	__memX fract* sampleRightIterator;
	__memX fract* sampleCenterIterator;
	__memX fract* sampleLSIterator;
	__memX fract* sampleRSIterator;
}sample_iterator_t;

#endif

#ifndef COMMON_H
#define COMMON_H

#include "math.h"

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

DSPushort enabled = 1;
DSPushort selected_mode = MODE_3_2_0;

DSPfract input_gain = -6;
DSPfract headroom_gain = -3;
DSPfract output_gain = -2;

/* Convert db to gain */

DSPfract db2gain(DSPfract db_value)
{
	return pow(10.0, db_value / 20);
}

typedef struct sample_iterator_t {
	DSPfract* sampleLeftIterator;
	DSPfract* sampleRightIterator;
	DSPfract* sampleCenterIterator;
	DSPfract* sampleLSIterator;
	DSPfract* sampleRSIterator;
};

#endif
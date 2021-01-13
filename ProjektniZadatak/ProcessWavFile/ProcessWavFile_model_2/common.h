#ifndef COMMON_H
#define COMMON_H

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

static DSPushort enabled = 1;
static DSPushort selected_mode = MODE_2_0_0;

double input_gain = -6.0;
double headroom_gain = -3.0;
double output_gain = -2.0;

/* Convert db to gain */

fract db2gain(fract db_value)
{
	return pow(10, (DSPfract)db_value / 20);
}

typedef struct sample_iterator_t {
	fract* sampleLeftIterator;
	fract* sampleRightIterator;
	fract* sampleCenterIterator;
	fract* sampleLSIterator;
	fract* sampleRSIterator;
};

#endif
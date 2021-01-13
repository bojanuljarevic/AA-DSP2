#ifndef COMMON_H
#define COMMON_H

#include "math.h"

#define BLOCK_SIZE 16
#define MAX_NUM_CHANNEL 8

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

// Tremolo buffer channels
#define L_TREM 0
#define R_TREM 1

/* Controls: Enable, Output mode, input gain, headroom gain */

short enabled = 1;
short selected_mode = MODE_3_2_0;

double input_gain = -6;
double headroom_gain = -3;
double output_gain = -2;

/* Convert db to gain */

double db2gain(double db_value)
{
	return pow(10, db_value / 20);
}

#endif
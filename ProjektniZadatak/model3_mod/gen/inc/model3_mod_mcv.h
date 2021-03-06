/*
 * This file is automatically generated by CLIDE
 *
 * MCV (Module Control Vector)
 */

#include <dsplib/platform_support.h>
#include <dsplib/cl_os.h> 
#include <dsplib/meter.h>
#include <dsplib/response.h>

typedef union {
	void __memY * y_ptr;
	void __memX * x_ptr;
	void __memXY * xy_ptr;
} unspecified_zone_ptr;

#define	isDefined 	 true


typedef __memY struct {
	bool enable;	 // bool	non-zero to enable this function
	fract knob;	 //fract(1.31)
	fract knob_0;	 //fract(1.31)
} mcv_t;


#define MCV_INITIAL_VALUES { true, FRACT_NUM_SCALE_R(0.50118723325431346893310546875, 31), FRACT_NUM_SCALE_R(0.7079457840882241725921630859375, 31) }


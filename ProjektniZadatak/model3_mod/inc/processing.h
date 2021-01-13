#ifndef PROCESSING_H
#define PROCESSING_H

#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include "common.h"
#include "tremolo.h"

#define ASSEMBLY_OPTIMIZATION

#define INPUT_GAIN (FRACT_NUM(0.501187))
#define HEADROOM_GAIN (FRACT_NUM(0.707946))
#define OUTPUT_GAIN (FRACT_NUM(0.794328))

#define NUM_IN_CHANNELS 2


// IO Buffers, different mem zones for potential parallel optimization
__memX fract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];
__memY fract tremoloBuffer[TREM_BUFF_CHANNELS][BLOCK_SIZE];


// tremolo block info
__memY tremolo_struct_t dataLeft;
__memY tremolo_struct_t dataRight;

// sampleBuffer iterators
__memX sample_iterator_t samples;

// Processing variables
__memX fract headroom;
__memY fract* __memY tremoloLeftIterator = tremoloBuffer[L_TREM];
__memY fract* __memY tremoloRightIterator = tremoloBuffer[R_TREM];

void resetIterators();
void processing();


#endif

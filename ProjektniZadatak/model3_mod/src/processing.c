#include "processing.h"

void resetIterators()
{
	samples.sampleLeftIterator = sampleBuffer[L_CHANNEL];
	samples.sampleRightIterator = sampleBuffer[R_CHANNEL];
	samples.sampleCenterIterator = sampleBuffer[C_CHANNEL];
	samples.sampleLSIterator = sampleBuffer[LS_CHANNEL];
	samples.sampleRSIterator = sampleBuffer[RS_CHANNEL];
}


void processing()
{
	load_tremolo();

	calculate_gain();

}

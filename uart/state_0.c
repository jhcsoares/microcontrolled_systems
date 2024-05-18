#include <stdint.h>

#include "tm4c1294ncpdt.h"

void state_0(void)
{
	TIMER2_CTL_R = 0x0;
	
	GPIO_PORTH_AHB_DATA_R = 0xF; //stop motor
}

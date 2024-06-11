#include <stdint.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

void state_2a(void)
{
	pwm_high = 1;
	
	TIMER2_CTL_R = 0x1;
	
	usr_sw_1_pressed = 0;
	usr_sw_2_pressed = 0;
	timer_counter = 0;
	
	while(1)
	{
		if(usr_sw_2_pressed)
			break;
	}
}

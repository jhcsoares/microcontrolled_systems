#include <stdlib.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

void lcd_print_string(char* s);
void lcd_print_partial_string(char* s);
char read_keyboard(void);
uint16_t potenciometer_analog_read(void);

void state_3b(void)
{
	pwm_high = 1;
	
	TIMER2_CTL_R = 0x1;
	
	usr_sw_1_pressed = 0;
	usr_sw_2_pressed = 0;
	timer_counter = 0;
	duty_cycle_increment = 0;
	duty_cycle_step = (100*potenciometer_analog_read())/0xFFF;;
	
	while(1)
	{
		if(usr_sw_1_pressed || usr_sw_2_pressed)
			break;
	}
}

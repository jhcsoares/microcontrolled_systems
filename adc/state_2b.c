#include <stdint.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

void lcd_print_string(char* s);
void lcd_print_partial_string(char* s);
char read_keyboard(void);
uint16_t potenciometer_analog_read(void);

void state_2b(void)
{
	if(state_2b_timer_flag)
		TIMER2_CTL_R = 0x1;
	
	char* motor_direction_msg = "HORARIO? 1 OU 0";
	
	lcd_print_string(motor_direction_msg);
	
	char pressed_button = 0;
	
	while(pressed_button == 0)
		pressed_button = read_keyboard();
	
	pressed_button = pressed_button - '0';
	
	if(motor_direction == -1)
		motor_direction = pressed_button;

	else if((pressed_button == 0 && motor_direction == 1) || (pressed_button == 1 && motor_direction == 0))
		changed_direction = 1;
	
	state_2b_timer_flag = 0;
}

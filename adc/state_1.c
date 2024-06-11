#include <stdint.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

void lcd_print_string(char* s);
char read_keyboard(void);

void state_1(void)
{
	char* motor_mode_msg = "USAR POT? 1 OU 0";
	
	lcd_print_string(motor_mode_msg);
	
	char pressed_button = 0;
	
	while(pressed_button == 0)
		pressed_button = read_keyboard();
	
	motor_mode = pressed_button - '0';
}

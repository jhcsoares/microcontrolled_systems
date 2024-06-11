#include <stdint.h>

#include "tm4c1294ncpdt.h"

void lcd_print_string(char* s);
void SysTick_Wait1ms(uint32_t delay);

void state_0(void)
{
	TIMER2_CTL_R = 0x0;
	
	GPIO_PORTE_AHB_DATA_R = 0x0;
	char* stopped_motor_msg = "MOTOR PARADO";
	
	lcd_print_string(stopped_motor_msg);
	
	SysTick_Wait1ms(2000);
}

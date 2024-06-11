#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

void SysTick_Wait1us(uint32_t delay);
void break_line(void);
void lcd_setup(void);

void lcd_setup(void)
{
	GPIO_PORTK_DATA_R = 0x38;
	
	GPIO_PORTM_DATA_R = 0x4;
	
	SysTick_Wait1us(10);
	
	GPIO_PORTM_DATA_R = 0x0;
	
	SysTick_Wait1us(40);
	
	GPIO_PORTK_DATA_R = 0x6;
	
	GPIO_PORTM_DATA_R = 0x4;
	
	SysTick_Wait1us(10);
	
	GPIO_PORTM_DATA_R = 0;
	
	SysTick_Wait1us(40);
	
	GPIO_PORTK_DATA_R = 0xE;
	
	GPIO_PORTM_DATA_R = 0x4;
	
	SysTick_Wait1us(10);
	
	GPIO_PORTM_DATA_R = 0x0;
	
	SysTick_Wait1us(40);
	
	GPIO_PORTK_DATA_R = 0x1;
	
	GPIO_PORTM_DATA_R = 0x4;
	
	SysTick_Wait1us(40);
	
	GPIO_PORTM_DATA_R = 0x0;
	
	SysTick_Wait1us(1640);
}

void lcd_print_string(char* s)
{
	lcd_setup();
	
	uint8_t i = 0;
	uint8_t broke_line = 0;
	
	while(*s != 0)
	{
		if(i > 15 && !broke_line)
		{
			break_line();
			broke_line = 1;
		}
		
		GPIO_PORTK_DATA_R = *s;
		
		GPIO_PORTM_DATA_R = 0x5;
		
		SysTick_Wait1us(40);
		
		GPIO_PORTM_DATA_R = 0x1;
		
		SysTick_Wait1us(40);
		
		s++;
		i++;
	}
}

void lcd_print_partial_string(char* s)
{
	while(*s != 0)
	{
		GPIO_PORTK_DATA_R = *s;
		
		GPIO_PORTM_DATA_R = 0x5;
		
		SysTick_Wait1us(40);
		
		GPIO_PORTM_DATA_R = 0x1;
		
		SysTick_Wait1us(40);
		
		s++;
	}
}

void break_line(void)
{
	GPIO_PORTK_DATA_R = 0xC0;
	
	GPIO_PORTM_DATA_R = 0x4;
	
	SysTick_Wait1us(10);
	
	GPIO_PORTM_DATA_R = 0x0;
	
	SysTick_Wait1us(40);
	
	GPIO_PORTK_DATA_R = 0x6;
	
	GPIO_PORTM_DATA_R = 0x4;
	
	SysTick_Wait1us(10);
	
	GPIO_PORTM_DATA_R = 0x0;
	
	SysTick_Wait1us(40);
}

void print_motor_info_keyboard(uint8_t duty_cycle)
{
	char* motor_direction_msg = 0;
	
	if(motor_direction == 1)
		motor_direction_msg = "HORARIO ";
	
	else
		motor_direction_msg = "ANTI-HORARIO ";
	
	char duty_cycle_buffer[6];
	snprintf(duty_cycle_buffer, sizeof(duty_cycle_buffer), "%u", duty_cycle);

	lcd_print_string(motor_direction_msg);
	lcd_print_partial_string(duty_cycle_buffer);
}


void print_motor_info_potentiometer(int8_t duty_cycle)
{
	char* motor_direction_msg = 0;
	
	if(duty_cycle >= 0)
		motor_direction_msg = "HORARIO ";
	
	else
		motor_direction_msg = "ANTI-HORARIO ";
	
	char duty_cycle_buffer[6];
	snprintf(duty_cycle_buffer, sizeof(duty_cycle_buffer), "%u", abs(duty_cycle));

	lcd_print_string(motor_direction_msg);
	lcd_print_partial_string(duty_cycle_buffer);
}

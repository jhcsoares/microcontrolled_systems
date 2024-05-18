#include <stdint.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"


void SysTick_Wait1ms(uint32_t delay);
void print_message(char* message);
void transmit_data(uint8_t data);

void state_2();
void move_engine(uint8_t rounds, uint8_t is_clockwise, uint8_t is_complete_step);
void complete_step(uint8_t rounds, uint8_t is_clockwise);
void half_step(uint8_t rounds, uint8_t is_clockwise);
void print_motor_data(uint8_t remaining_rounds, uint8_t is_complete_step, uint8_t is_clockwise);

void state_2()
{
	move_engine(rounds, is_clockwise, is_complete_step);
}

void move_engine(uint8_t rounds, uint8_t is_clockwise, uint8_t is_complete_step)
{
	uint8_t complete_step_clockwise_array[] = {0x7, 0xB, 0xD, 0xE};
	uint8_t complete_step_counter_clockwise_array[] = {0xE, 0xD, 0xB, 0x7};
	uint8_t half_step_clockwise_array[] = {0x6, 0x7, 0x3, 0xB, 0x9, 0xD, 0xC, 0xE};
	uint8_t half_step_counter_clockwise_array[] = {0xE, 0xC, 0xD, 0x9, 0xB, 0x3, 0x7, 0x6};
	uint8_t *step_array = 0;
	uint8_t steps = 0;
	
	if(is_complete_step && is_clockwise)
	{
		steps = 4;
		step_array = complete_step_clockwise_array;
	}
	
	else if(is_complete_step && !is_clockwise)
	{
		steps = 4;
		step_array = complete_step_counter_clockwise_array;
	}
	
	else if(!is_complete_step && is_clockwise)
	{
		steps = 8;
		step_array = half_step_clockwise_array;
	}
	
	else if(!is_complete_step && !is_clockwise)
	{
		steps = 8;
		step_array = half_step_counter_clockwise_array;
	}
	
	uint8_t remaining_rounds = rounds;
	
	uint8_t leds_index = 0;
	
	TIMER2_CTL_R = 0x1;
	
	uint8_t i = 0;
	uint16_t j = 0;
	uint8_t k = 0;
	
	interrupt = 0;
	
	for(i = 0; i < rounds; i++)
	{
		for(j = 0; j < 8; j++)
			leds_array[j] = 0;
		
		if(is_clockwise)
			leds_index = 0;
		
		else
			leds_index = 7;
		
		uint16_t degree_counter = 0;
		
		for(j = 0; j < 512; j++)
		{
			for(k = 0; k < steps; k++)
			{
				GPIO_PORTH_AHB_DATA_R = step_array[k];
				SysTick_Wait1ms(8);
				
				if(interrupt)
					return;
			}
			
			if((degree_counter % 64) == 0)
			{
				degree_counter = 0;
				
				leds_array[leds_index] = 1;
				
				if(is_clockwise)
					leds_index++;
				
				else
					leds_index--;
			}
			
			degree_counter += 1;
		}
		
		GPIO_PORTH_AHB_DATA_R = 0xF;
		print_motor_data(--remaining_rounds, is_clockwise, is_complete_step);
		SysTick_Wait1ms(8);
	}
	
	GPIO_PORTA_AHB_DATA_R = 0x0;
	GPIO_PORTQ_DATA_R = 0x0;
	
	TIMER2_CTL_R = 0x0;
}

void print_motor_data(uint8_t remaining_rounds, uint8_t is_clockwise, uint8_t is_complete_step)
{
	char rounds_message[] = "Numero de voltas restantes: ";
	print_message(rounds_message);
	transmit_data(remaining_rounds + '0');
	transmit_data('\n');
	transmit_data('\r');
	
	char clockwise_message[] = "Horario?: ";
	print_message(clockwise_message);
	transmit_data(is_clockwise + '0');
	transmit_data('\n');
	transmit_data('\r');
	
	char complete_step_message[] = "Passo-completo?: ";
	print_message(complete_step_message);
	transmit_data(is_complete_step + '0');
	transmit_data('\n');
	transmit_data('\r');
}

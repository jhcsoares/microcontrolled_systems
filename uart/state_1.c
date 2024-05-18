#include <stdint.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

void transmit_data(uint8_t data);
uint8_t receive_data(void);
void print_message(char* message);

uint8_t rounds_handler(void);
uint8_t direction_handler(void);
uint8_t step_handler(void);

void state_1(void)
{
	GPIO_PORTA_AHB_DATA_R = 0x0;
	GPIO_PORTQ_DATA_R = 0x0;
	TIMER2_CTL_R = 0x0;
	
	rounds = rounds_handler();
	is_clockwise = direction_handler();
	is_complete_step = step_handler();
}

uint8_t rounds_handler(void)
{
	char* rounds_message = "Numero de voltas (1 a 10): ";
	print_message(rounds_message);
	
	char rounds_array[2] = {'\0', '\0'};
	uint8_t index = 0;
	uint8_t received_data = 0;
	
	while(received_data != '\r')
	{
		received_data = receive_data();
		
		if(received_data != 0 && received_data != '\r')
		{
			rounds_array[index] = received_data;
			index++;
			transmit_data(received_data);
		}
	}
	
	uint8_t rounds = 0;
	
	if(rounds_array[1] == '\0')
		rounds = (uint8_t)rounds_array[0] - '0';
	
	else
		rounds = (((uint8_t)rounds_array[0]) - '0') * 10 + ((uint8_t)rounds_array[1]) - '0';
	
	transmit_data('\n');
	transmit_data('\r');

	return rounds;
}

uint8_t direction_handler(void)
{
	char* clockwise_message = "Horario? (1 ou 0): ";
	print_message(clockwise_message);
	
	uint8_t received_data = 0;
	uint8_t direction = 0;
	
	while(received_data != '\r')
	{
		received_data = receive_data();
		
		if(received_data != 0 && received_data != '\r')
		{
			transmit_data(received_data);
			direction = received_data - '0';
		}
	}
	
	transmit_data('\n');
	transmit_data('\r');
	
	return direction;
}

uint8_t step_handler(void)
{
	char* complete_step_message = "Passo-completo? (1 ou 0): ";
	print_message(complete_step_message);
	
	uint8_t received_data = 0;
	uint8_t step = 0;
	
	while(received_data != '\r')
	{
		received_data = receive_data();
		
		if(received_data != 0 && received_data != '\r')
		{
			transmit_data(received_data);
			step = received_data - '0';
		}
	}
	
	transmit_data('\n');
	transmit_data('\r');
	
	return step;
}


#include <stdint.h>

#include "tm4c1294ncpdt.h"

void state_3(void);

void print_message(char* message);
void transmit_data(uint8_t data);
uint8_t receive_data(void);

void state_3(void)
{
	char* final_message = "FIM";
	print_message(final_message);
	transmit_data('\n');
	transmit_data('\r');
	
	char* reset_message = "Digite * para recomecar: ";
	print_message(reset_message);
	
	uint8_t received_data = 0;
	
	while(received_data != '\r')
	{
		received_data = receive_data();
		
		if(received_data != 0 && received_data != '\r')
			transmit_data(received_data);
	}
	
	transmit_data('\n');
	transmit_data('\r');
}

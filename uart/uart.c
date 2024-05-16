#include <stdint.h>

#include "tm4c1294ncpdt.h"

uint8_t receive_data(void)
{
	uint8_t data = 0;
	
	if((UART0_FR_R & 0x10) != 0x10)
		data = UART0_DR_R;
	
	return data;
}

void transmit_data(uint8_t data)
{
	if((UART0_FR_R & 0x20) != 0x20)
		UART0_DR_R = data;
}

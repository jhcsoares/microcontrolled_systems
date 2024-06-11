#include <stdint.h>

#include "tm4c1294ncpdt.h"

#define GPIO_PORTA  (0x1) //bit 1

void uart_setup(void)
{
	SYSCTL_RCGCUART_R = GPIO_PORTA;
	
	while(SYSCTL_PRUART_R != 0x1);
	
	UART0_CTL_R = 0x0;
	
	UART0_IBRD_R = 0x208;
	
	UART0_FBRD_R = 0x35;
	
	uint8_t wlen = 0x3 << 5;
	uint8_t fen = 0x1 << 4;
	uint8_t stp2_en = 0x1 << 3;
	uint8_t eps_en = 0x1 << 2;
	uint8_t pen = 0x1 << 1;
	
	UART0_LCRH_R = UART0_LCRH_R | wlen | fen | stp2_en | eps_en | pen;
	
	UART0_CC_R = 0;
	
	uint8_t uart_en = 0x1;
	uint16_t rx_en = 0x1 << 8;
	uint16_t tx_en = 0x1 << 9;
	
	UART0_CTL_R = UART0_CTL_R | rx_en | tx_en | uart_en;
}

uint8_t receive_data(void)
{
	uint8_t data = 0;
	
	if((UART0_FR_R & 0x10) != 0x10)
		data = UART0_DR_R;
	
	return data;
}

void transmit_data(uint8_t data)
{
	while((UART0_FR_R & 0x20) == 0x20);
	
	UART0_DR_R = data;
}

void print_message(char* message)
{
	char* character = message;
	
	while(*character != '\0')
	{
		transmit_data(*character);
		character++;
	}
}

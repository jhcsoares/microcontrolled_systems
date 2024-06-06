// main.c
// Desenvolvido para a placa EK-TM4C1294XL
// Verifica o estado das chaves USR_SW1 e USR_SW2, acende os LEDs 1 e 2 caso estejam pressionadas independentemente
// Caso as duas chaves estejam pressionadas ao mesmo tempo pisca os LEDs alternadamente a cada 500ms.
// Prof. Guilherme Peron

#include <stdint.h>

#include "tm4c1294ncpdt.h"

void PLL_Init(void);
uint16_t analog_read(void);
void uart_setup(void);
void gpio_setup(void);
void transmit_data(uint8_t data);
void SysTick_Init(void);
void SysTick_Wait1ms(uint32_t delay);

uint16_t potenciometer;

int main(void)
{
	PLL_Init();
	SysTick_Init();
	uart_setup();
	gpio_setup();
	
	while (1)
	{
		potenciometer = analog_read();
		SysTick_Wait1ms(1000);
	}
}

uint16_t analog_read(void)
{
	ADC0_PSSI_R = 0x8;
	
	while(!ADC0_RIS_R);
	
	uint16_t analog_value = ADC0_SSFIFO3_R;
	
	ADC0_ISC_R = 0x1;
	
	return analog_value;
}

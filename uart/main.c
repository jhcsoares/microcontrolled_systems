// main.c
// Desenvolvido para a placa EK-TM4C1294XL
// Verifica o estado das chaves USR_SW1 e USR_SW2, acende os LEDs 1 e 2 caso estejam pressionadas independentemente
// Caso as duas chaves estejam pressionadas ao mesmo tempo pisca os LEDs alternadamente a cada 500ms.
// Prof. Guilherme Peron

#include <stdint.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

uint8_t rounds;
uint8_t is_clockwise;
uint8_t is_complete_step;
uint8_t leds_array[8];
uint8_t interrupt;

void PLL_Init(void);
void timer_setup(void);
void gpio_setup(void);
void uart_setup(void);
void interrupt_setup(void);
uint8_t receive_data(void);
void transmit_data(uint8_t data);
void change_led_state(uint8_t data);
void SysTick_Init(void);
void SysTick_Wait1ms(uint32_t delay);

void state_0(void);
void state_1(void);
void state_2(void);
void state_3(void);

int main(void)
{
	PLL_Init();
	SysTick_Init();
	timer_setup();
	uart_setup();
	gpio_setup();
	interrupt_setup();
	
	states states_machine = STATE_0;
	
	while (1)
	{
		switch(states_machine)
		{
			case(STATE_0):
				state_0();
				states_machine = STATE_1;
				break;
			
			case(STATE_1):
				state_1();
				states_machine = STATE_2;
				break;
			
			case(STATE_2):
				state_2();
				states_machine = STATE_3;
				break;
			
			case(STATE_3):
				state_3();
				states_machine = STATE_0;
				break;
		}
	}
}

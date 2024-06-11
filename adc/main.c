// main.c
// Desenvolvido para a placa EK-TM4C1294XL
// Verifica o estado das chaves USR_SW1 e USR_SW2, acende os LEDs 1 e 2 caso estejam pressionadas independentemente
// Caso as duas chaves estejam pressionadas ao mesmo tempo pisca os LEDs alternadamente a cada 500ms.
// Prof. Guilherme Peron

#include <stdint.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

states states_machine;
uint8_t pwm_high;
uint8_t motor_mode;
int8_t motor_direction = -1;
uint8_t usr_sw_1_pressed;
uint8_t usr_sw_2_pressed;
uint8_t timer_counter = 0;
uint8_t changed_direction = 0;
uint16_t duty_cycle_increment = 0;
int8_t duty_cycle_step = 0;
uint8_t state_2b_timer_flag = 0;

void PLL_Init(void);
void gpio_setup(void);
void adc_setup(void);
void timer_setup(void);
void interrupt_setup(void);
void SysTick_Init(void);

void state_0(void);
void state_1(void);
void state_2a(void);
void state_2b(void);
void state_3b(void);

int main(void)
{
	PLL_Init();
	SysTick_Init();
	gpio_setup();
	adc_setup();
	timer_setup();
	interrupt_setup();
	
	states_machine = STATE_0;
	
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
				
				if(motor_mode == 1)
					states_machine = STATE_2a;
				else
					states_machine = STATE_2b;
				
				break;
			
			case(STATE_2a):
				state_2a();
				
				if(usr_sw_2_pressed)
				{
					usr_sw_2_pressed = 0;
					states_machine = STATE_0;
				}
				
				break;
			
			case(STATE_2b):
				state_2b();
				
				states_machine = STATE_3b;
				break;
			
			case(STATE_3b):
				state_3b();
			
				if(usr_sw_1_pressed)
				{
					usr_sw_1_pressed = 0;
					state_2b_timer_flag = 1;
					states_machine = STATE_2b;
				}
				
				else
				{
					usr_sw_2_pressed = 0;
					states_machine = STATE_0;
				}
				
				break;
		}
	}
}

// main.c
// Desenvolvido para a placa EK-TM4C1294XL
// Verifica o estado das chaves USR_SW1 e USR_SW2, acende os LEDs 1 e 2 caso estejam pressionadas independentemente
// Caso as duas chaves estejam pressionadas ao mesmo tempo pisca os LEDs alternadamente a cada 500ms.
// Prof. Guilherme Peron
#include "tm4c1294ncpdt.h"
#include <stdint.h>

typedef enum 
{
	STATE_0,
	STATE_1,
	STATE_2,
	STATE_3,
	STATE_4,
	STATE_5,
	STATE_6
} semaphores_states;

void SysTick_Wait1ms(uint32_t delay);
void set_leds(uint8_t current_state);
void set_leds(uint8_t current_state);
void PortA_Output(uint8_t value);
void PortQ_Output(uint8_t value);
void PortP_Output(uint8_t value);

void PLL_Init(void);
void SysTick_Init(void);
void SysTick_Wait1us(uint32_t delay);
void GPIO_Init(void);
uint32_t PortJ_Input(void);
void PortN_Output(uint32_t leds);
void blink_leds(void);
void Interrupt_Init(void);
void GPIOPortJ_Handler(void);

uint8_t pedestrian = 0;

int main(void)
{
	PLL_Init();
	SysTick_Init();
	GPIO_Init();
	Interrupt_Init();
	
	semaphores_states semaphore = STATE_0;
	
	while (1)
	{
     switch(semaphore)
		 {
			 case STATE_0:
				 set_leds(STATE_0);
				 semaphore = STATE_1;
				 break;
			 case STATE_1:
				 set_leds(STATE_1);
				 semaphore = STATE_2;
				 break;
			 case STATE_2:
				 set_leds(STATE_2);
				 semaphore = STATE_3;
				 break;
			 case STATE_3:
				 set_leds(STATE_3);
				 semaphore = STATE_4;
				 break;
			 case STATE_4:
				 set_leds(STATE_4);
				 semaphore = STATE_5;
				 break;
			 case STATE_5:
				 set_leds(STATE_5);
				 semaphore = STATE_0;
				 break;
		 }
	}
}

void set_leds(uint8_t current_state)
{
	if(current_state == STATE_0)
	{
		 PortA_Output(0x80);
		 PortQ_Output(0x04);
		 PortP_Output(0x20);
		 SysTick_Wait1ms(2000);
		 PortP_Output(0x00);
		 SysTick_Wait1ms(1);
	}
	else if(current_state == STATE_1)
	{
		 PortA_Output(0x80);
		 PortQ_Output(0x01);
		 PortP_Output(0x20);
		 SysTick_Wait1ms(10000);
		 PortP_Output(0x00);
		 SysTick_Wait1ms(1);
	}
	else if(current_state == STATE_2)
	{
		 PortA_Output(0x80);
		 PortQ_Output(0x02);
		 PortP_Output(0x20);
		 SysTick_Wait1ms(4000);
		 PortP_Output(0x00);
		 SysTick_Wait1ms(1);
	}
	else if(current_state == STATE_3)
	{
		 PortA_Output(0x80);
		 PortQ_Output(0x04);
		 PortP_Output(0x20);
		 SysTick_Wait1ms(2000);
		 PortP_Output(0x00);
		 SysTick_Wait1ms(1);
	}
	else if(current_state == STATE_4)
	{
		 PortA_Output(0x20);
		 PortQ_Output(0x04);
		 PortP_Output(0x20);
		 SysTick_Wait1ms(10000);
		 PortP_Output(0x00);
		 SysTick_Wait1ms(1);
	}
	else if(current_state == STATE_5)
	{
		 PortA_Output(0x40);
		 PortQ_Output(0x04);
		 PortP_Output(0x20);
		 SysTick_Wait1ms(4000);
		 PortP_Output(0x00);
		 SysTick_Wait1ms(1);
		
		if(pedestrian)
		{
			pedestrian = 0;
			
			int i =0;
			for(i=0; i<10; i++)
				blink_leds();
		}
	}
}

void GPIOPortJ_Handler(void)
{
	pedestrian = 1;
	GPIO_PORTJ_AHB_ICR_R = 0x0001;
}

void blink_leds(void)
{
	PortA_Output(0xE0);
	PortQ_Output(0x07);
	PortP_Output(0x20);
	SysTick_Wait1ms(250);
	
	PortA_Output(0x00);
	PortQ_Output(0x00);
	PortP_Output(0x00);
	SysTick_Wait1ms(250);
}

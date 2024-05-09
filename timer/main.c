// main.c
// Desenvolvido para a placa EK-TM4C1294XL
// Verifica o estado das chaves USR_SW1 e USR_SW2, acende os LEDs 1 e 2 caso estejam pressionadas independentemente
// Caso as duas chaves estejam pressionadas ao mesmo tempo pisca os LEDs alternadamente a cada 500ms.
// Prof. Guilherme Peron

#include <stdint.h>
#include "tm4c1294ncpdt.h"

void PLL_Init(void);
void GPIO_Init(void);
void Timer2A_Handler(void);
void timer_setup(void);

int main(void)
{
	PLL_Init();
	GPIO_Init();
	timer_setup();
	while (1)
	{
   
	}
}

void Timer2A_Handler()
{
	TIMER2_ICR_R = 0x1;
	
	if(GPIO_PORTP_DATA_R == 0)
		GPIO_PORTP_DATA_R = 0x20;
	else
		GPIO_PORTP_DATA_R = 0;
	
	return;
}

void timer_setup()
{
	SYSCTL_RCGCTIMER_R = 0x4;
	while(SYSCTL_PRTIMER_R != 0x4);
	
	TIMER2_CTL_R = 0x0; //disable
	
	TIMER2_CFG_R = 0x0; //32 bits mode
	
	TIMER2_TAMR_R = 0x2; //one-shot mode
	
	TIMER2_TAILR_R = 0x3567DFF; //timer count
	
	TIMER2_TAPR_R = 0x0; //wont use prescale mode
	
	TIMER2_IMR_R = 0x1; //enable interrupt
	
	
	NVIC_PRI5_R = 0x80000000; //priority
	
	NVIC_EN0_R = 0x800000; //enable interrupt nvic
	
	TIMER2_CTL_R = 0x1;
}

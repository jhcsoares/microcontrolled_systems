#include <stdint.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

void interrupt_setup(void);
void GPIOPortJ_Handler(void);

void state_0(void);

void interrupt_setup(void)
{
	GPIO_PORTJ_AHB_IM_R = 0x0;
	
	GPIO_PORTJ_AHB_IS_R = 0x0;
	
	GPIO_PORTJ_AHB_IBE_R = 0x0;
	
	GPIO_PORTJ_AHB_IEV_R = 0x1;
	
	GPIO_PORTJ_AHB_ICR_R = 0x1;
	
	GPIO_PORTJ_AHB_IM_R = 0x1;
	
	NVIC_EN1_R = 0x1 << 19;
	
	NVIC_PRI12_R = 0x5 << 29;
}

void GPIOPortJ_Handler(void)
{
	GPIO_PORTJ_AHB_ICR_R = 0x1;
	
	TIMER2_CTL_R = 0x0;
	GPIO_PORTA_AHB_DATA_R = 0x0;
	GPIO_PORTQ_DATA_R = 0x0;
	
	interrupt = 1;
	
	return;
}

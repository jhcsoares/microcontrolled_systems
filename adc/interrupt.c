#include <stdint.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

void interrupt_setup(void);
void GPIOPortJ_Handler(void);

void interrupt_setup(void)
{
	GPIO_PORTJ_AHB_IM_R = 0x0;
	
	GPIO_PORTJ_AHB_IS_R = 0x0;
	
	GPIO_PORTJ_AHB_IBE_R = 0x0;
	
	GPIO_PORTJ_AHB_IEV_R = 0x3;
	
	GPIO_PORTJ_AHB_ICR_R = 0x3;
	
	GPIO_PORTJ_AHB_IM_R = 0x3;
	
	NVIC_EN1_R = 0x1 << 19;
	
	NVIC_PRI12_R = 0x0;
}

void GPIOPortJ_Handler(void)
{
	if((states_machine == STATE_3b) || states_machine == STATE_2a)
	{
		//USR_SW_1 pressed
		if(GPIO_PORTJ_AHB_RIS_R == 0x1)
		{
			usr_sw_1_pressed = 1;
			GPIO_PORTJ_AHB_ICR_R = 0x1;
		}
		
		//USR_SW_2 pressed
		else
		{
			usr_sw_2_pressed = 1;
			GPIO_PORTJ_AHB_ICR_R = 0x2;
			TIMER2_CTL_R = 0x0;
		}
	}
	
	else
		GPIO_PORTJ_AHB_ICR_R = 0x3;
	
	return;
}

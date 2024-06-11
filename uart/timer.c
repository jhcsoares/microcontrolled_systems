#include <stdint.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

void Timer2A_Handler(void);
void SysTick_Wait1ms(uint32_t delay);

void transmit_data(uint8_t data);

void timer_setup(void)
{
	SYSCTL_RCGCTIMER_R = 0x4;
	while(SYSCTL_PRTIMER_R != 0x4);
	
	TIMER2_CTL_R = 0x0; //disable
	
	TIMER2_CFG_R = 0x0; //32 bits mode
	
	TIMER2_TAMR_R = 0x2; //periodic mode
	
	TIMER2_TAILR_R = 7999999; //timer count
	
	TIMER2_TAPR_R = 0x0; //wont use prescale mode
	
	TIMER2_IMR_R = 0x1; //enable interrupt
	
	NVIC_PRI5_R = 0x80000000; //priority
	
	NVIC_EN0_R = 0x800000; //enable interrupt nvic
}

void Timer2A_Handler(void)
{
	TIMER2_ICR_R = 0x1;

	uint8_t led_data = (GPIO_PORTA_AHB_DATA_R & 0xF0) | (GPIO_PORTQ_DATA_R & 0xF);
	
	if(led_data)
	{
		GPIO_PORTA_AHB_DATA_R = 0x0;
		GPIO_PORTQ_DATA_R = 0x0;
	}
	
	else
	{
		uint8_t i = 0;
		uint8_t shift = 8;
		led_data = 0;
		
		if(leds_array[0])
			GPIO_PORTA_AHB_DATA_R = GPIO_PORTA_AHB_DATA_R | 0x80;
		if(leds_array[1])
			GPIO_PORTA_AHB_DATA_R = GPIO_PORTA_AHB_DATA_R | 0x40;
		if(leds_array[2])
			GPIO_PORTA_AHB_DATA_R = GPIO_PORTA_AHB_DATA_R | 0x20;
		if(leds_array[3])
			GPIO_PORTA_AHB_DATA_R = GPIO_PORTA_AHB_DATA_R | 0x10;
		
		if(leds_array[4])
			GPIO_PORTQ_DATA_R = GPIO_PORTQ_DATA_R | 0x8;
		if(leds_array[5])
			GPIO_PORTQ_DATA_R = GPIO_PORTQ_DATA_R | 0x4;
		if(leds_array[6])
			GPIO_PORTQ_DATA_R = GPIO_PORTQ_DATA_R | 0x2;
		if(leds_array[7])
			GPIO_PORTQ_DATA_R = GPIO_PORTQ_DATA_R | 0x1;
		
//		for(i = 0; i < 4; i++)
//		{
//			led_data = led_data + (leds_array[i] << shift);
//			shift--;
//		}
//		
//		GPIO_PORTA_AHB_DATA_R = led_data;
//		
//		if(leds_array[3])
//			GPIO_PORTA_AHB_DATA_R = GPIO_PORTA_AHB_DATA_R | 0x10;
//		
//		shift = 4;
//		
//		for(i = 4; i < 8; i++)
//		{
//			led_data = led_data + (leds_array[i] << shift);
//			shift--;
//		}
//		
//		GPIO_PORTQ_DATA_R = led_data;
	}
	
	SysTick_Wait1ms(5);
	
	return;
}


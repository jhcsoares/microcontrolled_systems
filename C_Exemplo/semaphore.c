#include "semaphore.h"

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
		 SysTick_Wait1ms(20000);
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
		 PortQ_Output(0x80);
		 PortP_Output(0x20);
		 SysTick_Wait1ms(2000);
		 PortP_Output(0x00);
		 SysTick_Wait1ms(1);
	}
	else if(current_state == STATE_4)
	{
		 PortA_Output(0x20);
		 PortQ_Output(0x80);
		 PortP_Output(0x20);
		 SysTick_Wait1ms(20000);
		 PortP_Output(0x00);
		 SysTick_Wait1ms(1);
	}
	else if(current_state == STATE_5)
	{
		 PortA_Output(0x20);
		 PortQ_Output(0x40);
		 PortP_Output(0x20);
		 SysTick_Wait1ms(4000);
		 PortP_Output(0x00);
		 SysTick_Wait1ms(1);
	}
}

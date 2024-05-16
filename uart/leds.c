#include <stdint.h>

#include "tm4c1294ncpdt.h"

void transmit_data(uint8_t data);

void change_led_state(uint8_t data)
{
	char* on_message = " on\n\r";
	char* off_message = " off\n\r";
	char* character = 0;
		
	if(data == '1')
	{
		GPIO_PORTQ_DATA_R = GPIO_PORTQ_DATA_R ^ 0x1;
		
		transmit_data(data);
		
		if((GPIO_PORTQ_DATA_R & 0x1) == 0x1)
		{
			character = on_message;
			while(*character != '\0')
			{
				transmit_data(*character);
				character++;
			}
		}
		
		else
		{
			character = off_message;
			while(*character != '\0')
			{
				transmit_data(*character);
				character++;
			}
		}
	}
		
	else if(data == '2')
	{
		GPIO_PORTQ_DATA_R = GPIO_PORTQ_DATA_R ^ 0x2;
		
		transmit_data(data);
		
		if((GPIO_PORTQ_DATA_R & 0x2) == 0x2)
		{
			character = on_message;
			while(*character != '\0')
			{
				transmit_data(*character);
				character++;
			}
		}
		
		else
		{
			character = off_message;
			while(*character != '\0')
			{
				transmit_data(*character);
				character++;
			}
		}
	}
	
	else if(data == '3')
	{
		GPIO_PORTQ_DATA_R = GPIO_PORTQ_DATA_R ^ 0x4;
		
		transmit_data(data);
		
		if((GPIO_PORTQ_DATA_R & 0x4) == 0x4)
		{
			character = on_message;
			while(*character != '\0')
			{
				transmit_data(*character);
				character++;
			}
		}
		
		else
		{
			character = off_message;
			while(*character != '\0')
			{
				transmit_data(*character);
				character++;
			}
		}
	}
	
	else if(data == '4')
	{
		GPIO_PORTQ_DATA_R = GPIO_PORTQ_DATA_R ^ 0x8;
		
		transmit_data(data);
		
		if((GPIO_PORTQ_DATA_R & 0x8) == 0x8)
		{
			character = on_message;
			while(*character != '\0')
			{
				transmit_data(*character);
				character++;
			}
		}
		
		else
		{
			character = off_message;
			while(*character != '\0')
			{
				transmit_data(*character);
				character++;
			}
		}
	}
}

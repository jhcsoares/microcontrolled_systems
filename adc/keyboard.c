#include <stdint.h>

#include "tm4c1294ncpdt.h"

void SysTick_Wait1ms(uint32_t delay);

char read_keyboard(void)
{
	GPIO_PORTM_DIR_R = 0x17;
	SysTick_Wait1ms(5);
	GPIO_PORTM_DATA_R = 0x0;
	
	char pressed_button = 0;
	
	if(GPIO_PORTL_DATA_R == 0xE)
		pressed_button = '1';
	else if(GPIO_PORTL_DATA_R == 0xD)
		pressed_button = '4';
	else if(GPIO_PORTL_DATA_R == 0xB)
		pressed_button = '7';
	else if(GPIO_PORTL_DATA_R == 0x7)
		pressed_button = '*';
	
	if(GPIO_PORTL_DATA_R != 0xF)
		SysTick_Wait1ms(500);
	
	GPIO_PORTM_DIR_R = 0x27;
	SysTick_Wait1ms(5);
	GPIO_PORTM_DATA_R = 0x0;
	
	if(GPIO_PORTL_DATA_R == 0xE)
		pressed_button = '2';
	else if(GPIO_PORTL_DATA_R == 0xD)
		pressed_button = '5';
	else if(GPIO_PORTL_DATA_R == 0xB)
		pressed_button = '8';
	else if(GPIO_PORTL_DATA_R == 0x7)
		pressed_button = '0';
	
	if(GPIO_PORTL_DATA_R != 0xF)
		SysTick_Wait1ms(500);
	
	GPIO_PORTM_DIR_R = 0x47;
	SysTick_Wait1ms(5);
	GPIO_PORTM_DATA_R = 0x0;
	
	if(GPIO_PORTL_DATA_R == 0xE)
		pressed_button = '3';
	else if(GPIO_PORTL_DATA_R == 0xD)
		pressed_button = '6';
	else if(GPIO_PORTL_DATA_R == 0xB)
		pressed_button = '9';
	else if(GPIO_PORTL_DATA_R == 0x7)
		pressed_button = '#';
	
	if(GPIO_PORTL_DATA_R != 0xF)
		SysTick_Wait1ms(500);
	
	GPIO_PORTM_DIR_R = 0x87;
	SysTick_Wait1ms(5);
	GPIO_PORTM_DATA_R = 0x0;
	
	if(GPIO_PORTL_DATA_R == 0xE)
		pressed_button = 'A';
	else if(GPIO_PORTL_DATA_R == 0xD)
		pressed_button = 'B';
	else if(GPIO_PORTL_DATA_R == 0xB)
		pressed_button = 'C';
	else if(GPIO_PORTL_DATA_R == 0x7)
		pressed_button = 'D';
	
	if(GPIO_PORTL_DATA_R != 0xF)
		SysTick_Wait1ms(500);
	
	GPIO_PORTM_DIR_R = 0x7;
	
	return pressed_button;
}

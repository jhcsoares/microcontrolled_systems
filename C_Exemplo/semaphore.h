#include <stdint.h>
#include "gpio.c"

void SysTick_Wait1ms(uint32_t delay);
void set_leds(uint8_t current_state);

typedef enum 
{
	STATE_0,
	STATE_1,
	STATE_2,
	STATE_3,
	STATE_4,
	STATE_5
} semaphores_states;

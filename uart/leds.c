#include <stdint.h>

#include "tm4c1294ncpdt.h"

#define LED1 (*((volatile uint8_t *)0x40005000))
#define LED2 (*((volatile uint8_t *)0x40005001))
#define LED3 (*((volatile uint8_t *)0x40005002))
#define LED4 (*((volatile uint8_t *)0x40005003))

void leds_state_init(void)
{
	LED1 = 0x0;
	LED2 = 0x0;
	LED3 = 0x0;
	LED4 = 0x0;
}

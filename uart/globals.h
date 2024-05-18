#ifndef __GLOBALS_H__
#define __GLOBALS_H__

#include <stdint.h>

typedef enum
{
	STATE_0,
	STATE_1,
	STATE_2,
	STATE_3
} states;

extern uint8_t rounds;
extern uint8_t is_clockwise;
extern uint8_t is_complete_step;
extern uint8_t leds_array[8];
extern uint8_t interrupt;

#endif // __GLOBALS_H__

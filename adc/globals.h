#ifndef __GLOBALS_H__
#define __GLOBALS_H__

#include <stdint.h>

typedef enum
{
	STATE_0,
	STATE_1,
	STATE_2a,
	STATE_2b,
	STATE_3b,
} states;

extern states states_machine;
extern uint8_t pwm_high;
extern uint8_t motor_mode;
extern int8_t motor_direction;
extern uint8_t usr_sw_1_pressed;
extern uint8_t usr_sw_2_pressed;
extern uint8_t timer_counter;
extern uint8_t changed_direction;
extern int8_t duty_cycle_step;
extern uint16_t duty_cycle_increment;
extern uint8_t state_2b_timer_flag;

#endif // __GLOBALS_H__

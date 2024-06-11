#include <stdint.h>
#include <stdlib.h>

#include "tm4c1294ncpdt.h"
#include "globals.h"

void Timer2A_Handler(void);
void state_3b_time_handler(uint8_t timer_counter);
void state_2a_time_handler(uint8_t timer_counter);

void lcd_print_string(char* s);
void print_motor_info_keyboard(uint8_t duty_cycle);
void print_motor_info_potentiometer(int8_t duty_cycle);
uint16_t potenciometer_analog_read(void);


void timer_setup(void)
{
	SYSCTL_RCGCTIMER_R = 0x4;
	while(SYSCTL_PRTIMER_R != 0x4);
	
	TIMER2_CTL_R = 0x0; //disable
	
	TIMER2_CFG_R = 0x0; //32 bits mode
	
	TIMER2_TAMR_R = 0x2; //periodic mode
	
	TIMER2_TAILR_R = 7999999;
	
	TIMER2_TAPR_R = 0x0; //wont use prescale mode
	
	TIMER2_IMR_R = 0x1; //enable interrupt
	
	NVIC_PRI5_R = 0x80000000; //priority
	
	NVIC_EN0_R = 0x800000; //enable interrupt nvic
}

void Timer2A_Handler(void)
{
	TIMER2_ICR_R = 0x1;
	
	timer_counter++;

	if(states_machine == STATE_3b || (states_machine == STATE_2b && state_2b_timer_flag))
	{
		uint8_t duty_cycle = (100*potenciometer_analog_read())/0xFFF;
	
		if(changed_direction)
		{
			duty_cycle_increment++;
			
			if(duty_cycle_increment > 0)
			{
				duty_cycle_step--;
				duty_cycle_increment = 0;
			}
			
			if(timer_counter > 50)
			{
				if(!state_2b_timer_flag)
					print_motor_info_keyboard(duty_cycle);
				
				else
				{
					char* motor_direction_msg = "HORARIO? 1 OU 0";
					lcd_print_string(motor_direction_msg);
				}
				
				timer_counter = 0;
			}
			
			if(duty_cycle_step == 0)
			{
				if(motor_direction == 0)
					motor_direction = 1;
				else
					motor_direction = 0;
			}
				
			if(pwm_high)
			{
				TIMER2_TAILR_R = 7999999*((100-abs(duty_cycle_step)))/100; //timer count
				GPIO_PORTE_AHB_DATA_R = 0x0;
				pwm_high = 0;
			}
				
			else
			{
				TIMER2_TAILR_R = 7999999*abs(duty_cycle_step)/100; //timer count
				
				//clockwise
				if(motor_direction == 1)
					GPIO_PORTE_AHB_DATA_R = 0x1;
				
				//anti-clockwise
				else
					GPIO_PORTE_AHB_DATA_R = 0x2;
				
				pwm_high = 1;
			}
			
			if(abs(duty_cycle_step) >= duty_cycle)
				changed_direction = 0;
		}
		
		else
		{
			uint8_t duty_cycle = (100*potenciometer_analog_read())/0xFFF;
			
			if(timer_counter > 50)
			{
				if(!state_2b_timer_flag)
					print_motor_info_keyboard(duty_cycle);
				
				else
				{
					char* motor_direction_msg = "HORARIO? 1 OU 0";
					lcd_print_string(motor_direction_msg);
				}

				timer_counter = 0;
			}
			
			if(pwm_high)
			{
				TIMER2_TAILR_R = 7999999*((100-duty_cycle))/100; //timer count
				GPIO_PORTE_AHB_DATA_R = 0x0;
				pwm_high = 0;
			}
			
			else
			{
				TIMER2_TAILR_R = 7999999*duty_cycle/100; //timer count
				
				//clockwise
				if(motor_direction == 1)
					GPIO_PORTE_AHB_DATA_R = 0x1;
				
				//anti-clockwise
				else
					GPIO_PORTE_AHB_DATA_R = 0x2;
				
				pwm_high = 1;
			}
		}
	}
	
	else
	{
		int8_t duty_cycle = (200*potenciometer_analog_read())/0xFFF - 100;
		
		if(timer_counter > 50)
		{
			print_motor_info_potentiometer(duty_cycle);
			timer_counter = 0;
		}
		
		if(pwm_high)
		{
			TIMER2_TAILR_R = 7999999*((100-abs(duty_cycle)))/100; //timer count
			GPIO_PORTE_AHB_DATA_R = 0x0;
			pwm_high = 0;
		}
		
		else
		{
			TIMER2_TAILR_R = 7999999*abs(duty_cycle)/100; //timer count
			
			//clockwise
			if(potenciometer_analog_read() > 0xFFF/2)
				GPIO_PORTE_AHB_DATA_R = 0x1;
			
			//anti-clockwise
			else
				GPIO_PORTE_AHB_DATA_R = 0x2;
			
			pwm_high = 1;
		}
	}

	return;
}

void state_3b_time_handler(uint8_t timer_counter)
{
	timer_counter++;
	
	uint8_t duty_cycle = (100*potenciometer_analog_read())/0xFFF;
	
	if(changed_direction)
	{
		duty_cycle_step++;
			
		if(pwm_high)
		{
			TIMER2_TAILR_R = 7999999*((100-abs(duty_cycle_step)))/100; //timer count
			GPIO_PORTE_AHB_DATA_R = 0x0;
			pwm_high = 0;
		}
			
		else
		{
			TIMER2_TAILR_R = 7999999*abs(duty_cycle_step)/100; //timer count
			
			//clockwise
		if(motor_direction == 1)
			GPIO_PORTE_AHB_DATA_R = 0x1;
		
		//anti-clockwise
		else
			GPIO_PORTE_AHB_DATA_R = 0x2;
			
			pwm_high = 1;
		}
		
		if(duty_cycle_step >= duty_cycle)
		{
			changed_direction = 0;
			duty_cycle_step = 0;
		}
	}
		
	if(timer_counter > 50)
	{
		print_motor_info_keyboard(duty_cycle);
		timer_counter = 0;
	}
	
	if(pwm_high)
	{
		TIMER2_TAILR_R = 7999999*((100-duty_cycle))/100; //timer count
		GPIO_PORTE_AHB_DATA_R = 0x0;
		pwm_high = 0;
	}
	
	else
	{
		TIMER2_TAILR_R = 7999999*duty_cycle/100; //timer count
		
		//clockwise
		if(motor_direction == 1)
			GPIO_PORTE_AHB_DATA_R = 0x1;
		
		//anti-clockwise
		else
			GPIO_PORTE_AHB_DATA_R = 0x2;
		
		pwm_high = 1;
	}
}

void state_2a_time_handler(uint8_t timer_counter)
{
	timer_counter++;
	
	int8_t duty_cycle = (200*potenciometer_analog_read())/0xFFF - 100;
		
	if(timer_counter > 50)
	{
		print_motor_info_potentiometer(duty_cycle);
		timer_counter = 0;
	}
	
	if(pwm_high)
	{
		TIMER2_TAILR_R = 7999999*((100-abs(duty_cycle)))/100; //timer count
		GPIO_PORTE_AHB_DATA_R = 0x0;
		pwm_high = 0;
	}
	
	else
	{
		TIMER2_TAILR_R = 7999999*abs(duty_cycle)/100; //timer count
		
		//clockwise
		if(potenciometer_analog_read() > 0xFFF/2)
			GPIO_PORTE_AHB_DATA_R = 0x1;
		
		//anti-clockwise
		else
			GPIO_PORTE_AHB_DATA_R = 0x2;
		
		pwm_high = 1;
	}
}

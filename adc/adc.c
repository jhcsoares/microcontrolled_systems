#include <stdint.h>

#include "tm4c1294ncpdt.h"

void adc_setup(void)
{
	//ADC setup
	
	SYSCTL_RCGCADC_R = 0x1;
	
	while(SYSCTL_PRADC_R != SYSCTL_RCGCADC_R);
	
	ADC0_PC_R = 0x7;
	
	ADC0_ACTSS_R = 0x0 << 3;
	
	ADC0_EMUX_R = 0000;
	
	ADC0_SSMUX3_R = 0x9;
	
	ADC0_SSCTL3_R = 0x6;
	
	ADC0_ACTSS_R = 0x1 << 3;
}

uint16_t potenciometer_analog_read(void)
{
	ADC0_PSSI_R = 0x8;
	
	while(!ADC0_RIS_R);
	
	uint16_t analog_value = ADC0_SSFIFO3_R;
	
	ADC0_ISC_R = 0x1;
	
	return analog_value;
}


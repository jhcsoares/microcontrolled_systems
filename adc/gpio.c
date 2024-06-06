// gpio.c
// Desenvolvido para a placa EK-TM4C1294XL
// Inicializa as portas J e N
// Prof. Guilherme Peron


#include <stdint.h>

#include "tm4c1294ncpdt.h"

  
#define GPIO_PORTA  (0x1) //bit 1
#define GPIO_PORTE  (0x1 << 4) //bit 14

// -------------------------------------------------------------------------------
void gpio_setup(void)
{
	//1a. Ativar o clock para a porta setando o bit correspondente no registrador RCGCGPIO
	SYSCTL_RCGCGPIO_R = GPIO_PORTA | GPIO_PORTE;
	
	//1b.   após isso verificar no PRGPIO se a porta está pronta para uso.
  while((SYSCTL_PRGPIO_R & (GPIO_PORTA | GPIO_PORTE)) != (GPIO_PORTA | GPIO_PORTE));
	
	// 2. Setar o AMSEL para habilitar a analógica
	GPIO_PORTA_AHB_AMSEL_R = 0x0;
	GPIO_PORTE_AHB_AMSEL_R = 0x1 << 4;
	
	GPIO_PORTA_AHB_PCTL_R = 0x11;
	
	// 4. Direção
	GPIO_PORTE_AHB_DIR_R = 0x0 << 4;
	GPIO_PORTA_AHB_DIR_R = 0xF << 4;
		
	// 5. Setar os bits AFSEL para 1 para selecionar GPIO com função alternativa	
	GPIO_PORTA_AHB_AFSEL_R = 0x3;
		
	// 6. Setar os bits de DEN para habilitar I/O digital	
	GPIO_PORTE_AHB_DEN_R = 0x0;  
	GPIO_PORTA_AHB_DEN_R = 0xF3;
	
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

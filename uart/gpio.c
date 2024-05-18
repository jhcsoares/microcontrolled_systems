// gpio.c
// Desenvolvido para a placa EK-TM4C1294XL
// Inicializa as portas J e N
// Prof. Guilherme Peron


#include <stdint.h>

#include "tm4c1294ncpdt.h"

  
#define GPIO_PORTA  (0x1) //bit 1
#define GPIO_PORTH  (0x1 << 7) //bit 6
#define GPIO_PORTJ  (0x1 << 8) //bit 7
#define GPIO_PORTP  (0x1 << 13) //bit 14
#define GPIO_PORTQ  (0x1 << 14) //bit 15

// -------------------------------------------------------------------------------
void gpio_setup(void)
{
	//1a. Ativar o clock para a porta setando o bit correspondente no registrador RCGCGPIO
	SYSCTL_RCGCGPIO_R = GPIO_PORTA | GPIO_PORTH | GPIO_PORTJ | GPIO_PORTP | GPIO_PORTQ;
	//1b.   após isso verificar no PRGPIO se a porta está pronta para uso.
  while((SYSCTL_PRGPIO_R & (GPIO_PORTA | GPIO_PORTH | GPIO_PORTJ | GPIO_PORTP | GPIO_PORTQ)) != (GPIO_PORTA | GPIO_PORTH | GPIO_PORTJ | GPIO_PORTP | GPIO_PORTQ));
	
	// 2. Limpar o AMSEL para desabilitar a analógica
	GPIO_PORTA_AHB_AMSEL_R = 0x0;
	GPIO_PORTH_AHB_AMSEL_R = 0x0;
	GPIO_PORTJ_AHB_AMSEL_R = 0x0;
	GPIO_PORTP_AMSEL_R = 0x0;
	GPIO_PORTQ_AMSEL_R = 0x0;
		
	// 3. Setar PCTL para selecionar o GPIO
	GPIO_PORTA_AHB_PCTL_R = 0x11;
	GPIO_PORTH_AHB_PCTL_R = 0x0;
	GPIO_PORTJ_AHB_PCTL_R = 0x0;
	GPIO_PORTP_PCTL_R = 0x0;
	GPIO_PORTQ_PCTL_R = 0x0;
	
	// 4. Direção
	GPIO_PORTA_AHB_DIR_R = 0xF << 4;
	GPIO_PORTH_AHB_DIR_R = 0xF;
	GPIO_PORTJ_AHB_DIR_R = 0x0;
	GPIO_PORTP_DIR_R = 0x20;
	GPIO_PORTQ_DIR_R = 0xF;
		
	// 5. Setar os bits AFSEL para 0 para selecionar GPIO sem função alternativa	
	GPIO_PORTA_AHB_AFSEL_R = 0x3;
	GPIO_PORTH_AHB_AFSEL_R = 0x0;
	GPIO_PORTJ_AHB_AFSEL_R = 0x0;
	GPIO_PORTP_AFSEL_R = 0x0;
	GPIO_PORTQ_AFSEL_R = 0x0;
		
	// 6. Setar os bits de DEN para habilitar I/O digital	
	GPIO_PORTA_AHB_DEN_R = 0xF3;  
	GPIO_PORTH_AHB_DEN_R = 0xF;	
	GPIO_PORTJ_AHB_DEN_R = 0x1;
	GPIO_PORTP_DEN_R = 0x20;
	GPIO_PORTQ_DEN_R = 0xF;
	
	GPIO_PORTJ_AHB_PUR_R = 0x1;
	
	GPIO_PORTP_DATA_R = 0x20;
}

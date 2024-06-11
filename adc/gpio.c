// gpio.c
// Desenvolvido para a placa EK-TM4C1294XL
// Inicializa as portas J e N
// Prof. Guilherme Peron


#include <stdint.h>

#include "tm4c1294ncpdt.h"

  
#define GPIO_PORTA  (0x1) 
#define GPIO_PORTE  (0x1 << 4) 
#define GPIO_PORTJ  (0x1 << 8) 
#define GPIO_PORTK  (0x1 << 9)
#define GPIO_PORTL  (0x1 << 10)
#define GPIO_PORTM  (0x1 << 11)

// -------------------------------------------------------------------------------
void gpio_setup(void)
{
	//1a. Ativar o clock para a porta setando o bit correspondente no registrador RCGCGPIO
	SYSCTL_RCGCGPIO_R = GPIO_PORTA | GPIO_PORTE | GPIO_PORTJ | GPIO_PORTK | GPIO_PORTL | GPIO_PORTM;
	
	//1b.   após isso verificar no PRGPIO se a porta está pronta para uso.
  while((SYSCTL_PRGPIO_R & (GPIO_PORTA | GPIO_PORTE | GPIO_PORTJ | GPIO_PORTK | GPIO_PORTL | GPIO_PORTM)) != (GPIO_PORTA | GPIO_PORTE | GPIO_PORTJ | GPIO_PORTK | GPIO_PORTL | GPIO_PORTM));
	
	// 2. Setar o AMSEL para habilitar a analógica
	GPIO_PORTA_AHB_AMSEL_R = 0x0;
	GPIO_PORTE_AHB_AMSEL_R = (0x1 << 4) | (0x0);
	GPIO_PORTJ_AHB_AMSEL_R = 0x0;
	GPIO_PORTK_AMSEL_R = 0x0;
	GPIO_PORTL_AMSEL_R = 0x0;
	GPIO_PORTM_AMSEL_R = 0x0;
	
	// 3. PCTL
	GPIO_PORTA_AHB_PCTL_R = 0x11;
	GPIO_PORTJ_AHB_PCTL_R = 0x0;
	GPIO_PORTK_PCTL_R = 0x0;
	GPIO_PORTL_PCTL_R = 0x0;
	GPIO_PORTM_PCTL_R = 0x0;
	
	// 4. Direção
	GPIO_PORTA_AHB_DIR_R = 0xF << 4;
	GPIO_PORTE_AHB_DIR_R = (0x0 << 4) | (0x3);
	GPIO_PORTJ_AHB_DIR_R = 0x0;
	GPIO_PORTK_DIR_R = 0xFF;
	GPIO_PORTL_DIR_R = 0x0;
	GPIO_PORTM_DIR_R = 0x7;
	
		
	// 5. Setar os bits AFSEL para 1 para selecionar GPIO com função alternativa	
	GPIO_PORTA_AHB_AFSEL_R = 0x3;
	GPIO_PORTJ_AHB_AFSEL_R = 0x0;
	GPIO_PORTK_AFSEL_R = 0x0;
	GPIO_PORTL_AFSEL_R = 0x0;
	GPIO_PORTM_AFSEL_R = 0x0;
		
	// 6. Setar os bits de DEN para habilitar I/O digital	
	GPIO_PORTA_AHB_DEN_R = 0xF3;
	GPIO_PORTE_AHB_DEN_R = 0x0 | 0x3;  
	GPIO_PORTJ_AHB_DEN_R = 0x3;
	GPIO_PORTK_DEN_R = 0xFF;
	GPIO_PORTL_DEN_R = 0xF;
	GPIO_PORTM_DEN_R = 0xF7;
	
	// 7. Pull-up resistors
	GPIO_PORTJ_AHB_PUR_R = 0x3;
	GPIO_PORTL_PUR_R = 0xF;
}

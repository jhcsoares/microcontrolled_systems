// gpio.c
// Desenvolvido para a placa EK-TM4C1294XL
// Inicializa as portas J e N
// Prof. Guilherme Peron


#include <stdint.h>

#include "tm4c1294ncpdt.h"

  
#define GPIO_PORTA  (0x1) //bit 1
#define GPIO_PORTP  (0x1 << 13) //bit 14
#define GPIO_PORTQ  (0x1 << 14) //bit 15

// -------------------------------------------------------------------------------
void UART_Init(void)
{
	SYSCTL_RCGCUART_R = GPIO_PORTA;
	
	while(SYSCTL_PRUART_R != 0x1);
	
	UART0_CTL_R = 0x0;
	
	UART0_IBRD_R = 0x56;
	
	UART0_FBRD_R = 0x34;
	
	uint8_t wlen = 0x3 << 5;
	uint8_t fen = 0x1 << 4;
	uint8_t stp2_en = 0x1 << 3;
	uint8_t eps_en = 0x1 << 2;
	uint8_t pen = 0x1 << 1;
	
	UART0_LCRH_R = UART0_LCRH_R | wlen | fen | stp2_en | eps_en | pen;
	
	UART0_CC_R = 0;
	
	uint8_t uart_en = 0x1;
	uint16_t rx_en = 0x1 << 8;
	uint16_t tx_en = 0x1 << 9;
	
	UART0_CTL_R = UART0_CTL_R | rx_en | tx_en | uart_en;
	

}

void GPIO_Init(void)
{
	//1a. Ativar o clock para a porta setando o bit correspondente no registrador RCGCGPIO
	SYSCTL_RCGCGPIO_R = GPIO_PORTA | GPIO_PORTP | GPIO_PORTQ;
	//1b.   após isso verificar no PRGPIO se a porta está pronta para uso.
  while((SYSCTL_PRGPIO_R & (GPIO_PORTA | GPIO_PORTP | GPIO_PORTQ)) != (GPIO_PORTA | GPIO_PORTP | GPIO_PORTQ));
	
	// 2. Limpar o AMSEL para desabilitar a analógica
	GPIO_PORTA_AHB_AMSEL_R = 0x00;
	GPIO_PORTP_AMSEL_R = 0x00;
	GPIO_PORTQ_AMSEL_R = 0x00;
		
	// 3. Setar PCTL para selecionar o GPIO
	GPIO_PORTA_AHB_PCTL_R = 0x11;
	GPIO_PORTP_PCTL_R = 0x0;
	GPIO_PORTQ_PCTL_R = 0x0;
	
	// 4. Direção
	GPIO_PORTP_DIR_R = 0x20;
	GPIO_PORTQ_DIR_R = 0xF;
		
	// 5. Setar os bits AFSEL para 0 para selecionar GPIO com função alternativa	
	GPIO_PORTA_AHB_AFSEL_R = 0x3;
	GPIO_PORTP_AFSEL_R = 0x0;
	GPIO_PORTQ_AFSEL_R = 0x0;
		
	// 6. Setar os bits de DEN para habilitar I/O digital	
	GPIO_PORTA_AHB_DEN_R = 0x3;   //Bit0 e bit1
	GPIO_PORTP_DEN_R = 0x20;
	GPIO_PORTQ_DEN_R = 0xF;
	
	//Saturate Transistor
	GPIO_PORTP_DATA_R = 0x20;
}

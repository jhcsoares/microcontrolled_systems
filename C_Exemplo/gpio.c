// gpio.c
// Desenvolvido para a placa EK-TM4C1294XL
// Inicializa as portas J e N
// Prof. Guilherme Peron


#include <stdint.h>

#include "tm4c1294ncpdt.h"

  
#define GPIO_PORTA  (0x0001) //bit 0
#define GPIO_PORTJ  (0x0100) //bit 8
#define GPIO_PORTP  (0x2000) //bit 13
#define GPIO_PORTQ  (0x4000) //bit 14

// -------------------------------------------------------------------------------
// Função GPIO_Init
// Inicializa os ports J e N
// Parâmetro de entrada: Não tem
// Parâmetro de saída: Não tem
void GPIO_Init(void)
{
	//1a. Ativar o clock para a porta setando o bit correspondente no registrador RCGCGPIO
	SYSCTL_RCGCGPIO_R = (GPIO_PORTA | GPIO_PORTJ | GPIO_PORTP | GPIO_PORTQ);
	//1b.   após isso verificar no PRGPIO se a porta está pronta para uso.
  while((SYSCTL_PRGPIO_R & (GPIO_PORTA | GPIO_PORTJ | GPIO_PORTP | GPIO_PORTQ) != (GPIO_PORTA | GPIO_PORTJ | GPIO_PORTP | GPIO_PORTQ))){};
	
	// 2. Limpar o AMSEL para desabilitar a analógica
	GPIO_PORTA_AHB_AMSEL_R = 0x00;
	GPIO_PORTJ_AHB_AMSEL_R = 0x00;
	GPIO_PORTP_AMSEL_R = 0x00;
	GPIO_PORTQ_AMSEL_R = 0x00;
		
	// 3. Limpar PCTL para selecionar o GPIO
	GPIO_PORTA_AHB_PCTL_R = 0x00;
	GPIO_PORTJ_AHB_PCTL_R = 0x00;
	GPIO_PORTP_PCTL_R = 0x00;
	GPIO_PORTQ_PCTL_R = 0x00;

	// 4. DIR para 0 se for entrada, 1 se for saída
	GPIO_PORTA_AHB_DIR_R = 0xF0;
	GPIO_PORTJ_AHB_DIR_R = 0x00;
	GPIO_PORTP_DIR_R = 0x20; 
	GPIO_PORTQ_DIR_R = 0x07; 
		
	// 5. Limpar os bits AFSEL para 0 para selecionar GPIO sem função alternativa	
	GPIO_PORTA_AHB_AFSEL_R = 0x00;
	GPIO_PORTJ_AHB_AFSEL_R = 0x00;
	GPIO_PORTP_AFSEL_R = 0x00; 
	GPIO_PORTQ_AFSEL_R = 0x00; 
		
	// 6. Setar os bits de DEN para habilitar I/O digital	
	GPIO_PORTA_AHB_DEN_R = 0xF0;
	GPIO_PORTJ_AHB_DEN_R = 0x01;
	GPIO_PORTP_DEN_R = 0x20; 
	GPIO_PORTQ_DEN_R = 0x07; 
	
	// 7. Habilitar resistor de pull-up interno, setar PUR para 1
	GPIO_PORTJ_AHB_PUR_R = 0x01;   //Bit0 e bit1	
}	

// -------------------------------------------------------------------------------
// Função PortJ_Input
// Lê os valores de entrada do port J
// Parâmetro de entrada: Não tem
// Parâmetro de saída: o valor da leitura do port
uint32_t PortJ_Input(void)
{
	return GPIO_PORTJ_AHB_DATA_R;
}

// -------------------------------------------------------------------------------
void PortA_Output(uint8_t value)
{
    GPIO_PORTA_AHB_DATA_R = value; 
}

void PortP_Output(uint8_t value)
{
    GPIO_PORTP_DATA_R = value; 
}

void PortQ_Output(uint8_t value)
{
    GPIO_PORTQ_DATA_R = value; 
}

void PortN_Output(uint8_t value)
{
    GPIO_PORTN_DATA_R = value; 
}

// main.c
// Desenvolvido para a placa EK-TM4C1294XL
// Verifica o estado das chaves USR_SW1 e USR_SW2, acende os LEDs 1 e 2 caso estejam pressionadas independentemente
// Caso as duas chaves estejam pressionadas ao mesmo tempo pisca os LEDs alternadamente a cada 500ms.
// Prof. Guilherme Peron

#include <stdint.h>

void PLL_Init(void);
void GPIO_Init(void);
void UART_Init(void);
uint8_t receive_data(void);
void transmit_data(uint8_t data);
void change_led_state(uint8_t data);

int main(void)
{
	uint8_t received_data;
	PLL_Init();
	UART_Init();
	GPIO_Init();
	while (1)
	{
		received_data = receive_data();
		
		if(received_data != 0)
		{
			change_led_state(received_data);
		}
	}
}

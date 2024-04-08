; gpio.s
; Desenvolvido para a placa EK-TM4C1294XL
; Jo�o Henrique Campos Soares - Denise Motobayashi
; 19/03/2018

; -------------------------------------------------------------------------------
        THUMB                        ; Instru��es do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declara��es EQU - Defines

;RAM
GPIO_PORTA_AHB_DATA_R       EQU     0x400583FC
GPIO_PORTB_AHB_DATA_R       EQU     0x400593FC
GPIO_PORTP_DATA_R           EQU     0x400653FC
GPIO_PORTQ_DATA_R           EQU     0x400663FC

; -------------------------------------------------------------------------------
; �rea de C�digo - Tudo abaixo da diretiva a seguir ser� armazenado na mem�ria de 
;                  c�digo
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma fun��o do arquivo for chamada em outro arquivo	
        EXPORT Timer
		IMPORT SysTick_Wait1ms

;--------------------------------------------------------------------------------
Timer
	
	
	BX LR
		
	ALIGN                           ; garante que o fim da se��o est� alinhada 
    END  
		
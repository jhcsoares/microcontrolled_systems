; gpio.s
; Desenvolvido para a placa EK-TM4C1294XL
; João Henrique Campos Soares - Denise Motobayashi
; 19/03/2018

; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declarações EQU - Defines

;RAM
GPIO_PORTA_AHB_DATA_R       EQU     0x400583FC
GPIO_PORTB_AHB_DATA_R       EQU     0x400593FC
GPIO_PORTP_DATA_R           EQU     0x400653FC
GPIO_PORTQ_DATA_R           EQU     0x400663FC

; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT Timer

;--------------------------------------------------------------------------------
Timer
	MOV R11, #0X0000
	MOVT R11, #0X0005
	MOV R12, #0
LOOP
	ADD R12, R12, #1
	CMP R12, R11
	BLE LOOP
	
	BX LR
		
	ALIGN                           ; garante que o fim da seção está alinhada 
    END  
		
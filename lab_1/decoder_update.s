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
        EXPORT DecoderUpdate
		IMPORT SysTick_Wait1ms

;--------------------------------------------------------------------------------
;ARGUMENT: R0 (DSX_STATE)
DecoderUpdate
	LDR R1, =GPIO_PORTA_AHB_DATA_R
	LDR R2, =GPIO_PORTQ_DATA_R 
	
	CMP R0, #0
	ITTTT EQ
		MOVEQ R3, #2_00110000
		MOVEQ R4, #2_00001111
		STREQ R3, [R1]
		STREQ R4, [R2]
	
	CMP R0, #1
	ITTTT EQ
		MOVEQ R3, #2_00000000
		MOVEQ R4, #2_00000110
		STREQ R3, [R1]
		STREQ R4, [R2]
	
	CMP R0, #2
	ITTTT EQ
		MOVEQ R3, #2_01010000
		MOVEQ R4, #2_00001011
		STREQ R3, [R1]
		STREQ R4, [R2]
	
	CMP R0, #3
	ITTTT EQ
		MOVEQ R3, #2_01000000
		MOVEQ R4, #2_00001111
		STREQ R3, [R1]
		STREQ R4, [R2]
	
	CMP R0, #4
	ITTTT EQ
		MOVEQ R3, #2_01100000
		MOVEQ R4, #2_00000110
		STREQ R3, [R1]
		STREQ R4, [R2]
	
	CMP R0, #5
	ITTTT EQ
		MOVEQ R3, #2_01100000
		MOVEQ R4, #2_00001101
		STREQ R3, [R1]
		STREQ R4, [R2]
	
	CMP R0, #6
	ITTTT EQ
		MOVEQ R3, #2_01110000
		MOVEQ R4, #2_00001101
		STREQ R3, [R1]
		STREQ R4, [R2]
	
	CMP R0, #7
	ITTTT EQ
		MOVEQ R3, #2_00000000
		MOVEQ R4, #2_00000111
		STREQ R3, [R1]
		STREQ R4, [R2]
	
	CMP R0, #8
	ITTTT EQ
		MOVEQ R3, #2_01110000
		MOVEQ R4, #2_00001111
		STREQ R3, [R1]
		STREQ R4, [R2]
	
	CMP R0, #9
	ITTTT EQ
		MOVEQ R3, #2_01100000
		MOVEQ R4, #2_00000111
		STREQ R3, [R1]
		STREQ R4, [R2]
	
	;SATURATE TRANSISTOR
	LDR R4, =GPIO_PORTB_AHB_DATA_R
	STR R5, [R4]
	
	MOV R0, #1
	PUSH {LR}
	BL SysTick_Wait1ms
	POP {LR}
	
	MOV R0, #0X00
	STR R0, [R4]
	
	MOV R0, #1
	PUSH {LR}
	BL SysTick_Wait1ms
	POP {LR}

	BX LR
		
	ALIGN                           ; garante que o fim da seção está alinhada 
    END  
; gpio.s
; Desenvolvido para a placa EK-TM4C1294XL
; João Henrique - Denise
; 19/03/2018

; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declarações EQU - Defines
; ========================

;RAM
USR_SW1_STATE			EQU	   0x20000402
USR_SW2_STATE			EQU	   0x20000403
DS1_STATE				EQU	   0x20000404
DS2_STATE				EQU	   0x20000405
; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT Decoder
; -------------------------------------------------------------------------------
Decoder
	LDR R0, =USR_SW1_STATE
	LDRB R1, [R0] ;STORE STEP
	
	LDR R0, =USR_SW1_STATE
	LDRB R2, [R0] ;STORE STEP DIRECTION
	
	LDR R0, =DS1_STATE
	LDRB R3, [R0] 
	
	LDR R0, =DS2_STATE
	LDRB R4, [R0] 
	
	;========================================================================;
	LDRB R5, [R3]
	LDRB R6, [R4]
	MOV R7, #10
	MUL R7, R7, R6
	ADD R7, R7, R5
	
;	CMP R2, #1
;	ITE EQ
;		ADDEQ R7, R7, R1
;		SUBNE R7, R7, R1
;	
;	CMP R7, #100
;	IT HS
;		SUBHS R7, #100
;	
;	CMP R7, #0
;	IT LT
;		ADDLT R7, R7, #100
	
	MOV R6, #10
	UDIV R8, R7, R6
	MUL R8, R8, R6 ;DEZENA
	SUB R7, R7, R8 ;UNIDADE
	
	STRB R7, [R0]
	STRB R8, [R1]

	BX LR
	
	ALIGN                           ; garante que o fim da seção está alinhada 
    END  

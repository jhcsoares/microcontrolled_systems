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
        EXPORT RamInit
; -------------------------------------------------------------------------------
RamInit
	LDR R0, =LEDS_STATE
	MOV R1, #0
	STRB R1, [R0]
	
	LDR R0, =LEDS_INCREMENT
	MOV R1, #1
	STRB R1, [R0]
	
	LDR R0, =USR_SW1_STATE
	MOV R1, #1 ;1 STEP
	STRB R1, [R0]
	
	LDR R0, =USR_SW2_STATE
	MOV R1, #1 ;FORWARD
	STRB R1, [R0]
	
	LDR R0, =DS1_STATE
	MOV R1, #0 ;FORWARD
	STRB R1, [R0]
	
	LDR R0, =DS2_STATE
	MOV R1, #0 ;FORWARD
	STRB R1, [R0]
	
	BX LR
	
	ALIGN                           ; garante que o fim da seção está alinhada 
    END  

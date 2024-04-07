; gpio.s
; Desenvolvido para a placa EK-TM4C1294XL
; João Henrique Campos Soares - Denise Motobayashi
; 19/03/2018

; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declarações EQU - Defines

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
        EXPORT DisplayRoutine
		IMPORT PortJ_Input
		IMPORT Decoder
		IMPORT DecoderUpdate
		IMPORT  SysTick_Wait1ms	

;--------------------------------------------------------------------------------
DisplayRoutine
	PUSH {LR}
	BL PortJ_Input
	POP {LR}
	PUSH {LR}
	BL Decoder
	POP {LR}
	LDR R0, =DS2_STATE			
	LDRB R0, [R0]
	MOV R5, #2_00010000
	PUSH {LR}
	BL DecoderUpdate
	POP {LR}
	MOV R0, #50
	PUSH {LR}
	BL SysTick_Wait1ms
	POP {LR}
	LDR R0, =DS1_STATE			
	LDRB R0, [R0]
	MOV R5, #2_00100000 	
	PUSH {LR}
	BL DecoderUpdate
	POP {LR}
	MOV R0, #50
	PUSH {LR}
	BL SysTick_Wait1ms
	POP {LR}
	BX LR
		
	ALIGN                           ; garante que o fim da seção está alinhada 
    END  
	
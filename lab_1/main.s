; main.s
; Desenvolvido para a placa EK-TM4C1294XL
; Prof. Guilherme Peron
; Ver 1 19/03/2018
; Ver 2 26/08/2018
; Este programa deve esperar o usu�rio pressionar uma chave.
; Caso o usu�rio pressione uma chave, um LED deve piscar a cada 1 segundo.

; -------------------------------------------------------------------------------
        THUMB                        ; Instru��es do tipo Thumb-2
; -------------------------------------------------------------------------------
		
; Declara��es EQU - Defines
DS1_STATE					EQU	   0x20000404
DS2_STATE					EQU	   0x20000405
GPIO_PORTP_DATA_R      		EQU    0x400653FC
GPIO_PORTB_AHB_DATA_R       EQU    0x400593FC
UPDATE_FLAG					EQU	   0x20000406
UPDATE_CURRENT_STATE		EQU	   0x2000040A
UPDATE_MAX_STATE			EQU	   0x2000040E
	
; ========================
; Defini��es de Valores

; -------------------------------------------------------------------------------
; �rea de Dados - Declara��es de vari�veis
		AREA  DATA, ALIGN=2
		; Se alguma vari�vel for chamada em outro arquivo
		;EXPORT  <var> [DATA,SIZE=<tam>]   ; Permite chamar a vari�vel <var> a 
		                                   ; partir de outro arquivo
;<var>	SPACE <tam>                        ; Declara uma vari�vel de nome <var>
                                           ; de <tam> bytes a partir da primeira 
                                           ; posi��o da RAM		

; -------------------------------------------------------------------------------
; �rea de C�digo - Tudo abaixo da diretiva a seguir ser� armazenado na mem�ria de 
;                  c�digo
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma fun��o do arquivo for chamada em outro arquivo	
        EXPORT Start                ; Permite chamar a fun��o Start a partir de 
			                        ; outro arquivo. No caso startup.s
									
		; Se chamar alguma fun��o externa	
        ;IMPORT <func>              ; Permite chamar dentro deste arquivo uma 
									; fun��o <func>
		IMPORT  PLL_Init
		IMPORT  SysTick_Init
		IMPORT  SysTick_Wait1ms			
		IMPORT  GPIO_Init
        IMPORT  PortJ_Input	
		IMPORT  PortJ_Interrupt	
		IMPORT 	UpdateLeds
		IMPORT  RamInit
		IMPORT  Decoder
		IMPORT  DecoderUpdate
			
; -------------------------------------------------------------------------------
; Fun��o main()
Start  			
	BL PLL_Init                  ;Chama a subrotina para alterar o clock do microcontrolador para 80MHz
	BL SysTick_Init              ;Chama a subrotina para inicializar o SysTick
	BL GPIO_Init                 ;Chama a subrotina que inicializa os GPIO
	BL RamInit
	
MainLoop
; ****************************************
; Escrever c�digo que l� o estado da chave, se ela estiver desativada apaga o LED
; Se estivar ativada chama a subrotina Pisca_LED
; ****************************************
	BL UpdateLeds
	
	;BL PortJ_Interrupt
	
	BL Decoder
	
	LDR R0, =DS2_STATE			
	LDRB R0, [R0]
	MOV R5, #2_00010000
	BL DecoderUpdate
		
	LDR R0, =DS1_STATE			
	LDRB R0, [R0]
	MOV R5, #2_00100000 	
	BL DecoderUpdate
	
	LDR R11, =UPDATE_FLAG
	MOV R12, #0
	STR R12, [R11]
	
	;=====================================================================;
	
	LDR R9, =UPDATE_CURRENT_STATE
	LDR R10, [R9]
	ADD R10, R10, #1
	STR R10, [R9]
	
	LDR R11, =UPDATE_MAX_STATE
	LDR R12, [R11]
	CMP R10, R12
	BLO MainLoop
	
	LDR R11, =UPDATE_CURRENT_STATE
	MOV R12, #0
	STR R12, [R11]
	
	LDR R11, =UPDATE_FLAG
	MOV R12, #1
	STR R12, [R11]
	
	BL PortJ_Input	
	
	B MainLoop
	
	ALIGN                           ; garante que o fim da se��o est� alinhada 
    END  

;-----------------------------------------------------------------------------------
; Fim do Arquivo
; -------------------------------------------------------------------------------------------------------------------------	
    ALIGN                        ;Garante que o fim da se��o est� alinhada 
    END                          ;Fim do arquivo

; gpio.s
; Desenvolvido para a placa EK-TM4C1294XL
; Prof. Guilherme Peron
; Ver 1 19/03/2018
; Ver 2 26/08/2018

; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
			
		EXPORT 						 GPIO_Init
		EXPORT						 PortN_Output
		EXPORT						 PortJ_Input
; -------------------------------------------------------------------------------
; Declarações EQU - Defines
; ========================
; ========================
; Definições dos Registradores Gerais
SYSCTL_RCGCGPIO_R	 EQU	0x400FE608
SYSCTL_PRGPIO_R		 EQU    0x400FEA08
; ========================
; Definições dos Ports
; PORT J
GPIO_PORTJ_AHB_LOCK_R    	EQU    0x40060520
GPIO_PORTJ_AHB_CR_R      	EQU    0x40060524
GPIO_PORTJ_AHB_AMSEL_R   	EQU    0x40060528
GPIO_PORTJ_AHB_PCTL_R    	EQU    0x4006052C
GPIO_PORTJ_AHB_DIR_R     	EQU    0x40060400
GPIO_PORTJ_AHB_AFSEL_R   	EQU    0x40060420
GPIO_PORTJ_AHB_DEN_R     	EQU    0x4006051C
GPIO_PORTJ_AHB_PUR_R     	EQU    0x40060510	
GPIO_PORTJ_AHB_DATA_R    	EQU    0x400603FC
GPIO_PORTJ               	EQU    2_000000100000000
; PORT N
GPIO_PORTN_AHB_LOCK_R    	EQU    0x40064520
GPIO_PORTN_AHB_CR_R      	EQU    0x40064524
GPIO_PORTN_AHB_AMSEL_R   	EQU    0x40064528
GPIO_PORTN_AHB_PCTL_R    	EQU    0x4006452C
GPIO_PORTN_AHB_DIR_R     	EQU    0x40064400
GPIO_PORTN_AHB_AFSEL_R   	EQU    0x40064420
GPIO_PORTN_AHB_DEN_R     	EQU    0x4006451C
GPIO_PORTN_AHB_PUR_R     	EQU    0x40064510	
GPIO_PORTN_AHB_DATA_R    	EQU    0x400643FC
GPIO_PORTN               	EQU    2_001000000000000	


; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT GPIO_Init            ; Permite chamar GPIO_Init de outro arquivo
		EXPORT PortN_Output			; Permite chamar PortN_Output de outro arquivo
		EXPORT PortJ_Input          ; Permite chamar PortJ_Input de outro arquivo
									

;--------------------------------------------------------------------------------
; Função GPIO_Init
; Parâmetro de entrada: Não tem
; Parâmetro de saída: Não tem
GPIO_Init
;=====================
; ****************************************
; Escrever função de inicialização dos GPIO
; Inicializar as portas J e N
; ****************************************
	LDR R0, =SYSCTL_RCGCGPIO_R
	MOV R1, #GPIO_PORTJ
	ORR R1, #GPIO_PORTN
	STR R1, [R0]
	
	LDR R0, =SYSCTL_PRGPIO_R
	
WAIT_UNTIL_PORT_IS_ENABLED
	LDR R2, [R0]
	TST R2, R1
	BEQ WAIT_UNTIL_PORT_IS_ENABLED
	
	MOV R1, #0X00
	LDR R0, =GPIO_PORTJ_AHB_AMSEL_R
	STR R1, [R0]
	LDR R0, =GPIO_PORTN_AHB_AMSEL_R
	STR R1, [R0]
	
	MOV R1, #0X00000000
	LDR R0, =GPIO_PORTJ_AHB_PCTL_R
	STR R1, [R0]
	LDR R0, =GPIO_PORTN_AHB_PCTL_R
	STR R1, [R0]
	
	LDR R0, =GPIO_PORTJ_AHB_DIR_R
	MOV R1, #2_00000000 ;LAST BIT MUST BE 0 (J0 IS AN OUTPUT PORT)
	STR R1, [R0]
	LDR R0, =GPIO_PORTN_AHB_DIR_R
	MOV R1, #2_00000010
	STR R1, [R0]
	
	MOV R1, #2_00000000
	LDR R0, =GPIO_PORTJ_AHB_AFSEL_R
	STR R1, [R0]
	LDR R0, =GPIO_PORTN_AHB_AFSEL_R
	STR R1, [R0]
	
	LDR R0, =GPIO_PORTJ_AHB_DEN_R
	MOV R1, #2_00000001
	STR R1, [R0]
	LDR R0, =GPIO_PORTN_AHB_DEN_R
	MOV R1, #2_00000010
	STR R1, [R0]
	
	LDR R0, =GPIO_PORTJ_AHB_PUR_R
	MOV R1, #2_00000001
	STR R1, [R0]
	
	BX LR

; -------------------------------------------------------------------------------
; Função PortN_Output
; Parâmetro de entrada: 
; Parâmetro de saída: Não tem
PortN_Output
; ****************************************
; Escrever função que acende ou apaga o LED
; ****************************************
	LDR R1, =GPIO_PORTN_AHB_DATA_R
	CMP R0, #0
	ITTEE EQ
		MOVEQ R0, #2_00000010
		STREQ R0, [R1]
		MOVNE R0, #2_00000000
		STRNE R0, [R1]
		
	BX LR
; -------------------------------------------------------------------------------
; Função PortJ_Input
; Parâmetro de entrada: Não tem
; Parâmetro de saída: R0 --> o valor da leitura
PortJ_Input
; ****************************************
; Escrever função que lê a chave e retorna 
; um registrador se está ativada ou não
; ****************************************
	LDR R1, =GPIO_PORTJ_AHB_DATA_R
	LDR R0, [R1]
	
	BX LR


    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo
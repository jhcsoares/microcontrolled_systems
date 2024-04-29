; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declarações EQU - Defines
;<NOME>         EQU <VALOR>
;PORT N
GPIO_PORTN_DATA_R           	EQU         0x400643FC

; PORT J
GPIO_PORTJ_AHB_DATA_BITS_R      EQU         0x40060000
GPIO_PORTJ_AHB_DATA_R           EQU         0x400603FC
GPIO_PORTJ_AHB_DIR_R            EQU         0x40060400
GPIO_PORTJ_AHB_IS_R             EQU         0x40060404
GPIO_PORTJ_AHB_IBE_R            EQU         0x40060408
GPIO_PORTJ_AHB_IEV_R            EQU         0x4006040C
GPIO_PORTJ_AHB_IM_R             EQU         0x40060410
GPIO_PORTJ_AHB_RIS_R            EQU         0x40060414
GPIO_PORTJ_AHB_MIS_R            EQU         0x40060418
GPIO_PORTJ_AHB_ICR_R            EQU         0x4006041C
GPIO_PORTJ_AHB_AFSEL_R          EQU         0x40060420
GPIO_PORTJ_AHB_DR2R_R           EQU         0x40060500
GPIO_PORTJ_AHB_DR4R_R           EQU         0x40060504
GPIO_PORTJ_AHB_DR8R_R           EQU         0x40060508
GPIO_PORTJ_AHB_ODR_R            EQU         0x4006050C
GPIO_PORTJ_AHB_PUR_R            EQU         0x40060510
GPIO_PORTJ_AHB_PDR_R            EQU         0x40060514
GPIO_PORTJ_AHB_SLR_R            EQU         0x40060518
GPIO_PORTJ_AHB_DEN_R            EQU         0x4006051C
GPIO_PORTJ_AHB_LOCK_R           EQU         0x40060520
GPIO_PORTJ_AHB_CR_R             EQU         0x40060524
GPIO_PORTJ_AHB_AMSEL_R          EQU         0x40060528
GPIO_PORTJ_AHB_PCTL_R           EQU         0x4006052C
GPIO_PORTJ_AHB_ADCCTL_R         EQU         0x40060530
GPIO_PORTJ_AHB_DMACTL_R         EQU         0x40060534
GPIO_PORTJ_AHB_SI_R             EQU         0x40060538
GPIO_PORTJ_AHB_DR12R_R          EQU         0x4006053C
GPIO_PORTJ_AHB_WAKEPEN_R        EQU         0x40060540
GPIO_PORTJ_AHB_WAKELVL_R        EQU         0x40060544
GPIO_PORTJ_AHB_WAKESTAT_R       EQU         0x40060548
GPIO_PORTJ_AHB_PP_R             EQU         0x40060FC0
GPIO_PORTJ_AHB_PC_R             EQU         0x40060FC4
GPIO_PORTJ               		EQU    		2_000000100000000
; -------------------------------------------------------------------------------
; Área de Dados - Declarações de variáveis
		AREA  DATA, ALIGN=2
		; Se alguma variável for chamada em outro arquivo
		;EXPORT  <var> [DATA,SIZE=<tam>]   ; Permite chamar a variável <var> a 
		                                   ; partir de outro arquivo
;<var>	SPACE <tam>                        ; Declara uma variável de nome <var>
                                           ; de <tam> bytes a partir da primeira 
                                           ; posição da RAM		

; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT GPIOPortJ_Handler                ; Permite chamar a função Start a partir de 
			                        ; outro arquivo. No caso startup.s

									
		; Se chamar alguma função externa	
        ;IMPORT <func>              ; Permite chamar dentro deste arquivo uma 
									; função <func>

; -------------------------------------------------------------------------------
; Função main()
GPIOPortJ_Handler  
	LDR R0, =GPIO_PORTJ_AHB_RIS_R
	LDR R1, [R0]
	
	MOV R2, #2_1
	AND R2, R2, R1
	
	LDR R0, =GPIO_PORTN_DATA_R
	LDR R3, =GPIO_PORTJ_AHB_ICR_R
	
	CMP R2, #2_1
	ITTTT EQ
		MOVEQ R1, #2_10
		STREQ R1, [R0]
		MOVEQ R1, #2_1
		STREQ R1, [R3]
		
	MOV R2, #2_10
	AND R2, R2, R1
	
	CMP R2, #2_10
	ITTTT EQ
		MOVEQ R1, #2_0
		STREQ R1, [R0]
		MOVEQ R1, #2_10
		STREQ R1, [R3]

	BX LR
	
    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo
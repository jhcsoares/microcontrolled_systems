; gpio.s
; Desenvolvido para a placa EK-TM4C1294XL
; Prof. Guilherme Peron
; 19/03/2018

; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declarações EQU - Defines
; ========================
; Definições dos Registradores Gerais
SYSCTL_RCGCGPIO_R	 EQU	0x400FE608
SYSCTL_PRGPIO_R		 EQU    0x400FEA08
; ========================
; Definições dos Ports

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
	
; PORT N
GPIO_PORTN_DATA_BITS_R      EQU         0x40064000
GPIO_PORTN_DATA_R           EQU         0x400643FC
GPIO_PORTN_DIR_R            EQU         0x40064400
GPIO_PORTN_IS_R             EQU         0x40064404
GPIO_PORTN_IBE_R            EQU         0x40064408
GPIO_PORTN_IEV_R            EQU         0x4006440C
GPIO_PORTN_IM_R             EQU         0x40064410
GPIO_PORTN_RIS_R            EQU         0x40064414
GPIO_PORTN_MIS_R            EQU         0x40064418
GPIO_PORTN_ICR_R            EQU         0x4006441C
GPIO_PORTN_AFSEL_R          EQU         0x40064420
GPIO_PORTN_DR2R_R           EQU         0x40064500
GPIO_PORTN_DR4R_R           EQU         0x40064504
GPIO_PORTN_DR8R_R           EQU         0x40064508
GPIO_PORTN_ODR_R            EQU         0x4006450C
GPIO_PORTN_PUR_R            EQU         0x40064510
GPIO_PORTN_PDR_R            EQU         0x40064514
GPIO_PORTN_SLR_R            EQU         0x40064518
GPIO_PORTN_DEN_R            EQU         0x4006451C
GPIO_PORTN_LOCK_R           EQU         0x40064520
GPIO_PORTN_CR_R             EQU         0x40064524
GPIO_PORTN_AMSEL_R          EQU         0x40064528
GPIO_PORTN_PCTL_R           EQU         0x4006452C
GPIO_PORTN_ADCCTL_R         EQU         0x40064530
GPIO_PORTN_DMACTL_R         EQU         0x40064534
GPIO_PORTN_SI_R             EQU         0x40064538
GPIO_PORTN_DR12R_R          EQU         0x4006453C
GPIO_PORTN_WAKEPEN_R        EQU         0x40064540
GPIO_PORTN_WAKELVL_R        EQU         0x40064544
GPIO_PORTN_WAKESTAT_R       EQU         0x40064548
GPIO_PORTN_PP_R             EQU         0x40064FC0
GPIO_PORTN_PC_R             EQU         0x40064FC4
GPIO_PORTN               	EQU     	2_001000000000000

;NVIC Registers
NVIC_ACTLR_R            EQU         0xE000E008
NVIC_ST_CTRL_R          EQU         0xE000E010
NVIC_ST_RELOAD_R        EQU         0xE000E014
NVIC_ST_CURRENT_R       EQU         0xE000E018
NVIC_EN0_R              EQU         0xE000E100
NVIC_EN1_R              EQU         0xE000E104
NVIC_EN2_R              EQU         0xE000E108
NVIC_EN3_R              EQU         0xE000E10C
NVIC_DIS0_R             EQU         0xE000E180
NVIC_DIS1_R             EQU         0xE000E184
NVIC_DIS2_R             EQU         0xE000E188
NVIC_DIS3_R             EQU         0xE000E18C
NVIC_PEND0_R            EQU         0xE000E200
NVIC_PEND1_R            EQU         0xE000E204
NVIC_PEND2_R            EQU         0xE000E208
NVIC_PEND3_R            EQU         0xE000E20C
NVIC_UNPEND0_R          EQU         0xE000E280
NVIC_UNPEND1_R          EQU         0xE000E284
NVIC_UNPEND2_R          EQU         0xE000E288
NVIC_UNPEND3_R          EQU         0xE000E28C
NVIC_ACTIVE0_R          EQU         0xE000E300
NVIC_ACTIVE1_R          EQU         0xE000E304
NVIC_ACTIVE2_R          EQU         0xE000E308
NVIC_ACTIVE3_R          EQU         0xE000E30C
NVIC_PRI0_R             EQU         0xE000E400
NVIC_PRI1_R             EQU         0xE000E404
NVIC_PRI2_R             EQU         0xE000E408
NVIC_PRI3_R             EQU         0xE000E40C
NVIC_PRI4_R             EQU         0xE000E410
NVIC_PRI5_R             EQU         0xE000E414
NVIC_PRI6_R             EQU         0xE000E418
NVIC_PRI7_R             EQU         0xE000E41C
NVIC_PRI8_R             EQU         0xE000E420
NVIC_PRI9_R             EQU         0xE000E424
NVIC_PRI10_R            EQU         0xE000E428
NVIC_PRI11_R            EQU         0xE000E42C
NVIC_PRI12_R            EQU         0xE000E430
NVIC_PRI13_R            EQU         0xE000E434
NVIC_PRI14_R            EQU         0xE000E438
NVIC_PRI15_R            EQU         0xE000E43C
NVIC_PRI16_R            EQU         0xE000E440
NVIC_PRI17_R            EQU         0xE000E444
NVIC_PRI18_R            EQU         0xE000E448
NVIC_PRI19_R            EQU         0xE000E44C
NVIC_PRI20_R            EQU         0xE000E450
NVIC_PRI21_R            EQU         0xE000E454
NVIC_PRI22_R            EQU         0xE000E458
NVIC_PRI23_R            EQU         0xE000E45C
NVIC_PRI24_R            EQU         0xE000E460
NVIC_PRI25_R            EQU         0xE000E464
NVIC_PRI26_R            EQU         0xE000E468
NVIC_PRI27_R            EQU         0xE000E46C
NVIC_PRI28_R            EQU         0xE000E470
NVIC_CPUID_R            EQU         0xE000ED00
NVIC_INT_CTRL_R         EQU         0xE000ED04
NVIC_VTABLE_R           EQU         0xE000ED08
NVIC_APINT_R            EQU         0xE000ED0C
NVIC_SYS_CTRL_R         EQU         0xE000ED10
NVIC_CFG_CTRL_R         EQU         0xE000ED14
NVIC_SYS_PRI1_R         EQU         0xE000ED18
NVIC_SYS_PRI2_R         EQU         0xE000ED1C
NVIC_SYS_PRI3_R         EQU         0xE000ED20
NVIC_SYS_HND_CTRL_R     EQU         0xE000ED24
NVIC_FAULT_STAT_R       EQU         0xE000ED28
NVIC_HFAULT_STAT_R      EQU         0xE000ED2C
NVIC_DEBUG_STAT_R       EQU         0xE000ED30
NVIC_MM_ADDR_R          EQU         0xE000ED34
NVIC_FAULT_ADDR_R       EQU         0xE000ED38
NVIC_CPAC_R             EQU         0xE000ED88
NVIC_MPU_TYPE_R         EQU         0xE000ED90
NVIC_MPU_CTRL_R         EQU         0xE000ED94
NVIC_MPU_NUMBER_R       EQU         0xE000ED98
NVIC_MPU_BASE_R         EQU         0xE000ED9C
NVIC_MPU_ATTR_R         EQU         0xE000EDA0
NVIC_MPU_BASE1_R        EQU         0xE000EDA4
NVIC_MPU_ATTR1_R        EQU         0xE000EDA8
NVIC_MPU_BASE2_R        EQU         0xE000EDAC
NVIC_MPU_ATTR2_R        EQU         0xE000EDB0
NVIC_MPU_BASE3_R        EQU         0xE000EDB4
NVIC_MPU_ATTR3_R        EQU         0xE000EDB8
NVIC_DBG_CTRL_R         EQU         0xE000EDF0
NVIC_DBG_XFER_R         EQU         0xE000EDF4
NVIC_DBG_DATA_R         EQU         0xE000EDF8
NVIC_DBG_INT_R          EQU         0xE000EDFC
NVIC_SW_TRIG_R          EQU         0xE000EF00
NVIC_FPCC_R             EQU         0xE000EF34
NVIC_FPCA_R             EQU         0xE000EF38
NVIC_FPDSC_R            EQU         0xE000EF3C

; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT GPIO_Init            ; Permite chamar GPIO_Init de outro arquivo
		EXPORT Interrupt_Init							

;--------------------------------------------------------------------------------
; Função GPIO_Init
; Parâmetro de entrada: Não tem
; Parâmetro de saída: Não tem
GPIO_Init
;=====================
; 1. Ativar o clock para a porta setando o bit correspondente no registrador RCGCGPIO,
; após isso verificar no PRGPIO se a porta está pronta para uso.
; enable clock to GPIOF at clock gating register
            LDR     R0, =SYSCTL_RCGCGPIO_R  		;Carrega o endereço do registrador RCGCGPIO
			MOV		R1, #GPIO_PORTN                 ;Seta o bit da porta F
			ORR     R1, #GPIO_PORTJ					;Seta o bit da porta J, fazendo com OR
            STR     R1, [R0]						;Move para a memória os bits das portas no endereço do RCGCGPIO
 
            LDR     R0, =SYSCTL_PRGPIO_R			;Carrega o endereço do PRGPIO para esperar os GPIO ficarem prontos
EsperaGPIO  LDR     R1, [R0]						;Lê da memória o conteúdo do endereço do registrador
			MOV     R2, #GPIO_PORTN                 ;Seta os bits correspondentes às portas para fazer a comparação
			ORR     R2, #GPIO_PORTJ                 ;Seta o bit da porta J, fazendo com OR
            TST     R1, R2							;ANDS de R1 com R2
            BEQ     EsperaGPIO					    ;Se o flag Z=1, volta para o laço. Senão continua executando
 
; 2. Limpar o AMSEL para desabilitar a analógica
            MOV     R1, #0x00						;Colocar 0 no registrador para desabilitar a função analógica
            LDR     R0, =GPIO_PORTJ_AHB_AMSEL_R     ;Carrega o R0 com o endereço do AMSEL para a porta J
            STR     R1, [R0]						;Guarda no registrador AMSEL da porta J da memória
            LDR     R0, =GPIO_PORTN_AMSEL_R			;Carrega o R0 com o endereço do AMSEL para a porta F
            STR     R1, [R0]					    ;Guarda no registrador AMSEL da porta F da memória
 
; 3. Limpar PCTL para selecionar o GPIO
            MOV     R1, #0x00					    ;Colocar 0 no registrador para selecionar o modo GPIO
            LDR     R0, =GPIO_PORTJ_AHB_PCTL_R		;Carrega o R0 com o endereço do PCTL para a porta J
            STR     R1, [R0]                        ;Guarda no registrador PCTL da porta J da memória
            LDR     R0, =GPIO_PORTN_PCTL_R      	;Carrega o R0 com o endereço do PCTL para a porta F
            STR     R1, [R0]                        ;Guarda no registrador PCTL da porta F da memória
; 4. DIR para 0 se for entrada, 1 se for saída
            LDR     R0, =GPIO_PORTN_DIR_R			;Carrega o R0 com o endereço do DIR para a porta F
			MOV     R1, #2_00000010					;PF4 & PF0 para LED
            STR     R1, [R0]						;Guarda no registrador
			; O certo era verificar os outros bits da PF para não transformar entradas em saídas desnecessárias
            LDR     R0, =GPIO_PORTJ_AHB_DIR_R		;Carrega o R0 com o endereço do DIR para a porta J
            MOV     R1, #0x00               		;Colocar 0 no registrador DIR para funcionar com saída
            STR     R1, [R0]						;Guarda no registrador PCTL da porta J da memória
; 5. Limpar os bits AFSEL para 0 para selecionar GPIO 
;    Sem função alternativa
            MOV     R1, #0x00						;Colocar o valor 0 para não setar função alternativa
            LDR     R0, =GPIO_PORTN_AFSEL_R			;Carrega o endereço do AFSEL da porta F
            STR     R1, [R0]						;Escreve na porta
            LDR     R0, =GPIO_PORTJ_AHB_AFSEL_R     ;Carrega o endereço do AFSEL da porta J
            STR     R1, [R0]                        ;Escreve na porta
; 6. Setar os bits de DEN para habilitar I/O digital
            LDR     R0, =GPIO_PORTN_DEN_R				;Carrega o endereço do DEN
            MOV     R1, #2_00000010                     ;Ativa os pinos PF0 e PF4 como I/O Digital
            STR     R1, [R0]							;Escreve no registrador da memória funcionalidade digital 
 
            LDR     R0, =GPIO_PORTJ_AHB_DEN_R			;Carrega o endereço do DEN
			MOV     R1, #2_00000011                     ;Ativa os pinos PJ0 e PJ1 como I/O Digital      
            STR     R1, [R0]                            ;Escreve no registrador da memória funcionalidade digital
			
; 7. Para habilitar resistor de pull-up interno, setar PUR para 1
			LDR     R0, =GPIO_PORTJ_AHB_PUR_R			;Carrega o endereço do PUR para a porta J
			MOV     R1, #2_00000011						;Habilitar funcionalidade digital de resistor de pull-up 
                                                        ;nos bits 0 e 1
            STR     R1, [R0]							;Escreve no registrador da memória do resistor de pull-up
            
			BX      LR
			
Interrupt_Init
			;GPIO
			MOV R0, #0
			LDR R1, =GPIO_PORTJ_AHB_IM_R
			STR R0, [R1]
			
			LDR R1, =GPIO_PORTJ_AHB_IS_R
			STR R0, [R1]
			
			LDR R1, =GPIO_PORTJ_AHB_IBE_R
			STR R0, [R1]

			MOV R0, #2_10
			LDR R1, =GPIO_PORTJ_AHB_IEV_R
			STR R0, [R1]
			
			MOV R0, #2_11
			LDR R1, =GPIO_PORTJ_AHB_ICR_R
			STR R0, [R1]
			
			MOV R0, #2_11
			LDR R1, =GPIO_PORTJ_AHB_IM_R
			STR R0, [R1]
			
			;NVIC
			MOV R0, #1
			LDR R1, =NVIC_EN1_R
			LSL R0, R0, #19
			STR R0, [R1]
			
			MOV R0, #0
			LDR R1, =NVIC_PRI12_R
			LSL R0, R0, #31
			STR R0, [R1]
			
			BX LR
			
			ALIGN                           ; garante que o fim da seção está alinhada 
			END                             ; fim do arquivo
; -------------------------------------------------------------------------------
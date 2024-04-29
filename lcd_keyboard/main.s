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

;PORT K
GPIO_PORTK_DATA_BITS_R  EQU         0x40061000
GPIO_PORTK_DATA_R       EQU         0x400613FC
GPIO_PORTK_DIR_R        EQU         0x40061400
GPIO_PORTK_IS_R         EQU         0x40061404
GPIO_PORTK_IBE_R        EQU         0x40061408
GPIO_PORTK_IEV_R        EQU         0x4006140C
GPIO_PORTK_IM_R         EQU         0x40061410
GPIO_PORTK_RIS_R        EQU         0x40061414
GPIO_PORTK_MIS_R        EQU         0x40061418
GPIO_PORTK_ICR_R        EQU         0x4006141C
GPIO_PORTK_AFSEL_R      EQU         0x40061420
GPIO_PORTK_DR2R_R       EQU         0x40061500
GPIO_PORTK_DR4R_R       EQU         0x40061504
GPIO_PORTK_DR8R_R       EQU         0x40061508
GPIO_PORTK_ODR_R        EQU         0x4006150C
GPIO_PORTK_PUR_R        EQU         0x40061510
GPIO_PORTK_PDR_R        EQU         0x40061514
GPIO_PORTK_SLR_R        EQU         0x40061518
GPIO_PORTK_DEN_R        EQU         0x4006151C
GPIO_PORTK_LOCK_R       EQU         0x40061520
GPIO_PORTK_CR_R         EQU         0x40061524
GPIO_PORTK_AMSEL_R      EQU         0x40061528
GPIO_PORTK_PCTL_R       EQU         0x4006152C
GPIO_PORTK_ADCCTL_R     EQU         0x40061530
GPIO_PORTK_DMACTL_R     EQU         0x40061534
GPIO_PORTK_SI_R         EQU         0x40061538
GPIO_PORTK_DR12R_R      EQU         0x4006153C
GPIO_PORTK_WAKEPEN_R    EQU         0x40061540
GPIO_PORTK_WAKELVL_R    EQU         0x40061544
GPIO_PORTK_WAKESTAT_R   EQU         0x40061548
GPIO_PORTK_PP_R         EQU         0x40061FC0
GPIO_PORTK_PC_R         EQU         0x40061FC4
GPIO_PORTK				EQU			2_000001000000000

;PORT M
GPIO_PORTM_DATA_BITS_R  EQU         0x40063000
GPIO_PORTM_DATA_R       EQU         0x400633FC
GPIO_PORTM_DIR_R        EQU         0x40063400
GPIO_PORTM_IS_R         EQU         0x40063404
GPIO_PORTM_IBE_R        EQU         0x40063408
GPIO_PORTM_IEV_R        EQU         0x4006340C
GPIO_PORTM_IM_R         EQU         0x40063410
GPIO_PORTM_RIS_R        EQU         0x40063414
GPIO_PORTM_MIS_R        EQU         0x40063418
GPIO_PORTM_ICR_R        EQU         0x4006341C
GPIO_PORTM_AFSEL_R      EQU         0x40063420
GPIO_PORTM_DR2R_R       EQU         0x40063500
GPIO_PORTM_DR4R_R       EQU         0x40063504
GPIO_PORTM_DR8R_R       EQU         0x40063508
GPIO_PORTM_ODR_R        EQU         0x4006350C
GPIO_PORTM_PUR_R        EQU         0x40063510
GPIO_PORTM_PDR_R        EQU         0x40063514
GPIO_PORTM_SLR_R        EQU         0x40063518
GPIO_PORTM_DEN_R        EQU         0x4006351C
GPIO_PORTM_LOCK_R       EQU         0x40063520
GPIO_PORTM_CR_R         EQU         0x40063524
GPIO_PORTM_AMSEL_R      EQU         0x40063528
GPIO_PORTM_PCTL_R       EQU         0x4006352C
GPIO_PORTM_ADCCTL_R     EQU         0x40063530
GPIO_PORTM_DMACTL_R     EQU         0x40063534
GPIO_PORTM_SI_R         EQU         0x40063538
GPIO_PORTM_DR12R_R      EQU         0x4006353C
GPIO_PORTM_WAKEPEN_R    EQU         0x40063540
GPIO_PORTM_WAKELVL_R    EQU         0x40063544
GPIO_PORTM_WAKESTAT_R   EQU         0x40063548
GPIO_PORTM_PP_R         EQU         0x40063FC0
GPIO_PORTM_PC_R         EQU         0x40063FC4
GPIO_PORTM				EQU			2_000100000000000

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


MAIN_STATE				EQU	   0X2000041C
; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		EXPORT Start
		
		; Se alguma função do arquivo for chamada em outro arquivo	
        IMPORT GPIO_Init            ; Permite chamar GPIO_Init de outro arquivo			
		IMPORT PLL_Init
		IMPORT SysTick_Init
		IMPORT LCD_Init
		IMPORT Interrupt_Init
		IMPORT Ram_Init
		IMPORT State_0
		IMPORT State_1
		IMPORT State_2
		IMPORT State_3
		IMPORT State_4_Init
		IMPORT State_5_a
		IMPORT State_5_b
		IMPORT State_5_c
		IMPORT State_5_d
;--------------------------------------------------------------------------------
; Função GPIO_Init
; Parâmetro de entrada: Não tem
; Parâmetro de saída: Não tem
Start
	BL PLL_Init
	BL SysTick_Init
	BL GPIO_Init
	BL Interrupt_Init
	BL LCD_Init
	BL Ram_Init
	
Main
	LDR R0, =MAIN_STATE
	LDRB R1, [R0]
	
	CMP R1, #0
	BLEQ State_0
	
	CMP R1, #1
	BLEQ State_1
	
	CMP R1, #2
	BLEQ State_2
	
	CMP R1, #3
	BLEQ State_3
	
	CMP R1, #4
	BLEQ State_4_Init
	
	CMP R1, #5
	BLEQ State_5_a
	
	CMP R1, #6
	BLEQ State_5_b
	
	CMP R1, #7
	BLEQ State_5_c
	
	CMP R1, #8
	BLEQ State_5_d
	
	B Main
	
	ALIGN                           ; garante que o fim da seção está alinhada 
	END
; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------

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
GOTO_STATE_5_B			EQU	   0X2000040E
GOTO_STATE_5_D			EQU	   0X2000041B
; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
		EXPORT Interrupt_Init	
		EXPORT GPIOPortJ_Handler

;--------------------------------------------------------------------------------

Interrupt_Init
	;GPIO
	MOV R0, #0
	LDR R1, =GPIO_PORTJ_AHB_IM_R
	STR R0, [R1]
	
	LDR R1, =GPIO_PORTJ_AHB_IS_R
	STR R0, [R1]
	
	LDR R1, =GPIO_PORTJ_AHB_IBE_R
	STR R0, [R1]

	MOV R0, #2_11
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

GPIOPortJ_Handler
	LDR R0, =GPIO_PORTJ_AHB_RIS_R
	LDR R1, [R0]
	
	;USR_SW_1

	LDR R3, =GPIO_PORTJ_AHB_ICR_R
	
	MOV R2, #2_1
	AND R2, R2, R1
	
	MOV R4, #0
	
	CMP R2, #2_1
	ITTT EQ
		MOVEQ R1, #2_1
		STREQ R1, [R3]
		MOVEQ R4, #1
	
	CMP R4, #1
	BNE USR_SW_2
	
	LDR R0, =MAIN_STATE
	LDRB R0, [R0]
	
	CMP R0, #5
	ITTT EQ
		LDREQ R0, =GOTO_STATE_5_D
		MOVEQ R1, #1
		STRBEQ R1, [R0]
		
USR_SW_2
	;USR_SW_2
	MOV R2, #2_10
	AND R2, R2, R1
	
	MOV R4, #0
	
	CMP R2, #2_10
	ITTT EQ
		MOVEQ R1, #2_10
		STREQ R1, [R3]
		MOVEQ R4, #1
	
	CMP R4, #1
	BNE FINAL
	
	LDR R0, =MAIN_STATE
	LDRB R0, [R0]
	
	CMP R0, #4
	ITTT EQ
		LDREQ R0, =GOTO_STATE_5_B
		MOVEQ R1, #1
		STRBEQ R1, [R0]

FINAL
	BX LR
	
	ALIGN                           ; garante que o fim da seção está alinhada 
	END                             ; fim do arquivo
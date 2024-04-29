; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------

;PORT L
GPIO_PORTL_DATA_BITS_R      EQU         0x40062000
GPIO_PORTL_DATA_R           EQU         0x400623FC
GPIO_PORTL_DIR_R            EQU         0x40062400
GPIO_PORTL_IS_R             EQU         0x40062404
GPIO_PORTL_IBE_R            EQU         0x40062408
GPIO_PORTL_IEV_R            EQU         0x4006240C
GPIO_PORTL_IM_R             EQU         0x40062410
GPIO_PORTL_RIS_R            EQU         0x40062414
GPIO_PORTL_MIS_R            EQU         0x40062418
GPIO_PORTL_ICR_R            EQU         0x4006241C
GPIO_PORTL_AFSEL_R          EQU         0x40062420
GPIO_PORTL_DR2R_R           EQU         0x40062500
GPIO_PORTL_DR4R_R           EQU         0x40062504
GPIO_PORTL_DR8R_R           EQU         0x40062508
GPIO_PORTL_ODR_R            EQU         0x4006250C
GPIO_PORTL_PUR_R            EQU         0x40062510
GPIO_PORTL_PDR_R            EQU         0x40062514
GPIO_PORTL_SLR_R            EQU         0x40062518
GPIO_PORTL_DEN_R            EQU         0x4006251C
GPIO_PORTL_LOCK_R           EQU         0x40062520
GPIO_PORTL_CR_R             EQU         0x40062524
GPIO_PORTL_AMSEL_R          EQU         0x40062528
GPIO_PORTL_PCTL_R           EQU         0x4006252C
GPIO_PORTL_ADCCTL_R         EQU         0x40062530
GPIO_PORTL_DMACTL_R         EQU         0x40062534
GPIO_PORTL_SI_R             EQU         0x40062538
GPIO_PORTL_DR12R_R          EQU         0x4006253C
GPIO_PORTL_WAKEPEN_R        EQU         0x40062540
GPIO_PORTL_WAKELVL_R        EQU         0x40062544
GPIO_PORTL_WAKESTAT_R       EQU         0x40062548
GPIO_PORTL_PP_R             EQU         0x40062FC0
GPIO_PORTL_PC_R             EQU         0x40062FC4
GPIO_PORTL					EQU			2_000010000000000
	

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
	
KEYBOARD_DIGIT			EQU	   0x20000404
; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2
		
		IMPORT SysTick_Wait1ms
			

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT Keyboard_Read            ; Permite chamar GPIO_Init de outro arquivo						

;--------------------------------------------------------------------------------
Keyboard_Read	
	MOV R1, #0
	LDR R0, =KEYBOARD_DIGIT
	STRB R1, [R0]
	
	;M4 SET TO OUTPUT
	LDR     R0, =GPIO_PORTM_DIR_R		
	MOV     R1, #2_00010111	               		
	STR     R1, [R0]
	
	MOV R0, #5
	PUSH {LR}
	BL SysTick_Wait1ms
	POP {LR}
	
	;0 ON M4
	LDR R0, =GPIO_PORTM_DATA_R
	MOV R1, #2_00000000	
	STR R1, [R0]
	
	;READ L
	LDR R0, =GPIO_PORTL_DATA_R
	LDR R1, [R0]
	
	;DEBOUNCE
	MOV R0, #500
	CMP R1, #2_1111
	PUSH {LR}
	BLNE SysTick_Wait1ms
	POP {LR}
	
	MOV R3, #0
	
	CMP R1, #2_1110
	MOVEQ R3, #'1'
	
	CMP R1, #2_1101
	MOVEQ R3, #'4'
	
	CMP R1, #2_1011
	MOVEQ R3, #'7'
	
	CMP R1, #2_0111
	MOVEQ R3, #'*'
	
	CMP R1, #2_1111
	ITT NE
		LDRNE R4, =KEYBOARD_DIGIT
		STRBNE R3, [R4]

	;M5 SET TO OUTPUT
	LDR     R0, =GPIO_PORTM_DIR_R		
	MOV     R1, #2_00100111	               		
	STR     R1, [R0]
	
	MOV R0, #5
	PUSH {LR}
	BL SysTick_Wait1ms
	POP {LR}
	
	;0 ON M5
	LDR R0, =GPIO_PORTM_DATA_R
	MOV R1, #2_00000000	
	STR R1, [R0]
	
	;READ L
	LDR R0, =GPIO_PORTL_DATA_R
	LDR R1, [R0]
	
	;DEBOUNCE
	MOV R0, #500
	CMP R1, #2_1111
	PUSH {LR}
	BLNE SysTick_Wait1ms
	POP {LR}
	
	CMP R1, #2_1110
	MOVEQ R3, #'2'
	
	CMP R1, #2_1101
	MOVEQ R3, #'5'
	
	CMP R1, #2_1011
	MOVEQ R3, #'8'
	
	CMP R1, #2_0111
	MOVEQ R3, #'0'
	
	CMP R1, #2_1111
	ITT NE
		LDRNE R4, =KEYBOARD_DIGIT
		STRBNE R3, [R4]
	
	
	;M6 SET TO OUTPUT
	LDR     R0, =GPIO_PORTM_DIR_R		
	MOV     R1, #2_01000111	               		
	STR     R1, [R0]
	
	MOV R0, #5
	PUSH {LR}
	BL SysTick_Wait1ms
	POP {LR}
	
	;0 ON M6
	LDR R0, =GPIO_PORTM_DATA_R
	MOV R1, #2_00000000	
	STR R1, [R0]
	
	;READ L
	LDR R0, =GPIO_PORTL_DATA_R
	LDR R1, [R0]
	
	;DEBOUNCE
	MOV R0, #500
	CMP R1, #2_1111
	PUSH {LR}
	BLNE SysTick_Wait1ms
	POP {LR}
	
	CMP R1, #2_1110
	MOVEQ R3, #'3'
	
	CMP R1, #2_1101
	MOVEQ R3, #'6'
	
	CMP R1, #2_1011
	MOVEQ R3, #'9'
	
	CMP R1, #2_0111
	MOVEQ R3, #'#'
	
	CMP R1, #2_1111
	ITT NE
		LDRNE R4, =KEYBOARD_DIGIT
		STRBNE R3, [R4]
	
	
	
	;M7 SET TO OUTPUT
	LDR     R0, =GPIO_PORTM_DIR_R		
	MOV     R1, #2_10000111	               		
	STR     R1, [R0]
	
	MOV R0, #5
	PUSH {LR}
	BL SysTick_Wait1ms
	POP {LR}
	
	;0 ON M7
	LDR R0, =GPIO_PORTM_DATA_R
	MOV R1, #2_00000000	
	STR R1, [R0]
	
	;READ L
	LDR R0, =GPIO_PORTL_DATA_R
	LDR R1, [R0]
	
	;DEBOUNCE
	MOV R0, #500
	CMP R1, #2_1111
	PUSH {LR}
	BLNE SysTick_Wait1ms
	POP {LR}
	
	CMP R1, #2_1110
	MOVEQ R3, #'A'

	CMP R1, #2_1101
	MOVEQ R3, #'B'
	
	CMP R1, #2_1011
	MOVEQ R3, #'C'
	
	CMP R1, #2_0111
	MOVEQ R3, #'D'
	
	CMP R1, #2_1111
	ITT NE
		LDRNE R4, =KEYBOARD_DIGIT
		STRBNE R3, [R4]

	
	LDR     R0, =GPIO_PORTM_DIR_R		
	MOV     R1, #2_00000111	               		
	STR     R1, [R0]
	BX LR
	
	ALIGN
	END
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
;PORT A
GPIO_PORTA_AHB_DATA_R       EQU     0x400583FC
GPIO_PORTA_AHB_DIR_R        EQU     0x40058400
GPIO_PORTA_AHB_IS_R         EQU     0x40058404
GPIO_PORTA_AHB_IBE_R        EQU     0x40058408
GPIO_PORTA_AHB_IEV_R        EQU     0x4005840C
GPIO_PORTA_AHB_IM_R         EQU     0x40058410
GPIO_PORTA_AHB_RIS_R        EQU     0x40058414
GPIO_PORTA_AHB_MIS_R        EQU     0x40058418
GPIO_PORTA_AHB_ICR_R        EQU     0x4005841C
GPIO_PORTA_AHB_AFSEL_R      EQU     0x40058420
GPIO_PORTA_AHB_DR2R_R       EQU     0x40058500
GPIO_PORTA_AHB_DR4R_R       EQU     0x40058504
GPIO_PORTA_AHB_DR8R_R       EQU     0x40058508
GPIO_PORTA_AHB_ODR_R        EQU     0x4005850C
GPIO_PORTA_AHB_PUR_R        EQU     0x40058510
GPIO_PORTA_AHB_PDR_R        EQU     0x40058514
GPIO_PORTA_AHB_SLR_R        EQU     0x40058518
GPIO_PORTA_AHB_DEN_R        EQU     0x4005851C
GPIO_PORTA_AHB_LOCK_R       EQU     0x40058520
GPIO_PORTA_AHB_CR_R         EQU     0x40058524
GPIO_PORTA_AHB_AMSEL_R      EQU     0x40058528
GPIO_PORTA_AHB_PCTL_R       EQU     0x4005852C
GPIO_PORTA_AHB_ADCCTL_R     EQU     0x40058530
GPIO_PORTA_AHB_DMACTL_R     EQU     0x40058534
GPIO_PORTA_AHB_SI_R         EQU     0x40058538
GPIO_PORTA_AHB_DR12R_R      EQU     0x4005853C
GPIO_PORTA              	EQU     2_000000000000001


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


;PORT P
GPIO_PORTP_DATA_R       EQU    0x400653FC
GPIO_PORTP_DIR_R        EQU    0x40065400
GPIO_PORTP_IS_R         EQU    0x40065404
GPIO_PORTP_IBE_R        EQU    0x40065408
GPIO_PORTP_IEV_R        EQU    0x4006540C
GPIO_PORTP_IM_R         EQU    0x40065410
GPIO_PORTP_RIS_R        EQU    0x40065414
GPIO_PORTP_MIS_R        EQU    0x40065418
GPIO_PORTP_ICR_R        EQU    0x4006541C
GPIO_PORTP_AFSEL_R      EQU    0x40065420
GPIO_PORTP_DR2R_R       EQU    0x40065500
GPIO_PORTP_DR4R_R       EQU    0x40065504
GPIO_PORTP_DR8R_R       EQU    0x40065508
GPIO_PORTP_ODR_R        EQU    0x4006550C
GPIO_PORTP_PUR_R        EQU    0x40065510
GPIO_PORTP_PDR_R        EQU    0x40065514
GPIO_PORTP_SLR_R        EQU    0x40065518
GPIO_PORTP_DEN_R        EQU    0x4006551C
GPIO_PORTP_LOCK_R       EQU    0x40065520
GPIO_PORTP_CR_R         EQU    0x40065524
GPIO_PORTP_AMSEL_R      EQU    0x40065528
GPIO_PORTP_PCTL_R       EQU    0x4006552C
GPIO_PORTP_ADCCTL_R     EQU    0x40065530
GPIO_PORTP_DMACTL_R     EQU    0x40065534
GPIO_PORTP_SI_R         EQU    0x40065538
GPIO_PORTP_DR12R_R      EQU    0x4006553C
GPIO_PORTP_WAKEPEN_R    EQU    0x40065540
GPIO_PORTP_WAKELVL_R    EQU    0x40065544
GPIO_PORTP_WAKESTAT_R   EQU    0x40065548
GPIO_PORTP_PP_R         EQU    0x40065FC0
GPIO_PORTP_PC_R         EQU    0x40065FC4
GPIO_PORTP              EQU    2_010000000000000

;PORT Q
GPIO_PORTQ_DATA_R       EQU    0x400663FC
GPIO_PORTQ_DIR_R        EQU    0x40066400
GPIO_PORTQ_IS_R         EQU    0x40066404
GPIO_PORTQ_IBE_R        EQU    0x40066408
GPIO_PORTQ_IEV_R        EQU    0x4006640C
GPIO_PORTQ_IM_R         EQU    0x40066410
GPIO_PORTQ_RIS_R        EQU    0x40066414
GPIO_PORTQ_MIS_R        EQU    0x40066418
GPIO_PORTQ_ICR_R        EQU    0x4006641C
GPIO_PORTQ_AFSEL_R      EQU    0x40066420
GPIO_PORTQ_DR2R_R       EQU    0x40066500
GPIO_PORTQ_DR4R_R       EQU    0x40066504
GPIO_PORTQ_DR8R_R       EQU    0x40066508
GPIO_PORTQ_ODR_R        EQU    0x4006650C
GPIO_PORTQ_PUR_R        EQU    0x40066510
GPIO_PORTQ_PDR_R        EQU    0x40066514
GPIO_PORTQ_SLR_R        EQU    0x40066518
GPIO_PORTQ_DEN_R        EQU    0x4006651C
GPIO_PORTQ_LOCK_R       EQU    0x40066520
GPIO_PORTQ_CR_R         EQU    0x40066524
GPIO_PORTQ_AMSEL_R      EQU    0x40066528
GPIO_PORTQ_PCTL_R       EQU    0x4006652C
GPIO_PORTQ_ADCCTL_R     EQU    0x40066530
GPIO_PORTQ_DMACTL_R     EQU    0x40066534
GPIO_PORTQ_SI_R         EQU    0x40066538
GPIO_PORTQ_DR12R_R      EQU    0x4006653C
GPIO_PORTQ_WAKEPEN_R    EQU    0x40066540
GPIO_PORTQ_WAKELVL_R    EQU    0x40066544
GPIO_PORTQ_WAKESTAT_R   EQU    0x40066548
GPIO_PORTQ_PP_R         EQU    0x40066FC0
GPIO_PORTQ_PC_R         EQU    0x40066FC4
GPIO_PORTQ              EQU    2_100000000000000

; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT GPIO_Init            ; Permite chamar GPIO_Init de outro arquivo
		;EXPORT Interrupt_Init		

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
			MOV		R1, #GPIO_PORTK                 ;Seta o bit da porta F
			ORR     R1, #GPIO_PORTA
			ORR     R1, #GPIO_PORTJ
			ORR     R1, #GPIO_PORTL
			ORR     R1, #GPIO_PORTM					;Seta o bit da porta J, fazendo com OR
			ORR     R1, #GPIO_PORTP
			ORR     R1, #GPIO_PORTQ
			STR     R1, [R0]						;Move para a memória os bits das portas no endereço do RCGCGPIO
 
            LDR     R0, =SYSCTL_PRGPIO_R			;Carrega o endereço do PRGPIO para esperar os GPIO ficarem prontos
EsperaGPIO  LDR     R1, [R0]						;Lê da memória o conteúdo do endereço do registrador
			MOV     R2, #GPIO_PORTK                 ;Seta os bits correspondentes às portas para fazer a comparação
			ORR     R2, #GPIO_PORTA
			ORR     R2, #GPIO_PORTJ
			ORR     R2, #GPIO_PORTL
			ORR     R2, #GPIO_PORTM                 ;Seta o bit da porta J, fazendo com OR
            ORR     R2, #GPIO_PORTP
			ORR     R2, #GPIO_PORTQ
			TST     R1, R2							;ANDS de R1 com R2
            BEQ     EsperaGPIO					    ;Se o flag Z=1, volta para o laço. Senão continua executando
 
; 2. Limpar o AMSEL para desabilitar a analógica
            MOV     R1, #0X00						;Colocar 0 no registrador para desabilitar a função analógica
			LDR     R0, =GPIO_PORTA_AHB_AMSEL_R     ;Carrega o R0 com o endereço do AMSEL para a porta J
            STR     R1, [R0]				;Guarda no registrador AMSEL da porta J da memória
            LDR     R0, =GPIO_PORTK_AMSEL_R     ;Carrega o R0 com o endereço do AMSEL para a porta J
            STR     R1, [R0]				;Guarda no registrador AMSEL da porta J da memória
            LDR     R0, =GPIO_PORTJ_AHB_AMSEL_R     ;Carrega o R0 com o endereço do AMSEL para a porta J
            STR     R1, [R0]		
			LDR     R0, =GPIO_PORTL_AMSEL_R     ;Carrega o R0 com o endereço do AMSEL para a porta J
            STR     R1, [R0]						;Guarda no registrador AMSEL da porta J da memória
			LDR     R0, =GPIO_PORTM_AMSEL_R			;Carrega o R0 com o endereço do AMSEL para a porta F
            STR     R1, [R0]					    ;Guarda no registrador AMSEL da porta F da memória
			LDR     R0, =GPIO_PORTP_AMSEL_R			;Carrega o R0 com o endereço do AMSEL para a porta F
            STR     R1, [R0]					    ;Guarda no registrador AMSEL da porta F da memória
			LDR     R0, =GPIO_PORTQ_AMSEL_R			;Carrega o R0 com o endereço do AMSEL para a porta F
            STR     R1, [R0]					    ;Guarda no registrador AMSEL da porta F da memória
 
; 3. Limpar PCTL para selecionar o GPIO
            MOV     R1, #0X00				;Colocar 0 no registrador para selecionar o modo GPIO
			LDR     R0, =GPIO_PORTA_AHB_PCTL_R		;Carrega o R0 com o endereço do PCTL para a porta J
            STR     R1, [R0] 
            LDR     R0, =GPIO_PORTJ_AHB_PCTL_R		;Carrega o R0 com o endereço do PCTL para a porta J
            STR     R1, [R0] 
			LDR     R0, =GPIO_PORTK_PCTL_R		;Carrega o R0 com o endereço do PCTL para a porta J
            STR     R1, [R0]                        ;Guarda no registrador PCTL da porta J da memória
            LDR     R0, =GPIO_PORTL_PCTL_R		;Carrega o R0 com o endereço do PCTL para a porta J
            STR     R1, [R0]                        ;Guarda no registrador PCTL da porta J da memória
			LDR     R0, =GPIO_PORTM_PCTL_R      	;Carrega o R0 com o endereço do PCTL para a porta F
            STR     R1, [R0]                        ;Guarda no registrador PCTL da porta F da memória
			LDR     R0, =GPIO_PORTP_PCTL_R		;Carrega o R0 com o endereço do PCTL para a porta J
            STR     R1, [R0]                        ;Guarda no registrador PCTL da porta J da memória
			LDR     R0, =GPIO_PORTQ_PCTL_R      	;Carrega o R0 com o endereço do PCTL para a porta F
            STR     R1, [R0]                        ;Guarda no registrador PCTL da porta F da memória
			
			
; 4. DIR para 0 se for entrada, 1 se for saída
			LDR     R0, =GPIO_PORTA_AHB_DIR_R			;Carrega o R0 com o endereço do DIR para a porta F
			MOV     R1, #2_11110000					;PF4 & PF0 para LED
            STR     R1, [R0]						;Guarda no registrador
			
			LDR     R0, =GPIO_PORTJ_AHB_DIR_R			;Carrega o R0 com o endereço do DIR para a porta F
			MOV     R1, #2_00000000					;PF4 & PF0 para LED
            STR     R1, [R0]						;Guarda no registrador

            LDR     R0, =GPIO_PORTK_DIR_R			;Carrega o R0 com o endereço do DIR para a porta F
			MOV     R1, #2_11111111					;PF4 & PF0 para LED
            STR     R1, [R0]						;Guarda no registrador
			
			LDR     R0, =GPIO_PORTL_DIR_R			;Carrega o R0 com o endereço do DIR para a porta F
			MOV     R1, #2_00000000					;PF4 & PF0 para LED
            STR     R1, [R0]						;Guarda no registrador
			
			; O certo era verificar os outros bits da PF para não transformar entradas em saídas desnecessárias
            LDR     R0, =GPIO_PORTM_DIR_R		;Carrega o R0 com o endereço do DIR para a porta J
            MOV     R1, #2_00000111	               		;Colocar 0 no registrador DIR para funcionar com saída
            STR     R1, [R0]						;Guarda no registrador PCTL da porta J da memória
			
			LDR     R0, =GPIO_PORTP_DIR_R		;Carrega o R0 com o endereço do DIR para a porta J
            MOV     R1, #2_00100000	               		;Colocar 0 no registrador DIR para funcionar com saída
            STR     R1, [R0]						;Guarda no registrador PCTL da porta J da memória
			
			LDR     R0, =GPIO_PORTQ_DIR_R		;Carrega o R0 com o endereço do DIR para a porta J
            MOV     R1, #2_00001111	               		;Colocar 0 no registrador DIR para funcionar com saída
            STR     R1, [R0]	
			
; 5. Limpar os bits AFSEL para 0 para selecionar GPIO 
;    Sem função alternativa
            MOV     R1, #0x00						;Colocar o valor 0 para não setar função alternativa
			LDR     R0, =GPIO_PORTA_AHB_AFSEL_R			;Carrega o endereço do AFSEL da porta F
            STR     R1, [R0]
			LDR     R0, =GPIO_PORTJ_AHB_AFSEL_R			;Carrega o endereço do AFSEL da porta F
            STR     R1, [R0]	
			LDR     R0, =GPIO_PORTK_AFSEL_R			;Carrega o endereço do AFSEL da porta F
            STR     R1, [R0]						;Escreve na porta
            LDR     R0, =GPIO_PORTL_AFSEL_R			;Carrega o endereço do AFSEL da porta F
            STR     R1, [R0]						;Escreve na porta
			LDR     R0, =GPIO_PORTM_AFSEL_R     	;Carrega o endereço do AFSEL da porta J
            STR     R1, [R0]                        ;Escreve na porta
			LDR     R0, =GPIO_PORTP_AFSEL_R     	;Carrega o endereço do AFSEL da porta J
            STR     R1, [R0]                        ;Escreve na porta
			LDR     R0, =GPIO_PORTQ_AFSEL_R     	;Carrega o endereço do AFSEL da porta J
            STR     R1, [R0]                        ;Escreve na porta
			
; 6. Setar os bits de DEN para habilitar I/O digital
			LDR     R0, =GPIO_PORTA_AHB_DEN_R				;Carrega o endereço do DEN
            MOV     R1, #2_11110000                     ;Ativa os pinos PF0 e PF4 como I/O Digital
            STR     R1, [R0]
			
			LDR     R0, =GPIO_PORTJ_AHB_DEN_R				;Carrega o endereço do DEN
            MOV     R1, #2_00000011                     ;Ativa os pinos PF0 e PF4 como I/O Digital
            STR     R1, [R0]	
			
            LDR     R0, =GPIO_PORTK_DEN_R				;Carrega o endereço do DEN
            MOV     R1, #2_11111111                     ;Ativa os pinos PF0 e PF4 como I/O Digital
            STR     R1, [R0]							;Escreve no registrador da memória funcionalidade digital 
 
			LDR     R0, =GPIO_PORTL_DEN_R				;Carrega o endereço do DEN
            MOV     R1, #2_00001111                     ;Ativa os pinos PF0 e PF4 como I/O Digital
            STR     R1, [R0]							;Escreve no registrador da memória funcionalidade digital 
			
            LDR     R0, =GPIO_PORTM_DEN_R			;Carrega o endereço do DEN
			MOV     R1, #2_11110111                    ;Ativa os pinos PJ0 e PJ1 como I/O Digital      
            STR     R1, [R0]                            ;Escreve no registrador da memória funcionalidade digital
			
			LDR     R0, =GPIO_PORTP_DEN_R			;Carrega o endereço do DEN
			MOV     R1, #2_00100000                    ;Ativa os pinos PJ0 e PJ1 como I/O Digital      
            STR     R1, [R0]     

			LDR     R0, =GPIO_PORTQ_DEN_R			;Carrega o endereço do DEN
			MOV     R1, #2_00001111                    ;Ativa os pinos PJ0 e PJ1 como I/O Digital      
            STR     R1, [R0] 
			
; 7. Para habilitar resistor de pull-up interno, setar PUR para 1
			LDR     R0, =GPIO_PORTJ_AHB_PUR_R			;Carrega o endereço do PUR para a porta J
			MOV     R1, #2_00000011						;Habilitar funcionalidade digital de resistor de pull-up 
			STR     R1, [R0]
			
			LDR     R0, =GPIO_PORTL_PUR_R			;Carrega o endereço do PUR para a porta J
			MOV     R1, #2_00001111						;Habilitar funcionalidade digital de resistor de pull-up 
                                                        ;nos bits 0 e 1
            STR     R1, [R0]							;Escreve no registrador da memória do resistor de pull-up
            
			BX      LR
			
			ALIGN                           ; garante que o fim da seção está alinhada 
			END                             ; fim do arquivo
;; -------------------------------------------------------------------------------
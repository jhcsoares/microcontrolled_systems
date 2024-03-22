;;EXERCÍCIO 4
	;MOV R0, #253 ;A
	;ADDS R0, #101 ;A
	
	;MOV R1, #1500 ;B
	;MOV R2, #40543
	;ADD R1, R2 ;B
	
	;MOV R3, #340 ;C
	;MOV R4, #123 ;C
	;SUBS R3, R4 ;C
	
	;MOV R5, #1000 ;D
	;MOV R6, #2000 ;D
	;SUBS R5, R6 ;D
	
	;MOV R7, #54378 ;E
	;MOV R8, #4 ;E
	;MUL R8, R7 ;E
	
	;MOV R9, #0X3344 ;F
	;MOVT R9, #0X1122 ;F
	;MOV R10, #0X2211 ;F
	;MOVT R10, #0X4433 ;F
	;UMULL R11, R12, R10, R9 ;F
	
	;MOV R0, #0X7560 ;G
	;MOVT R0, #0XFFFF ;G
	;MOV R1, #1000 ;G
	;SDIV R0, R1 ;G
	
	;MOV R0, #0X7560 ;G
	;MOVT R0, #0XFFFF ;G
	;MOV R1, #1000 ;G
	;UDIV R0, R1 ;G
	
	;;EXERCÍCIO 2
	;MOV R0, #10 ;A
	
	;CMP R0, #9 ;B
	
	;ITTE HS ;C
		;MOVHS R1, #50
		;ADDHS R2, R1, #32
		;MOVLO R3, #75
		
		
	;CMP R0, #11 ;D
	
	;ITTE HS ;D
		;MOVHS R1, #50
		;ADDHS R2, R1, #32
		;MOVLO R3, #75
		
	;;EXERCÍCIO 3
	;MOV R0, #10 ;A
	
	;MOV R1, #0XCC22 ;B
	;MOVT R1, #0XFF11 ;B
	
	;MOV R2, #1234 ;C
	
	;MOV R3, #0X300 ;D
	
	;PUSH {R0} ;E
	 
	;PUSH {R1} ;F
	;PUSH {R2} ;F
	;PUSH {R3} ;F
	
	;;G
	
	;MOV R1, #60 ;H
	
	;MOV R2, #0X1234 ;I
	
	;POP {R3} ;J
	;POP {R2} ;J
	;POP {R1} ;J
	;POP {R0} ;J
	
	;EXERCICIO 4
	
	MOV R0, #10 
	
	ADD R0, R0, #5 
	
	CMP R0, #50 
	BEQ ULTIMA
	;BNE ADD_5

ADD_5
	ADD R0, R0, #5 
	CMP R0, #50 
	BNE ADD_5
	BL FUNC
ULTIMA
	B ULTIMA

FUNC
	MOV R1, R0
	CMP R1, #50 
	ITE LO
		ADDLO R1, R1, #1
		MOVHS R1, #-50
	
	BX LR

	MOV R1, #5
		
	MOV R2, #0X0040
	MOVT R2, #0X2000
	
	STR R1, [R2]
	
	MOV R1, #0
	MOV R4, #1
	
FACTORIAL
	ADD R1, R1, #1
	MUL R4, R4, R1
	LDR R3, [R2]
	CMP R3, R1
	BHI FACTORIAL

    NOP
    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo

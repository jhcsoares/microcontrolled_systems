;;Exercício 1
	;MOV	R0, #65	;A
	
	;MOV R1, #0X1B00 ;B
	;MOVT R1, #0X1B00 ;B
	
	;MOV R2, #0X5678 ;C
	;MOVT R2, #0X1234 ;C
	
	;MOV R3, #0X0040 ;D
	;MOVT R3, #0X2000 ;D
	;STR R0, [R3] ;D
	
	;MOV R4, #0X0044 ;E
	;MOVT R4, #0X2000 ;E
	;STR R1, [R4] ;E
	
	;MOV R5, #0X0048 ;F
	;MOVT R5, #0X2000 ;F
	;STR R2, [R5] ;F
	
	;MOV R6, #0X0001 ;G
	;MOVT R6, #0XF ;G
	;MOV R7, #0X004C ;G
	;MOVT R7, #0X2000 ;G
	;STR R6, [R7] ;G
	
	;MOV R8, #0X0046 ;H
	;MOVT R8, #0X2000 ;H
	;MOV R9, #0XCD ;H
	;STRB  R9, [R8] ;H
	
	;LDR R7, [R3] ;I
	
	;LDR R8, [R5] ;J
	
	;MOV R9, R7 ;K
	
	
	
	;;Exercício 2
	;MOV R5, #2_01010101 ;A
	;ANDS R0, R5, #0XF0 ;A
	
	;MOV R6, #2_11001100 ;B
	;ANDS R1, R6, #2_00110011 ;B
	
	;MOV R7, #2_10000000 ;C
	;MOV R8, #2_00110111 ;C
	;ORRS R2, R7, R8 ;C
	
	;MOV R9, #0X0000 ;D
	;MOVT R9, #0XFFFF ;D
	;MOV R10, #0XABCD ;D
	;MOVT R10, #0XABCD ;D
	;BICS R3, R10, R9 ;D
	
	
	
	;Exercício 3
	;MOV R0, #701 ;A
	;LSRS R0, #5 ;A
	
	;MOV R1, #32067 ;B
	;NEG R1, R1 ;B
	;LSRS R1, #4 ;B
	
	;ASRS R2, R0, #3 ;C
	
	;ASRS R3, R1, #5 ;D
	
	;MOV R4, #255 ;E
	;LSLS R5, R4, #8 ;E
	
	;MOV R6, #58982 ;F
	;NEG R6, R6 ;F
	;LSLS R7, R6, #18 ;F
	
	;MOV R8, #0X1234 ;G
	;MOVT R8, #0XFABC ;G
	;ROR R9, R8, #10 ;G
	
	;MOV R10, #0X4321 ;H
	;MOVT R10, #0X0000 ;H
	;RRX R11, R10 ;H
	;RRX R11, R11 ;H

	NOP
    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo

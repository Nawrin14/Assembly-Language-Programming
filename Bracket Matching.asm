COMMENT *
    A program that lets the user type in an algebraic expression, ending with a
    carriage return, that contains round (parentheses), square, and curly brackets. As
    the expression is being typed in, the program evaluates each character. If at any
    point the expression is incorrectly bracketed (too many right brackets or a
    mismatch between left and right brackets), the program tells the user to start
    over. After the carriage return is typed, if the expression is correct, the program
    displays "expression is correct." If not, the program displays "too many left
    brackets". In both cases, the program asks the user if he or she wants to continue.
    If the user types 'Y', the program runs again. The program does not need to store
    the input string, only check it for correctness.
*

.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 0AH,0DH,"Enter an algebraic expression: $"
MSG2 DB 0AH,0DH,"Too many right brackets.Start over!$"
MSG3 DB 0AH,0DH,"Mismatch.Start over!$"
MSG4 DB 0AH,0DH,"The expression is correct$"
MSG5 DB 0AH,0DH,"Too many left brackets$"
MSG6 DB 0AH,0DH,"Do you want to continue?$" 

.CODE
MAIN PROC
    
    START:
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    XOR CX,CX
    MOV AH,1 
    
    INPUT:
    INT 21H
    
    CMP AL,0DH
    JE OUTPUT
    
    CMP AL,'('
    JE PUSH_BRACKET
    
    CMP AL,'{'
    JE PUSH_BRACKET
    
    CMP AL,'['
    JE PUSH_BRACKET
    
    CMP AL,')'
    JE FIRST_BRACKET  
    
    CMP AL,'}'
    JE SECOND_BRACKET
    
    CMP AL,']'
    JE THIRD_BRACKET 
    
    JMP INPUT
    
    PUSH_BRACKET:
    PUSH AX
    INC CX
    
    JMP INPUT
    
    FIRST_BRACKET:
    POP DX
    DEC CX
    
    CMP CX,0
    JL EXTRA_RIGHT
     
    CMP DL,'('
    JE INPUT
    
    JMP MISMATCH  
                 
    SECOND_BRACKET:
    POP DX
    DEC CX
    
    CMP CX,0
    JL EXTRA_RIGHT
     
    CMP DL,'{'
    JE INPUT
    
    JMP MISMATCH
    
    THIRD_BRACKET:
    POP DX
    DEC CX
    
    CMP CX,0
    JL EXTRA_RIGHT
     
    CMP DL,'['
    JE INPUT
    
    JMP MISMATCH  
      
                     
    EXTRA_RIGHT:
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    JMP START
    
    EXTRA_LEFT:
    MOV AH,9
    LEA DX,MSG5
    INT 21H
    
    JMP CONTINUE  
    
    MISMATCH:
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    
    JMP START
    
    OUTPUT:
    CMP CX,0
    JNE EXTRA_LEFT
    
    MOV AH,9
    LEA DX,MSG4
    INT 21H
    
    CONTINUE: 
    
    LEA DX,MSG6
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL,'Y'
    JNE EXIT
    JMP START
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
END MAIN
    
    
    
    
COMMENT *
    A program that lets the user type some text, consisting of words separated
    by blanks, ending with a carriage return, and displays the text in reversed order.
*

.MODEL SMALL 
.STACK 100H
.DATA

MSG1 DB "Enter a string: $"
MSG2 DB 0AH,0DH,"The reversed string is: $"

COUNT DW ?
S DW 20H

.CODE

MAIN PROC
    
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
        JE LOOP1
        
        PUSH AX
        INC CX
        
        JMP INPUT
    
    LOOP1:
        MOV BX,50H
        XCHG BX,SP
        PUSH S
        XCHG BX,SP
        
        INC COUNT
        
    LOOP2:
        POP DX
        XCHG BX,SP
        PUSH DX
        XCHG BX,SP
        
        INC COUNT
        LOOP LOOP2
        
        LEA DX,MSG2
        MOV AH,9
        INT 21H
        
        MOV CX,COUNT
        MOV COUNT,0
        
        PUSH S
        
     OUTPUT:
        
        XCHG BX,SP   
        POP DX
        XCHG BX,SP   
        
        CMP DX,S
        JNE LOOP3
        
        MOV AH,2
        
      PRINT:
        POP DX
        INT 21H
        
        DEC COUNT
        CMP COUNT,0
        JNE PRINT
        
        MOV DX,S
        
     LOOP3:
        PUSH DX
        INC COUNT
        LOOP OUTPUT
        
     MOV AH,4CH
     INT 21H
     MAIN ENDP
        
END MAIN
        
        
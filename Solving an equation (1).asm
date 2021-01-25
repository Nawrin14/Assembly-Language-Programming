;An assembly code to solve the following equation. A = -(A+1)

.MODEL SMALL
.STACK 100H
.DATA 
MSG1 DB "Enter a digit A: $" 
MSG2 DB 0AH,0DH,"The result is (A=-(A+1)): $"
A DW ?
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
           
    MOV AH,1
    INT 21H 
    
    MOV A,AX
    
    INC A
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,02DH
    INT 21H
    
    MOV AH,2
    MOV DX,A
    INT 21H 
    
    MOV AH,4CH
    INT 21H        
    
    
END MAIN    
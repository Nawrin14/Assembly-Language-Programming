;An assembly code to solve the following equation. B = B-A-1 (B>A)


.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "Enter A: $"
MSG2 DB 0AH,0DH,"Enter B: $"  
MSG3 DB 0AH,0DH,"The result is (B=B-A-1) : $"  
A DW ?
B DW ?
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
     
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    SUB AX,A
    MOV A,AX
    ADD A,30H 
    DEC A
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H  
    
    MOV AH,2
    MOV DX,A
    INT 21H  
    
    MOV AH,4CH
    INT 21H
    
END MAIN
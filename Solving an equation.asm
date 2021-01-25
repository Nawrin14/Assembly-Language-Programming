COMMENT *
    An assembly code to solve the following equation.
    Suppose that A and B are word variables and the result 
    will fit in 16 bits. A = (B - 2) x A
*    

.MODEL SMALL
.STACK 100H 
.DATA
MSG1 DB "Enter A: $"
MSG2 DB 0AH,0DH,"Enter B: $"
MSG3 DB 0AH,0DH,"The result is: "
VAR DW ?,"$"
A DW ?
B DW ?
.CODE
MAIN PROC
    
     MOV AX,@DATA
     MOV DS,AX
     
     LEA DX,MSG1
     MOV AH,9
     INT 21H
     
     XOR AX,AX
    
     MOV AH,1
     INT 21H
     SUB AL,30H
     MOV A,AX
     
     LEA DX,MSG2
     MOV AH,9
     INT 21H 
     
     XOR AX,AX
     
     MOV AH,1
     INT 21H
     SUB AL,30H
     MOV B,AX     
     
     ;MOV A,03H
     ;MOV B,04H
     
     SUB B,02H 
     
     MOV BX,B
     MOV AX,A
     MUL BX
     
     XOR AH,AH
     
     ADD AX,30H
     MOV VAR,AX
     ;MOV AH,2
     ;INT 21H
     
     LEA DX,MSG3
     MOV AH,9
     INT 21H  
     
     MOV AH,4CH
     INT 21H

END MAIN
;A program to display the string 'Hello World'

.MODEL SMALL 
.STACK 100H
.DATA
MSG DB 'Hello World!$'
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
END MAIN
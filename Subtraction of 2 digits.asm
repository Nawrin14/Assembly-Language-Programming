COMMENT * 
    A program to read two decimal digits and display them and 
    their subtraction in the next line with an appropriate message.
    The 2nd digit is greater than the first digit
*

.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'Enter 1st digit: $'
MSG2 DB 0AH,0DH,'Enter 2nd digit: $'
MSG3 DB 0AH,0DH,'The numbers are '
NUM1 DB ?,' and '
NUM2 DB ?,'$'
MSG4 DB 0AH,0DH,'Subtraction: '
NUM DB ?,'$'

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV NUM1,AL
    MOV NUM,AL
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV NUM2,AL 
    
    SUB NUM,AL
    ADD NUM,30H   
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H    
    
    MOV AH,4CH
    INT 21H
    
    END MAIN
    
    
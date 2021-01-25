COMMENT *
    A program that prompts the user to enter a character, and in subsequent
    lines prints its ASCII code in binary and the number of 1 bits in its ASCII code.
*

.MODEL SMALL
.STACK 100H 
.DATA

MSG1 DB "Enter a character: $"
MSG2 DB 0AH,0DH,"The ASCII code of the character in binary is: $"
MSG3 DB 0AH,0DH,"The number of 1 bit is: $"
CHAR DB ?

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
           
    MOV CHAR,AL
    MOV CX,8
    XOR BX,BX
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
   
    TOP:
        SHL CHAR,1
        JNC PRINT_0
        JMP PRINT_1 
        
                
    PRINT_0:
        MOV AH,2
        MOV DL,30H
        INT 21H
        JMP NEXT   
        
    PRINT_1:
        MOV AH,2
        MOV DL,31H
        INT 21H
        INC BX
       
   
   NEXT:    
        LOOP TOP
        
        LEA DX,MSG3
        MOV AH,9
        INT 21H 
        
        ADD BX,30H
    
        MOV AH,2
        MOV DL,BL
        INT 21H
        
    MOV AH,4CH
    INT 21H
  
    
END MAIN
COMMENT *
    A program that prompts the user to type a hex number of four hex
    digits or less, and outputs it in binary on the next line. If the user enters an
    illegal character, he or she should be prompted to begin again. Accept only
    uppercase letters. Your program may ignore any input beyond four characters.
*

.MODEL SMALL
.STACK 100H  
.DATA 
MSG1 DB 0AH,0DH,"Enter a hex number of 4 hex digits or less: $"
MSG2 DB 0AH,0DH,"Illegal input.Try again!$"
MSG3 DB 0AH,0DH,"Output in binary is: $"
.CODE
MAIN PROC
         
    TOP: 
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    XOR BX,BX
    MOV CL,5
    
    REPEAT:  
    
    MOV AH,1
    INT 21H 
    XOR AH,AH
    CMP AL,0DH
    JE NEXT 
    DEC CL
    CMP CL,0
    JLE REPEAT
    CMP AL,30H
    JL ILLEGAL
    CMP AL,46H
    JG ILLEGAL
    CMP AL,39H
    JLE NUMBER
    CMP AL,41H
    JGE CHAR
    JMP ILLEGAL
    
    NUMBER:
    SUB AL,30H
    SHL BX,4
    OR BX,AX
    JMP REPEAT  
          
    CHAR:
    SUB AL,37H
    SHL BX,4
    OR BX,AX
    JMP REPEAT     
    
    ILLEGAL:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    JMP TOP 
    
    NEXT: 
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV CX,16
    
    PRINT: 
    JCXZ EXIT
    SHL BX,1
    JNC PRINT_0
    MOV AH,2
    MOV DL,31H
    INT 21H 
    DEC CX
    JMP PRINT
    
    PRINT_0:
    MOV AH,2
    MOV DL,30H
    INT 21H 
    LOOP PRINT
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
END MAIN
    
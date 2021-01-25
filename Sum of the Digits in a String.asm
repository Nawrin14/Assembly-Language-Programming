COMMENT *
    Write a program that prompts the user to enter a string of decimal digits,
    ending with a carriage return, and prints their sum in hex on the next line.
*

.MODEL SMALL
.STACK 100H  
.DATA
MSG1 DB 0AH,0DH,"Enter a string of decimal digits: $"
MSG2 DB 0AH,0DH,"The sum of the digits in hex is: $"
MSG3 DB 0AH,0DH,"Illegal character.Try again!" 
COUNT DB ?
.CODE
MAIN PROC
    
     MOV AX,@DATA
     MOV DS,AX 
     
     TOP:
     LEA DX,MSG1
     MOV AH,9
     INT 21H
     
     XOR DX,DX
     
     REPEAT:
     MOV AH,1
     INT 21H
     CMP AL,0DH
     JE PRINT
     CMP AL,30H
     JL ILLEGAL
     CMP AL,39H
     JG ILLEGAL
     JMP SUM
     
     ILLEGAL:
     LEA DX,MSG3
     MOV AH,9
     INT 21H
     JMP TOP
     
     SUM:  
     SUB AL,30H 
     ADD DL,AL
     JMP REPEAT
     
     PRINT: 
     MOV BL,DL
     
     LEA DX,MSG2
     MOV AH,9
     INT 21H
     
     MOV COUNT,02H
     
     LABEL1:
     XOR DL,DL            
     MOV CX,4 
     
     SHIFT:
     SHL DL,1
     SHL BL,1
     JNC NEXT
     OR DL,01H
     
     NEXT:
     LOOP SHIFT
     
     CMP DL,09H
     JG CHAR
     ADD DL,30H
     MOV AH,2
     INT 21H
     JMP LABEL2
     
     CHAR:
     ADD DL,37H
     MOV AH,2
     INT 21H
           
     LABEL2:      
     DEC COUNT
     CMP COUNT,0H
     JNE LABEL1 
          
     EXIT:
     MOV AH,4CH
     INT 21H
     
END MAIN
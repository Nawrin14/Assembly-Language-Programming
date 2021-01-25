COMMENT *
    A program to input a string which has less than 10 characters 
    and display the total number of characters in the string
*    

.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "Input a line with less than 10 characters: $"
MSG2 DB 0AH,0DH,"The total number of characters is: "
A DB ?,"$"
.CODE
MAIN PROC
    
     MOV AX,@DATA
     MOV DS,AX
     
     LEA DX,MSG1
     MOV AH,9
     INT 21H
            
     MOV BL,0            
            
     MOV AH,1
     
     WHILE:
     INT 21H
     CMP AL,0DH
     JE NEXT 
     INC BX
     JMP WHILE
     
     NEXT:
     MOV A,BL
     ADD A,030H    
     
     LEA DX,MSG2
     MOV AH,9
     INT 21H
     
     EXIT:
     MOV AH,4CH
     INT 21H
     
END MAIN 
    
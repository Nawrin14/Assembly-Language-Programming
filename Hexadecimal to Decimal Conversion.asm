COMMENT * 
    A program that will prompt the user to enter a hex digit character (0-F),
    display it on the next line in decimal and ask the user if he or she wants to do
    it again. If the user types "Y", the program repeats. If the user types "No" the
    program terminates. If the user enters an illegal character, prompt the user to
    try again. 
*


.MODEL SMALL
.STACK 100H   
.DATA

MSG1 DB 0AH,0DH,"Enter a hex digit character(0-F): $" 
MSG2 DB 0AH,0DH,"The decimal of the character is : $"
MSG3 DB 0AH,0DH,"Please try again! $" 
MSG4 DB 0AH,0DH,"Do you want to do it again?: $"

.CODE
MAIN PROC  
      
   TOP:
    
     MOV AX,@DATA
     MOV DS,AX
    
     LEA DX,MSG1
     MOV AH,9
     INT 21H   
     
     MOV AH,1
     INT 21H 
     
     MOV BX,AX
     
     CMP AL,'0'
     JL WRONG_INPUT
     CMP AL,'F'
     JG WRONG_INPUT
     CMP AL,'9'
     JLE DISPLAY_1
     CMP AL,'A'
     JGE DISPLAY_2 
     
   WRONG_INPUT:
     
     LEA DX,MSG3
     MOV AH,9
     INT 21H
     JMP TOP      
     
   DISPLAY_1:
     
     LEA DX,MSG2
     MOV AH,9
     INT 21H
     
     MOV AH,2
     MOV DL,BL
     INT 21H
     
     JMP CONTINUE:
     
   DISPLAY_2:
     
     LEA DX,MSG2
     MOV AH,9
     INT 21H
     
     MOV AH,2
     MOV DL,31H
     INT 21H    
     
     SUB BL,11H
     
     MOV DL,BL
     INT 21H
     
     
   CONTINUE:  
             
     LEA DX,MSG4
     MOV AH,9
     INT 21H
     
     MOV AH,1
     INT 21H
     
     CMP AL,'Y'
     JE TOP
     CMP AL,'N'
     JE END
     
     LEA DX,MSG3
     MOV AH,9
     INT 21H
     JMP CONTINUE
     
   END:
   
     MOV AH,4CH
     INT 21H  
            
END MAIN
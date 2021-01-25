;A program to display all the alphabets in capital letter

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
  
    MOV CX,1AH
    
    MOV AH,2
    MOV DL,041H
    
    PRINT:
    INT 21H
    INC DL
    LOOP PRINT
    
    MOV AH,4CH
    INT 21H  
  

END MAIN
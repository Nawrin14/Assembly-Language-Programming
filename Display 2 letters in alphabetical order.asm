COMMENT *
    A program to read two capital letters and display them on the next line
    in alphabetical order.
*

.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 0AH,0DH,"Enter 1st capital letter: $"
MSG2 DB 0AH,0DH,"Enter 2nd capital letter: $"
MSG3 DB 0AH,0DH,"The letters in alphabetic order are: "
CHAR1 DB ?," "
CHAR2 DB ?,"$"
MSG4 DB 0AH,0DH,"Please try again!$"

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
    
    MOV BL,AL
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H 
        
    MOV AH,1
    INT 21H
        
    CMP AL,'A'
    JNGE WRONG_INPUT
    CMP AL,'Z'
    JNLE WRONG_INPUT  
    CMP BL,'A'
    JNGE WRONG_INPUT
    CMP BL,'Z'
    JNLE WRONG_INPUT
    JMP COMPARE
    
  WRONG_INPUT:
  
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    JMP TOP 
    
  COMPARE:
  
    CMP AL,BL
    JL MOVE
    MOV CHAR1,BL
    MOV CHAR2,AL
    JMP DISPLAY     
  
  MOVE:
  
    MOV CHAR1,AL
    MOV CHAR2,BL
     
  DISPLAY:
   
    LEA DX,MSG3
    MOV AH,9
    INT 21H  
    
    MOV AH,4CH
    INT 21H
  
END MAIN  

 
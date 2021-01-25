COMMENT *
    A program that prompts the user to enter two unsigned hex numbers,
    0 to FFFFh, and prints their sum in hex on the next line. If the user enters an
    illegal character, he or she should be prompted to begin again. Each input ends
    with a carriage return.
*    

.MODEL SMALL
.STACK 100H
.DATA
MSG DB 0AH,0DH,"Enter 1st number: $"
MSG1 DB 0AH,0DH,"Enter 2nd number: $"
MSG2 DB 0AH,0DH,"The sum is: $"
MSG3 DB 0AH,0DH,"Illegal character$"
COUNT DB ?
.CODE
MAIN PROC
    
    TOP: 
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    XOR BX,BX
    
    REPEAT:
    MOV AH,1
    INT 21H 
    XOR AH,AH
    CMP AL,0DH
    JE NEXT
    CMP AL,30H
    JL ILLEGAL
    CMP AL,46H
    JG ILLEGAL
    CMP AL,39H
    JLE NUMBER
    CMP AL,41H
    JGE CHAR
    JMP ILLEGAL
    
    ILLEGAL:
    LEA DX,MSG3
    MOV AH,9
    INT 21H  
    JMP TOP  

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
    
    NEXT: 
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    XOR CX,CX
    
    REPEAT_1:
    MOV AH,1
    INT 21H 
    XOR AH,AH
    CMP AL,0DH
    JE SUM
    CMP AL,30H
    JL ILLEGAL_1
    CMP AL,46H
    JG ILLEGAL_1
    CMP AL,39H
    JLE NUMBER_1
    CMP AL,41H
    JGE CHAR_1
    JMP ILLEGAL_1
    
    ILLEGAL_1:
    LEA DX,MSG3
    MOV AH,9
    INT 21H  
    JMP NEXT 

    NUMBER_1:
    SUB AL,30H
    SHL CX,4
    OR CX,AX
    JMP REPEAT_1
    
    CHAR_1:
    SUB AL,37H
    SHL CX,4
    OR CX,AX
    JMP REPEAT_1 
    
    SUM:
    LEA DX,MSG2                                                          
    MOV AH,9
    INT 21H
     
    ADD BX,CX
    MOV COUNT,04H 
     
     LABEL_1:
     XOR DL,DL            
     MOV CX,4 
     
     SHIFT:
     SHL DL,1
     SHL BX,1
     JNC LABEL_2
     OR DL,01H
     
     LABEL_2:
     LOOP SHIFT
     
     CMP DL,09H
     JG CHAR_2
     ADD DL,30H
     MOV AH,2
     INT 21H
     JMP LABEL_3
     
     CHAR_2:
     ADD DL,37H
     MOV AH,2
     INT 21H
           
     LABEL_3:      
     DEC COUNT
     CMP COUNT,0H
     JNE LABEL_1 
          
     EXIT:
     MOV AH,4CH
     INT 21H
        
END MAIN
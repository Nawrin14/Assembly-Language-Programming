COMMENT *
    A program that lets the user enter time in seconds, up to 65535 and
    outputs the time as hours, minutes, and seconds.
*

.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "Enter a time: $"
MSG2 DB 0AH,0DH,"The time is: $"
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
     
    TOP:
    LEA DX,MSG1
    MOV AH,9
    INT 21H 
    
    CALL INDEC
    
    MOV CX,AX
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AX,CX
    
    MOV BX,3600
    XOR DX,DX
    DIV BX
    PUSH DX 
    
    CALL OUTDEC
    
    MOV AH,2
    MOV DL,':'
    INT 21H
    
    POP AX
    MOV BX,60
    XOR DX,DX
    DIV BX
    PUSH DX
    
    CALL OUTDEC
    
    MOV AH,2
    MOV DL,':'
    INT 21H
    
    POP AX
    
    CALL OUTDEC
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    
INDEC PROC
   
    PUSH BX
    
    BEGIN:
   
    XOR BX,BX
    
    MOV AH,1
    
    INT 21H
    
    REPEAT2:
    
    CMP AL,'0'
    JNGE NOT_DIGIT
    CMP AL,'9'
    JNLE NOT_DIGIT
    
    AND  AX,000FH
    PUSH AX
    
    MOV AX,10
    MUL BX
    POP BX
    ADD BX,AX
    
    MOV AH,1 
    INT 21H
    CMP AL,0DH
    JNE REPEAT2
    
    MOV AX,BX
    
    EXIT:
    POP BX
    RET
    
    NOT_DIGIT:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    JMP BEGIN
    INDEC ENDP

OUTDEC PROC
    
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    XOR CX,CX
    MOV BX,10D
    REPEAT1:
    XOR DX,DX
    DIV BX 
    PUSH DX
    INC CX
    OR AX,AX
    JNE REPEAT1
    
    MOV AH,2
   
    PRINT_LOOP: 
    POP DX
    OR DL,30H 
    INT 21H
    LOOP PRINT_LOOP
    
    POP DX 
    POP CX
    POP BX
    POP AX
    RET
    OUTDEC ENDP 


    
END MAIN
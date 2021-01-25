COMMENT *
    An assembly code to display a lower triangle of dollars.
*

.MODEL SMALL
.STACK 100H
COUNT DW ?
.CODE
MAIN PROC
    
    MOV CX,0AH
    MOV BX,0
    MOV COUNT,0
    
    JCXZ EXIT
    
    TOP:
    INC BX
    MOV COUNT,0
    MOV DL,"$"
    MOV AH,2
    
    REPEAT:
    INT 21H
    INC COUNT
    CMP COUNT,BX
    JNE REPEAT 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H 
    
    LOOP TOP
    
    EXIT:
    MOV AH,4CH
    INT 21H

END MAIN
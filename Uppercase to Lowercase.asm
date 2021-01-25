;A program to input an uppercase letter and display its corresponding lowercase letter.


.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'Enter a uppercase letter: $'
MSG2 DB 'The lowercase of the letter is: '
CHAR DB ?,'$'
.CODE
MAIN PROC
 ;initialize DS
 MOV AX,@DATA
 MOV DS,AX

 ;print a message
 LEA DX,MSG1
 MOV AH,9
 INT 21H

 ;convert uppercase to lowercase
 MOV AH,1
 INT 21H
 ADD AL,20H
 MOV CHAR,AL

 ;print new line
 MOV AH,2
 MOV DL,0DH
 INT 21H
 MOV DL,0AH
 INT 21H

 ;print the output with a result
 LEA DX,MSG2
 MOV AH,9
 INT 21H

 ;return to DOS
 MOV AH,4CH
 INT 21H


 END MAIN
COMMENT * 
    A program to read two decimal digits whose sum is less than 10 and display
    them and their sum in the next line with an appropriate message.
*

.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'Enter 1st digit : $'
MSG2 DB 0AH,0DH,'Enter 2nd digit : $'
MSG3 DB 0AH,0DH, 'The numbers are '
NUM1 DB ?,' and '
NUM2 DB ?, ' and their sum is '
NUM DB ?,'$'
.CODE
MAIN PROC

 ;initialize DS
 MOV AX,@DATA
 MOV DS,AX

 ;print a message
 LEA DX,MSG1
 MOV AH,9
 INT 21H

 ;take 1st user input
 MOV AH,1
 INT 21H
 MOV NUM1,AL
 MOV NUM,AL

 ;print another message
 LEA DX,MSG2
 MOV AH,9
 INT 21H

 ;take 2nd user input
 MOV AH,1
 INT 21H
 MOV NUM2,AL

 ;perform addition on the numbers and store the result in a variable
 ADD NUM,AL
 SUB NUM,30H

 ;print the final output with a message
 LEA DX,MSG3
 MOV AH,9
 INT 21H

 ;return to DOS
 MOV AH,4CH
 INT 21H

 END MAIN

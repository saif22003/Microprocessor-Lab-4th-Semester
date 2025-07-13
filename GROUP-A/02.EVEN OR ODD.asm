.MODEL SMALL
.STACK 100H
.DATA 
    VALUE DB ?
    TEXT1 DB "ENTER A NUMBER: $" 
    TEXT2 DB 10,13,"NUMBER ISEVEN $"
    TEXT3 DB 10,13,"NUMBER IS ODD $"
    R DB ?         
    NUM DB 2
.CODE
 
; Code to Print Even or Odd
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
 
    LEA DX, TEXT1
    MOV AH, 09
    INT 21H
 
    ;INPUT
    MOV AH, 01
    INT 21H
    MOV VALUE, AL
 
    MOV AL, VALUE 
    SUB AL, 30H
    ;DIVISION
    MOV AH, 0
    DIV NUM
    MOV R, AH 
 
    CMP R, 0
    JE EVEN
    JMP ODD
 
EVEN:
    MOV AH, 09 
    LEA DX, TEXT2
    INT 21H 
    JMP EXITS
 
ODD:
    MOV AH, 09
    LEA DX, TEXT3
    INT 21H  
 
EXITS:  
    MOV AH, 4CH
    INT 21H
MAIN ENDP
 
END MAIN
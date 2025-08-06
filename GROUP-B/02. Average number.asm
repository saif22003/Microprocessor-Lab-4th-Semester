;Average number 

.MODEL SMALL
.STACK 100H
.DATA
  ARR DB 5 DUP(?)  
  MSG1 DB 'ENTER NUMBER: $'
  MSG2 DB 10,13,'AVERAGE IS: $'
  AVG DB ?
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,ARR       
    MOV CX,5 
    
    MOV AH,09
    LEA DX,MSG1
    INT 21H          

INPUT_LOOP:
    MOV AH,01
    INT 21H

    SUB AL,30H         
    MOV [DI],AL        
    INC DI
    LOOP INPUT_LOOP

    LEA SI,ARR
    MOV AX,0
    MOV CX,5

LOOP1:
    ADD AL,[SI]
    INC SI
    DEC CX
    JNZ LOOP1

    MOV BL,05
    DIV BL

    ADD AL,30H 
    MOV AVG,AL
    
    MOV AH,09
    LEA DX,MSG2
    INT 21H
    
    MOV DL,AVG
    MOV AH,02
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN

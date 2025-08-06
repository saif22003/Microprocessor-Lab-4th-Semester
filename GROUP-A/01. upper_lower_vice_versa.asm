;Upper lower vice versa

.MODEL SMALL
.STACK 100H
.DATA
 VAL DB ? 
 NEWLINE DB 10,13,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,01
    INT 21H
    MOV VAL,AL
    
    MOV AH,09
    LEA DX,NEWLINE
    INT 21H
    
    CMP VAL,96
    JG LOWER_TO_UPPER
    JL UPPER_TO_LOWER
    
    LOWER_TO_UPPER: 
     MOV AH,02
     SUB VAL,32
     MOV DL,VAL
     INT 21H
     JMP EXIT
    
    UPPER_TO_LOWER:
     MOV AH,02
     ADD VAL,32
     MOV DL,VAL
     INT 21H
    
    EXIT:
     MOV AH,4CH
     INT 21H
     MAIN ENDP
END MAIN




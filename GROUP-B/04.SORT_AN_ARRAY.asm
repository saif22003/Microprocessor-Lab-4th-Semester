.MODEL SMALL
.STACK 100H
.DATA  
  ARR DB 5 DUP (?)       
  MSG1 DB 'ENTER 5 ELEMENTS: $'
  MSG2 DB 10,13,'SORTED ELEMENTS (ASC): $'
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DI, ARR       
    MOV CX, 5  

    MOV AH, 09
    LEA DX, MSG1
    INT 21H         

INPUT_LOOP:
    MOV AH, 01          
    INT 21H

    SUB AL, 30H         
    MOV [DI], AL
    INC DI
    LOOP INPUT_LOOP

    MOV CL, 5       
OUTER_LOOP:
    DEC CL
    MOV SI, OFFSET ARR
    MOV DL, CL     

INNER_LOOP:
    MOV AL, [SI]
    MOV BL, [SI+1]
    CMP AL, BL
    JBE CHECK_NEXT     

    MOV [SI], BL
    MOV [SI+1], AL

CHECK_NEXT:
    INC SI
    DEC DL
    JNZ INNER_LOOP
    CMP CL, 1
    JG OUTER_LOOP        
 
    MOV AH, 09
    LEA DX, MSG2
    INT 21H

    MOV SI, OFFSET ARR
    MOV CX, 5

PRINT_LOOP:
    MOV DL, [SI]
    ADD DL, 30H          
    MOV AH, 02
    INT 21H

    MOV DL, 20H        
    INT 21H

    INC SI
    LOOP PRINT_LOOP

    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN

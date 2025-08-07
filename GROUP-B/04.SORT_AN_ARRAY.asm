;Sort_an_array_ in ascending order

.MODEL SMALL
.STACK 100H
.DATA
ARR DB 5,3,8,1,4  
ARR_SIZE DB 5              
MSG DB 10,13,"SORTED ARRAY: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 09
    LEA DX, MSG
    INT 21H
    
    MOV CL, ARR_SIZE
    DEC CL       

OUTER_LOOP:
    MOV CH, CL         
    LEA SI, ARR         

INNER_LOOP:
    MOV AL, [SI]
    MOV BL, [SI+1]
    CMP AL, BL
    JBE NO_SWAP  
    MOV [SI], BL
    MOV [SI+1], AL

NO_SWAP:
    INC SI
    DEC CH
    JNZ INNER_LOOP 

    DEC CL
    JNZ OUTER_LOOP    
    MOV Cl, ARR_SIZE
    LEA SI, ARR

PRINT_LOOP:
    MOV DL, [SI]
    ADD DL, 30H        
    MOV AH, 02
    INT 21H

    MOV DL, ' '         
    INT 21H
    INC SI
    LOOP PRINT_LOOP

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

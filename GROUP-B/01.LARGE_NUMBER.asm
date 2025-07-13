.MODEL SMALL
.STACK 100H
.DATA  
  LARGE DB ?
  ARR DB 5 DUP (?)       
  MSG1 DB 'ENTER 5 ELEMENTS: $'
  MSG2 DB 10,13,'THE LARGEST ELEMENTS IS: $'
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

    LEA SI, ARR
    MOV CL, 5
    MOV AL, [SI]         
    INC SI
    DEC CL              

FIND_MAX:
    CMP AL, [SI]        
    JAE NEXT            
    MOV AL, [SI]        

NEXT:
    INC SI
    DEC CL
    JNZ FIND_MAX


    ADD AL, 30H 
    MOV LARGE,AL 
    
    MOV AH, 09
    LEA DX, MSG2
    INT 21H 
          
    MOV DL, LARGE
    MOV AH, 02
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

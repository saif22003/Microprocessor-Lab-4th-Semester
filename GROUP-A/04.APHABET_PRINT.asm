.MODEL SMALL
.STACK 100H
.DATA
 NEWLINE DB 10,13,'$'
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CL,26
    MOV DL,65
    
    LOOP1:
      MOV AH,02
      INT 21H
      INC DL
      
      MOV BL,DL 
      MOV DL,32 ;FOR SPACE
      INT 21H
      
      MOV DL,BL
      DEC CL
      JNZ LOOP1  
      
      MOV AH,09
      LEA DX,NEWLINE
      INT 21H
      
    MOV CL,26
    MOV DL,97
    
    LOOP2:
      MOV AH,02
      INT 21H
      INC DL
      
      MOV BL,DL 
      MOV DL,32 ;FOR SPACE
      INT 21H
      
      MOV DL,BL
      DEC CL
      JNZ LOOP2   
      
      MOV AH,4CH
      INT 21H
      MAIN ENDP 
END MAIN
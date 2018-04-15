

org 100h 
.MODEL SMALL
.STACK 100H
.DATA 

X DB '*$'
Y DB ? 

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
     
    
    MOV AH,1
    INT 21H 
    SUB AL,48
    MOV Y,AL

    
 
    
    MOV CL,Y
    MOV BL,Y
    
    UP: 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H     ; NEW LINE
    MOV DL,0AH
    INT 21H
    
    CMP BL,0
    JNE DOWN
    JE END
    
    DOWN:
     
    
       TOP:
       
     MOV AH,2
     MOV DL,'*'
     INT 21H 

         
       LOOP TOP
       
       DEC BL
     MOV CL,BL 
       
       JMP UP
       
       END: RET
     
    
    
    
    
    
    
ENDP MAIN
END MAIN                               



ret







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

    
    MOV AH,2
    MOV DL,0DH
    INT 21H     ; NEW LINE
    MOV DL,0AH
    INT 21H 
    
    MOV CL,Y
    
    TOP: 
    
    
    MOV BL,0 
    
    AGAIN:
    
    INC BL
    CMP BL,Y
    JLE DOWN
    JG UP
    
    DOWN:
    MOV AH,2
    MOV DL,X
    INT 21H 
    
    
    JMP AGAIN 
    
    
    UP:
        
    MOV AH,2
    MOV DL,0DH
    INT 21H     ; NEW LINE
    MOV DL,0AH
    INT 21H
    
    LOOP TOP

    
    
ENDP MAIN
END MAIN                               



ret





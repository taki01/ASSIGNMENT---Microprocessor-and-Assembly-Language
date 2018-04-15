

org 100h 
.MODEL SMALL
.STACK 100H
.DATA 
MSG DB 'ENTER A CHARACTER: $'
MSG1 DB 'UPPERCASE$'
MSG2 DB 'LOWERCASE$' 
MSG3 DB 'DIGIT$'

X DB ?
Y DB ?
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV X,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    CMP X,40H
    JG UP
    JLE NONE 
    
    UP:
    CMP X,5BH
    JL UPPER
    JGE LOW 
    
    LOW:
    CMP X,60H
    JG LOWER
    JLE NONE
    
    LOWER:
    CMP X,7BH
    JL LOWERF
    JGE NONE
    
    NONE:
    MOV AH,9
    LEA DX,MSG3
    INT 21H 
    
    RET
    
    
    UPPER:
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
     
    
    RET
    
    LOWERF:
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    
    RET
   
    
    
ENDP MAIN
END MAIN                               



ret





org 100h
.MODEL SMALL
.STACK 100H
.DATA

MSG DB 'ENTER TWO CHARACTER 1) $'
MSG1 DB '2) $'
MSG2 DB 'UPPERCASE: $' 
MSG3 DB 'LOWERCASE: $'

X DB ?
Y DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG  ;DISPLAY MSG
    INT 21H
    
    MOV AH,1     ;TAKE INPUT1 
    INT 21H
    MOV X,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H      ;NEW LINE
    MOV DL,0AH
    INT 21H
    
     MOV AH,9
    LEA DX,MSG1  ;DISPLAY MSG1
    INT 21H
    
    MOV AH,1     ;TAKE INPUT2 
    INT 21H
    MOV Y,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H      ;NEW LINE
    MOV DL,0AH
    INT 21H
    
    CMP X,40H
    JG DOWN      ;X INPUT IF UPPERCASE
    JLE DIGIT
    
    DOWN:
    CMP X,5AH
    JLE THEN
    JG ELSE
    
    THEN:
    
    MOV AH,9
    LEA DX,MSG3  ;DISPLAY MSG3
    INT 21H 
    
    MOV AH,2     ;OUTPUT AFTER CONVERT
    ADD X,32 
    MOV DL,X
    INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H      ;NEW LINE
    MOV DL,0AH
    INT 21H
    
    JMP YY
    
    ELSE:
    
    CMP X,60H
    JG LOWER
    JLE DIGIT
    
    LOWER:
    CMP X,7AH
    JLE LOWER2
    JG DIGIT
    
    LOWER2:
    
    MOV AH,9
    LEA DX,MSG2  ;DISPLAY MSG2
    INT 21H 
    
    MOV AH,2     ;OUTPUT AFTER CONVERT
    SUB X,32 
    MOV DL,X
    INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H      ;NEW LINE
    MOV DL,0AH
    INT 21H
    
    JMP YY
    
    YY:

    CMP Y,40H
    JG DOWNY      ;X INPUT IF UPPERCASE
    JLE DIGIT
    
    DOWNY:
    CMP Y,5AH
    JLE THENY
    JG ELSEY
    
    THENY:
    
    MOV AH,9
    LEA DX,MSG3  ;DISPLAY MSG3
    INT 21H 
    
    MOV AH,2     ;OUTPUT AFTER CONVERT
    ADD Y,32 
    MOV DL,Y
    INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H      ;NEW LINE
    MOV DL,0AH
    INT 21H
    
    RET
    
    ELSEY:
    
    CMP Y,60H
    JG LOWERY
    JLE DIGIT
    
    LOWERY:
    CMP Y,7AH
    JLE LOWER2Y
    JG DIGIT
    
    LOWER2Y:
    
    MOV AH,9
    LEA DX,MSG2  ;DISPLAY MSG2
    INT 21H 
    
    MOV AH,2     ;OUTPUT AFTER CONVERT
    SUB Y,32 
    MOV DL,Y
    INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H      ;NEW LINE
    MOV DL,0AH
    INT 21H
    
    RET
    
    DIGIT:

ENDP MAIN
END MAIN
ret


org 100h

.MODEL SMALL
.STACK 100H
.DATA

A DB 'ENTER A CHARACTER: $'
B DB 0DH,0AH,'BINARY: $'
C DB 0DH,0AH,'NO OF 1: $'


X DB ?
Y DB 0
Z DB 0

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    
    MOV CL,8
    
    MOV AH,1
    INT 21H
    MOV X,AL
    
    MOV AH,9
    LEA DX,B
    INT 21H 
    
    MOV AH,2
    
    TOP:
    
    ROL X,1
     
    JC ONE
    
    MOV DL,'0'
    INT 21H
    INC Y
    JMP DOWN
    
    
    ONE:
    
    
    MOV DL,'1'
    INT 21H
    INC Z
    
    DOWN:
    
    LOOP TOP
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AH,2
    ADD Z,48
    MOV DL,Z
    INT 21H
    
    

      
    
    
    
ENDP MAIN
END MAIN

ret





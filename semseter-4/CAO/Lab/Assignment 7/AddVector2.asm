.MODEL SMALL
.STACK 100H

.DATA
V1 DB 1, 2, 3, 4, 5, 6
V2 DB 13, 12, 45, 27, 31, 41
V3 DB ?, ?, ?, ?, ?, ?
num DB 6
ten DB 10
spc DB ' $'
output_msg DB 10, 13, 'Result Vector: $'

.CODE
main PROC
.STARTUP

mov si, 0 ; use SI as index
mov cl, num ; loop counter

Add_loop:
mov al, V1[si] ; index into V1
add al, V2[si] ; index into V2
mov V3[si], al ; store in V3

inc si
dec cl
jne Add_loop

; Print message
mov ah, 09h
lea dx, output_msg
int 21h

mov si, 0 ; reset index
mov cl, num

Print_loop:
mov al, V3[si]
mov ah, 0
div ten

push ax
mov dl, al
add dl, 30h
mov ah, 02h
int 21h

pop ax
mov dl, ah
add dl, 30h
mov ah, 02h
int 21h

mov ah, 09h
lea dx, spc
int 21h

inc si
dec cl
jne Print_loop

mov ah, 4ch
mov al, 0
int 21h

main ENDP
END main
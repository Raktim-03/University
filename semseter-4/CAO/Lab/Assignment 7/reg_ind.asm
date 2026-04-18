.MODEL SMALL
.STACK 100H

.DATA
    V1  DB 1, 2, 3, 4, 5, 6
    V2  DB 13, 12, 45, 27, 31, 41
    V3  DB 6 DUP(?) 
    num DB 6
    ten DB 10
    spc DB ' $'
    output_msg DB 10, 13, 'Result Vector: $'

.CODE
main PROC
    mov ax, @data
    mov ds, ax

    mov si, 0
    mov al, num
    mov cx, ax

Add_loop:
    mov al, V1[si]
    add al, V2[si]
    mov V3[si], al
    inc si
    loop Add_loop

    mov ah, 09h
    lea dx, output_msg
    int 21h

    mov si, 0
    mov cl, num

Print_loop:
    mov ax, 0
    mov al, V3[si]
    inc si
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

    dec cl
    jne Print_loop

    mov ah, 4Ch
    int 21h

main ENDP
END main

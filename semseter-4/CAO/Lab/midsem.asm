.model small
.stack 100h

.data
    msg1 db 'Enter a number: $'
    msg2 db 0Dh, 0Ah, 'The number is: $'
    digits db 100 dup(?)
    count db 0

.code
main:
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 09h
    int 21h

    xor cx, cx
    mov si, 0

read_loop:
    mov ah, 01h
    int 21h
    cmp al, 13
    je done_input
    mov digits[si], al
    inc si
    inc cx
    jmp read_loop

done_input:
    lea dx, msg2
    mov ah, 09h
    int 21h

    mov si, 0

print_loop:
    mov dl, digits[si]
    mov ah, 02h
    int 21h
    inc si
    loop print_loop

    mov ah, 4Ch
    int 21h
end main
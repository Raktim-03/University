.model small
.stack 100h

.data
    msg db 'Enter how many numbers you want to print $'
    msg1 db 0dh, 0ah, 'The numbers are $'
    count db ?

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, msg
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, '0'
    mov count, al
    
    mov ah, 09h
    lea dx, msg1
    int 21h
    
    mov cl, count
    mov dl, '1'
    
print_numbers:
    mov ah, 02h
    int 21h
    
    inc dl
    loop print_numbers
    
    mov ah, 4ch
    int 21h
    
main endp
end main;
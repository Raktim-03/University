.model small
.stack 100h

.data
    msg db 'Enetr a lower case letter $'
    msg1 db 0dh,0ah, 'The letter in upper case is $'
    temp db ?
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h         ;prints the 1st message 09h prints string
    lea dx, msg
    int 21h
    
    mov ah, 01h         ;take inputs 01h takes input
    int 21h
    mov temp, al
    
    mov ah, 09h         ;prints 2nd message
    lea dx, msg1
    int 21h
    sub temp,32
    
    mov ah,02h          ;02h prints single character
    mov dl, temp
    int 21h
    
    mov ah,4ch
    int 21h
    
main endp
end main
    
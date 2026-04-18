.model small
.stack 100h

.data
    msg db 'Enter a lower case letter $'
    msg1 db ,0Dh,0Ah, 'The letter in upper case is $' 
    temp db ?
    
.code
main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h         ;display the message
        lea dx, msg
        int 21h
        
        mov ah, 01h         ;input character
        int 21h
        mov temp, al
        
        mov ah, 09h         ;display 2nd message
        mov dx, offset msg1
        int 21h
        sub temp, 32
        
        mov ah, 02h
        mov dl, temp
        int 21h
        
        mov ah, 4ch
        int 21h
        
main endp
end main
        
        

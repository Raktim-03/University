.model small
.stack 100h

.data
    num         db 1222
    array       db 10 dup(?)          
    output_msg  db "Number required to be displayed: $"
    ten         db 10

.code
main proc
    mov ax, @data
    mov ds, ax

    
    mov al, num
    xor cx, cx                 
    lea si, array              

store_digits:
    xor ah, ah                 
    div ten                   
    mov [si], ah               
    inc si
    inc cx
    cmp al, 0
    jne store_digits           
    
    lea dx, output_msg
    mov ah, 09h
    int 21h

    
    dec si                     
print_digits:
    mov dl, [si]
    add dl, '0'                
    mov ah, 02h
    int 21h
    dec si
    loop print_digits

    
    mov ah, 4Ch
    int 21h
main endp
end main
.MODEL SMALL
.STACK 100H

.DATA
    V1  DB  1, 2, 3, 4, 5, 6
    V2  DB  13, 12, 45, 27, 31, 41
    V3  DB  ?, ?, ?, ?, ?, ? 
    num DB  6   
    ten DB  10
    spc DB  ' $'
    output_msg DB 10, 13, 'Result Vector: $'

.CODE

main PROC
    .STARTUP

    mov si, OFFSET V1
    mov di, OFFSET V2
    mov bp, OFFSET V3
    mov cl, num
    mov ch, 0
    mov ax, 0

Add_loop:
    mov al, [si]
    add al, [di]
    mov [bp], al
    inc si
    inc di
    inc bp
    dec cl
    jne Add_loop

    mov ah, 09h
    lea dx, output_msg      ; print output message
    int 21h

    mov si, OFFSET V3
    mov cl, num   

Print_loop:  
    mov ax, 0
    mov al, [si]            ; to print integer in ax
    inc si 

    div ten                 ; AL = quotient, AH = remainder
    push ax                 ; store ax on stack to preserve value

    mov dl, al
    add dl, 30h
    mov ah, 02h
    int 21h                 ; print tens digit

    pop ax                  ; restore ax
    mov dl, ah
    add dl, 30h
    mov ah, 02h
    int 21h                 ; print units digit

    mov ah, 09h
    lea dx, spc             ; print space
    int 21h

    dec cl
    jne Print_loop 

    mov ah, 4Ch
    mov al, 0
    int 21h

main ENDP
END main

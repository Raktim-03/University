.MODEL SMALL
.STACK 100H
.DATA
    V1      DB 1, 2, 3, 4, 5, 6
    V2      DB 13, 12, 45, 27, 31, 41
    V3      DB 6 DUP(?)   ; Initialize V3 with 6 bytes
    num     DB 6
    ten     DB 10
    spc     DB ' $'
    output_msg DB 10, 13, 'Result Vector: $'

.CODE
main PROC
    ; Initialize data segment (replace .STARTUP)
    mov ax, @data
    mov ds, ax

    ; Set pointers to vectors
    mov si, OFFSET V1    ; SI = address of V1
    mov di, OFFSET V2    ; DI = address of V2
    mov bp, OFFSET V3    ; BP = address of V3
    mov cx, 6            ; Loop counter (CX = 6)

Add_loop:
    ; Add V1[i] + V2[i] and store in V3[i]
    mov al, [si]        ; Load byte from V1
    add al, [di]        ; Add byte from V2
    mov [bp], al        ; Store result in V3
    inc si              ; Move to next byte in V1
    inc di              ; Move to next byte in V2
    inc bp              ; Move to next byte in V3
    loop Add_loop       ; Decrement CX and loop

    ; Print output message
    mov ah, 09h
    lea dx, output_msg
    int 21h

    ; Print result vector
    mov si, OFFSET V3   ; Reset SI to start of V3
    mov cx, 6           ; Reset loop counter

Print_loop:
    ; Convert byte to ASCII and print
    mov ax, 0           ; Clear AX
    mov al, [si]        ; Load byte from V3 into AL
    inc si              ; Move to next byte
    div ten             ; AL = tens digit, AH = units digit
    push ax             ; Save digits
    mov dl, al          ; Print tens digit
    add dl, 30h
    mov ah, 02h
    int 21h
    pop ax              ; Restore digits
    mov dl, ah          ; Print units digit
    add dl, 30h
    mov ah, 02h
    int 21h
    ; Print space
    mov ah, 09h
    lea dx, spc
    int 21h
    loop Print_loop     ; Loop until CX = 0

    ; Terminate program
    mov ah, 4Ch
    int 21h
main ENDP
END main
.model small        ;assembler directive
.stack 100h         ;stack sagment 100hex

.data               ;all variables decleared here
    msg db 'My first Assembly programme $'      ;message
    msg1 db,0dh,0ah, 'Hello World $'
    
.code
main proc               ;starting of the code
    mov ax, @data       ;loading data to ax 
    mov ds, ax          ;ax to data sagment registor (special purpose)
    
    mov ah, 09h         ;display the message
    lea dx, msg         ;lea or mov can be used 
    ;mov dx, offset msg  ; can be displayed if the message is in dx and offset the msg
    int 21h             ; interrupt 21h
    
    mov ah, 09h         ;display the message
    mov dx, offset msg1  ; can be displayed if the message is in dx and offset the msg
    int 21h
    
    mov ah, 4ch         ;terminate the program
    int 21h
    
main endp               ;end the programme
end main
    
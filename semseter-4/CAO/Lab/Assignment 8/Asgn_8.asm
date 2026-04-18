CR         EQU 0DH
LF         EQU 0AH
MAX_SIZE   EQU 10

.MODEL SMALL
.STACK 100H

.DATA
array       DW 10 DUP(?)
prompt_msg  DB 'Enter single digit non-zero integers to be sorted.', CR, LF
            DB 'Enter zero to terminate the input (at most 10).', CR, LF, '$'
output_msg  DB 'Array of numbers in sorted order:', CR, LF, '$'
nwln        DB CR, LF, '$'
count       DW ?
temp        DW ?

.CODE
main PROC
    .STARTUP

    mov     ah, 09h
    lea     dx, prompt_msg                  ;print message
    int     21h

    mov     bx, OFFSET array                ;points to the array
    mov     cx, MAX_SIZE
    sub     dx, dx                          

rd_loop:
    mov     ah, 01h
    int     21h
    sub     al, 30h
    mov     ah, 0
    cmp     ax, 0
    je      stop_read

    mov     [bx], ax
    add     bx, 2
    inc     dx
    loop    rd_loop

stop_read:
    mov     count, dx

    call    selection_sort

    mov     ah, 09h
    lea     dx, output_msg
    int     21h

    mov     cx, count
    cmp     cx, 0
    je      exit_program

    mov     bx, OFFSET array

prt_loop:
    mov     ax, [bx]
    add     al, 30h
    mov     dl, al
    mov     ah, 02h
    int     21h

    mov     ah, 09h
    lea     dx, nwln
    int     21h

    add     bx, 2
    loop    prt_loop

exit_program:
    mov     ah, 4Ch
    mov     al, 0
    int     21h
main ENDP

selection_sort PROC
    push    ax
    push    bx
    push    cx
    push    dx
    push    si
    push    di

    mov     cx, count
    cmp     cx, 1
    jle     sort_done

    mov     si, 0

outer_loop:
    mov     di, si
    mov     ax, si
    inc     ax

                                    ;3214 outer loop ->3
                                    ;inner loop -> 2
                                    ; 2314 outer loop -> 3
                                    ; inner loop -> 1
                                    ;2134 outer loop -> 2
                                    ; inner loop -> 1
                                    ; 1234  
                                    
                                 
    
inner_loop:
    cmp     ax, cx
    jge     swap_elements

    mov     bx, OFFSET array
    mov     dx, di
    add     dx, dx
    add     bx, dx
    mov     dx, [bx]

    mov     bx, OFFSET array
    push    dx
    mov     dx, ax
    add     dx, dx
    add     bx, dx
    mov     dx, [bx]
    mov     bx, dx
    pop     dx

    cmp     bx, dx
    jge     next_element

    mov     di, ax

next_element:
    inc     ax
    jmp     inner_loop

swap_elements:
    cmp     di, si
    je      next_iteration

    mov     bx, OFFSET array
    mov     dx, si
    add     dx, dx
    add     bx, dx
    mov     dx, [bx]
    mov     temp, dx

    mov     bx, OFFSET array
    mov     dx, di
    add     dx, dx
    add     bx, dx
    mov     dx, [bx]

    mov     bx, OFFSET array
    push    dx
    mov     dx, si
    add     dx, dx
    add     bx, dx
    pop     dx
    mov     [bx], dx

    mov     bx, OFFSET array
    mov     dx, di
    add     dx, dx
    add     bx, dx
    mov     dx, temp
    mov     [bx], dx

next_iteration:
    inc     si
    cmp     si, cx
    jl      outer_loop

sort_done:
    pop     di
    pop     si
    pop     dx
    pop     cx
    pop     bx
    pop     ax
    ret
selection_sort ENDP

END main

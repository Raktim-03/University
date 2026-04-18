TITLE AddVector2: Program to add two vectors using register indexed addressing  
.MODEL SMALL  
.STACK 100H  
.DATA  
    V1 DB 1, 2, 3, 4, 5, 6  
    V2 DB 13, 12, 45, 27, 31, 41  
    V3 DB 6 DUP(?)  
    num DB 6  
    ten DB 10  
    spc DB ' $'  
    output_msg DB 10, 13, 'Result Vector: $'  
.CODE  
main PROC  
      
    mov ax, @data  
    mov ds, ax  

    
    mov bx, OFFSET V1    
    mov bp, OFFSET V2  
    mov di, OFFSET V3   
    xor si, si         
    mov cl, num           

Add_loop:  
     
    mov al, [bx + si]   
    add al, [bp + si]   
    mov [di], al        
    inc si              
    inc di             
    loop Add_loop  

  
    mov ah, 09h  
    lea dx, output_msg  
    int 21h  

      
    mov bx, OFFSET V3     
    xor si, si          
    mov cl, num        

Print_loop:  
    mov ax, 0  
    mov al, [bx + si]     
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
    loop Print_loop  

    
    mov ah, 4Ch  
    int 21h  
main ENDP  
END main  
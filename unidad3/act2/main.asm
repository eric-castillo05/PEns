.model small
.stack 100h
.data
    fila db 12
    col  db 40
    ch_car db 'O' 
.code
borrarPosicion proc
    push ax
    push bx
    push cx
    push dx
    mov ah, 02h        
    mov bh, 0
    mov dh, [fila]
    mov dl, [col]
    int 10h
    mov ah, 0Ah
    mov al, ' '
    mov bh, 0
    mov cx, 1
    int 10h
    pop dx
    pop cx
    pop bx
    pop ax
    ret
borrarPosicion endp

cout proc
    push ax
    push bx
    push cx
    push dx
    mov ah, 02h
    mov bh, 0
    mov dh, [fila]
    mov dl, [col]
    int 10h
    mov ah, 09h
    mov al, [ch_car]
    mov bh, 0
    mov bl, 0Eh
    mov cx, 1
    int 10h
    pop dx
    pop cx
    pop bx
    pop ax
    ret
cout endp

cleanScreen proc
    push ax
    push bx
    push cx
    push dx
    mov ax, 0600h
    mov bh, 07h
    mov cx, 0000h
    mov dx, 184Fh
    int 10h
    pop dx
    pop cx
    pop bx
    pop ax
    ret
cleanScreen endp

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 01h
    mov cx, 2000h
    int 10h
    
    call cleanScreen
    call cout
    
main_loop:
    mov ah, 00h
    int 16h
    
    cmp ah, 48h
    je mover_arriba
    cmp ah, 50h
    je mover_abajo
    cmp ah, 4Bh
    je mover_izquierda
    cmp ah, 4Dh
    je mover_derecha
    cmp al, 27
    je salir
    jmp main_loop
    
mover_arriba:
    cmp byte ptr [fila], 0
    jbe main_loop
    call borrarPosicion
    dec byte ptr [fila]
    call cout
    jmp main_loop
    
mover_abajo:
    cmp byte ptr [fila], 24
    jae main_loop
    call borrarPosicion
    inc byte ptr [fila]
    call cout
    jmp main_loop
    
mover_izquierda:
    cmp byte ptr [col], 0
    jbe main_loop
    call borrarPosicion
    dec byte ptr [col]
    call cout
    jmp main_loop
    
mover_derecha:
    cmp byte ptr [col], 79
    jae main_loop
    call borrarPosicion
    inc byte ptr [col]
    call cout
    jmp main_loop
    
salir:
    mov ah, 01h
    mov cx, 0607h
    int 10h
    
    call cleanScreen
    
    mov ax, 4C00h
    int 21h
main endp
end main

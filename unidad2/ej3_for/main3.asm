.model small
.stack 100h
.data
    nombre db "Eric$"
.code
main proc far
    mov ax, @data
    mov ds, ax

    ; Clear screen and set video mode
    mov ah, 0
    mov al, 3
    int 10h

    ; Draw top-left corner
    mov ah, 2
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h
    mov ah, 0Ah
    mov al, 201
    mov bh, 0
    mov cx, 1
    int 10h

    ; Draw top-right corner
    mov ah, 2
    mov bh, 0
    mov dh, 0
    mov dl, 79
    int 10h
    mov ah, 0Ah
    mov al, 187
    mov bh, 0
    mov cx, 1
    int 10h

    ; Draw bottom-left corner
    mov ah, 2
    mov bh, 0
    mov dh, 24
    mov dl, 0
    int 10h
    mov ah, 0Ah
    mov al, 200
    mov bh, 0
    mov cx, 1
    int 10h

    ; Draw bottom-right corner
    mov ah, 2
    mov bh, 0
    mov dh, 24
    mov dl, 79
    int 10h
    mov ah, 0Ah
    mov al, 188
    mov bh, 0
    mov cx, 1
    int 10h

    ; Draw top horizontal line
    mov ah, 2
    mov bh, 0
    mov dh, 0
    mov dl, 1
    int 10h
    mov ah, 0Ah
    mov al, 205
    mov bh, 0
    mov cx, 78
    int 10h

    ; Draw bottom horizontal line
    mov ah, 2
    mov bh, 0
    mov dh, 24
    mov dl, 1
    int 10h
    mov ah, 0Ah
    mov al, 205
    mov bh, 0
    mov cx, 78
    int 10h

    mov cx, 23
    mov dh, 1
vertical_borders:
    ; Left border
    mov ah, 2
    mov bh, 0
    mov dl, 0
    int 10h
    mov ah, 0Ah
    mov al, 186
    mov bh, 0
    push cx
    mov cx, 1
    int 10h
    pop cx
    
    mov ah, 2
    mov bh, 0
    mov dl, 79
    int 10h
    mov ah, 0Ah
    mov al, 186
    mov bh, 0
    push cx
    mov cx, 1
    int 10h
    pop cx
    
    inc dh
    loop vertical_borders
    mov dh, 1
    mov cx, 23
fill_rows:
    push cx
    push dx

    mov ah, 2
    mov bh, 0
    mov dl, 38
    int 10h
    
    lea si, nombre
print_char:
    mov dl, [si]
    cmp dl, '$'
    je next_row
    mov ah, 2
    int 21h
    inc si
    jmp print_char
    
next_row:
    pop dx
    pop cx
    inc dh
    loop fill_rows

    mov ah, 4Ch
    int 21h
main endp
end main
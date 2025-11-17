.model small
.stack
.data
    nombre db "Eric$"
.code

mov_cursor MACRO fila, col
    mov ah, 2
    mov bh, 0
    mov dh, fila
    mov dl, col
    int 10h
ENDM

cout MACRO caracter, cantidad
    mov ah, 9
    mov al, caracter
    mov bh, 0
    mov bl, 7
    mov cx, cantidad
    int 10h
ENDM

clear_screen MACRO
    mov ah, 0
    mov al, 3
    int 10h
ENDM

main proc far
    mov ax, @data
    mov ds, ax

    clear_screen

    mov_cursor 0, 0
    cout 201, 1

    mov_cursor 0, 79
    cout 187, 1

    mov_cursor 24, 0
    cout 200, 1

    mov_cursor 24, 79
    cout 188, 1

    mov_cursor 0, 1
    cout 205, 78

    mov_cursor 24, 1
    cout 205, 78

    mov cx, 23
    mov dh, 1
vertical_borders:
    mov_cursor dh, 0
    cout 186, 1

    mov_cursor dh, 79
    cout 186, 1

    inc dh
    loop vertical_borders

    mov dh, 1
    mov cx, 23
fill_rows:
    push cx
    push dx

    mov_cursor dh, 38

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


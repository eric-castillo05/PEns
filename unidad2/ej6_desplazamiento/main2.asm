.model small
.stack
.data
    msj1 db "Introduce la cantidad: $"
    msj2 db 10,13,"La suma +30 = $"
    num db 5 dup(?)
    suma dw ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; clear screen
	mov ah, 0
	mov al, 3
	int 10h


    mov ah, 9
    mov dx, offset msj1
    int 21h

    mov si, offset num
    cin:
        mov ah, 1
        int 21h
        cmp al, 13
        je convertir
        mov [si], al
        inc si
        jmp cin

    convertir:
        mov [si], 0
        mov si, offset num
        mov ax, 0
        mov bx, 10

    convertir_loop:
        mov dl, [si]
        cmp dl, 0
        je ready
        sub dl, '0'
        mov dh, 0
        mov cx, dx
        mul bx 
        add ax, cx
        inc si
        jmp convertir_loop

    ready:
        add ax, 30 
        mov suma, ax

        mov ah, 9
        mov dx, offset msj2
        int 21h

        mov ax, suma
        mov bx, 10
        mov cx, 0
    conv_ascii:
        xor dx, dx
        div bx
        push dx
        inc cx
        cmp ax, 0
        jne conv_ascii

    show:
        pop dx
        add dl, '0'
        mov ah, 2
        int 21h
        loop show

        mov ah, 4Ch
        int 21h
main endp
end main
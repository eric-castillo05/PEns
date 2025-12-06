.model small 
.stack 100h
.data
    nombre db "Eric$"
    x_1 db ?
    y_1 db ?
    x_2 db ?
    y_2 db ?

.code
public first

    first proc far
        push bp
        mov bp, sp

        mov ax, [bp+6]
        mov x_1, al
        mov y_1, ah

        mov ax, [bp+8]
        mov x_2, al
        mov y_2, ah

        mov ax, 0003h
        int 10h

        
        mov ah, 2
        mov bh, 0
        mov dl, x_1
        mov dh, y_1
        int 10h
        mov ah, 0Eh
        mov al, 201
        int 10h

        mov ah, 2
        mov bh, 0
        mov dl, x_2
        mov dh, y_1
        int 10h
        mov ah, 0Eh
        mov al, 187
        int 10h

        mov ah, 2
        mov bh, 0
        mov dl, x_1
        mov dh, y_2
        int 10h
        mov ah, 0Eh
        mov al, 200
        int 10h

        mov ah, 2
        mov bh, 0
        mov dl, x_2
        mov dh, y_2
        int 10h
        mov ah, 0Eh
        mov al, 188
        int 10h

    
        mov al, 205
        mov cl, x_2
        sub cl, x_1
        dec cl

        mov ah, 2
        mov bh, 0
        mov dl, x_1
        inc dl
        mov dh, y_1
        int 10h

        mov ah, 0Ah
        mov ch, 0
        mov bl, 7
        int 10h

        mov ah, 2
        mov bh, 0
        mov dl, x_1
        inc dl
        mov dh, y_2
        int 10h

        mov ah, 0Ah
        mov ch, 0
        mov bl, 7
        int 10h

        
        mov cl, y_2
        sub cl, y_1
        dec cl
        mov dh, y_1
        inc dh

    loop_vertical:
        mov ah, 2
        mov bh, 0
        mov dl, x_1
        int 10h
        mov ah, 0Eh
        mov al, 186
        int 10h

        mov ah, 2
        mov bh, 0
        mov dl, x_2
        int 10h
        mov ah, 0Eh
        mov al, 186
        int 10h
        inc dh
        dec cl
        jnz loop_vertical
    
        mov ax, 0
        mov al, x_1
        add al, x_2
        mov ah, 0
        mov bl, 2
        div bl          
        mov dl, al      


        lea si, nombre
        mov bx, 0

    count_len:
        mov al, [si]
        cmp al, '$'
        je end_count
        inc bx
        inc si
        jmp count_len

    end_count:

        mov cx, bx     
        mov bl, cl
        mov bh, 0
        mov ax, bx
        mov bl, 2
        div bl          
        sub dl, al     


        mov ax, 0
        mov al, y_1
        add al, y_2
        mov ah, 0
        mov bl, 2
        div bl
        mov dh, al    


        mov ah, 2
        mov bh, 0
        int 10h

        lea si, nombre

    cout_nombre:
        lodsb
        cmp al, '$'
        je end_cout
        mov dl, al
        mov ah, 2
        int 21h
        jmp cout_nombre

    end_cout:

        mov dl, 0
        mov dh, 24
        mov ah, 2
        mov bh, 0
        int 10h

        pop bp
        retf 4

    first endp
end
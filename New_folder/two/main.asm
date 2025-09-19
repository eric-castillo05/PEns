Pila Segment para stack 'stack'
    dp 64 dup('stack')
Pila ends


Datos Segment para public 'code'
    msj1 db "First $"
    msj2 db 10, 13, "Second $"
    msj3 db 10, 13, "Res = $"
    ln db 10, 13, "$"

    var1 db ?
    var2 db ?
    ans db ?

    BDecimal db 10
    Residuo db ?

Datos ends

Codigo Segment para public 'code'
    Principal proc far
    Assume CS:Codigo, SS:Pila, DS:Datos
        mov ax, seg Datos
        mov ds, ax
        mov al, 3
        int 10h

        ; Display the first message
        mov ah, 9
        mov dx, offset msj1
        int 21h

        ; Read the first character
        mov ah, 1
        int 21h
        sub al, 30h
        mov var1, al

        ; Display the second message
        mov ah, 9
        mov dx, offset msj2
        int 21h

        ; Read the second character
        mov ah, 1
        int 21h
        sub al, 30h
        mov var2, al

        ; Subtract the two values
        sub al, var1
        mov ans, al


        ; Show the result message
        mov ah,9
        mov dx, offset msj3
        int 21h

        mov ax, 0
        mov al, ans
        div BDecimal
        mov Residuo, ah

        mov dl, al
        add dl, 30h
        mov ah, 2
        int 21h

        mov dl, Residuo
        add dl, 30h
        mov ah, 2
        int 21h



        ; Endline
        mov ah, 9
        mov dx, offset ln
        int 21h

        ; Finish program
        mov ah, 4ch
        int 21h
        Principal endp
    Codigo ends
end Principal

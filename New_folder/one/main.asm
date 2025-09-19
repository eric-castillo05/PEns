Pila Segment para stack 'stack'
    dp 64 dup('stack')
Pila ends


Datos Segment para public 'code'
    msj1 db "Ingresa el primer valor $"
    msj2 db 10, 13, "Ingresa el segundo valor $"
    msj3 db 10, 13, "La suma es = $"
    ln db 10, 13, "$"
    
    x db ?
    y db ?
    sum db ?

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
        ; Store the value in x after converting from ASCII to number
        sub al, 30h
        mov x, al

        ; show a var
        mov ah, 9
        mov dx, offset msj2
        int 21h

        mov ah, 1
        int 21h

        sub al, 30h
        mov y, al

        ; Add the two values
        ; Since we can add 2 vars, we add the last value in al (y)
        ; to x
        add al, x
        ; Now al has the sum of x and y
        ; Store the result in sum
        mov sum, al


        mov ah, 9
        mov dx, offset msj3
        int 21h

        mov ax, 0 ; clear ax for convience
        mov al, sum
        div BDecimal ; divide al by 10
        ; after the division store it in the remainder
        mov Residuo, ah

        mov dl, al
        add dl, 30h
        mov ah, 2
        int 21h

        mov dl, Residuo
        add dl, 30h
        mov ah, 2
        int 21h

        ; endline before ending the program
        mov ah, 9
        mov dx, offset ln
        int 21h

        ; End program
        mov ah,4ch
        int 21h
        Principal endp
        
    Codigo ends
end Principal

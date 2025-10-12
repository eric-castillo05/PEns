Pila Segment para stack 'stack'
    dp 64 dup ('stack')
Pila ends


Datos Segment para public 'code'
    msj1 db 10, 13, "Hello World", 10, 13, "$" ; cout << "Hello World " << ln;
    ; Hello World\n
    msj2 db "Welcome$"     ; cout << "Welcome"
    ; Welcome
Datos ends


Codigo Segment para public 'code';{
    Principal proc far;{
        Assume CS:Codigo, SS:Pila, DS:Datos
        mov ax, seg Datos ; ax = seg Datos ; mov eax, seg Datos
        mov ds, ax ; ds =  ax

        mov ah, 9
        mov dx, offset msj1
        int 21h

        mov ah, 9
        mov dx, offset msj2
        int 21h

        mov ah, 4ch
        int 21h
    
    Principal endp
    Codigo ends;
end Principal
    

    


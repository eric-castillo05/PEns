Pila Segment para stack 'stack'
        db 64 dup('stack')
Pila ends

Datos Segment para public 'code'
        msj1 db "Hello World!", 10, 13, "$"
        msj2 db "Bienvenido", 10, 13, "$"
        msj3 db "Eric", 10, 13, "$"
Datos ends

Codigo Segment para public 'code'
        Principal proc far
                Assume CS:Codigo, SS:Pila, DS:Datos
                mov ax, seg Datos
                mov ds, ax

                mov ah, 0
                mov al, 3
                int 10h

		; set cursor
                mov ah, 2
                mov bh, 0
                mov dh, 12
                mov dl, 33
                int 10h

                mov dx, offset msj1
                mov ah, 9
                int 21h

		;
		mov ah, 2
		mov bh, 0
		mov dh, 2
		mov dl, 33
		int 10h

		mov dx, offset msj2
		mov ah, 9
		int 21h

		;
		mov ah, 2
		mov bh, 0
		mov dh, 24
		mov dl, 37
		int 10h
	
		mov dx, offset msj3
		mov ah, 9
		int 21h


                mov ah, 4ch
                int 21h
        Principal endp
        Codigo ends
end Principal

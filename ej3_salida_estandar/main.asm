Pila Segment para stack 'stack'
	db 64 dup('stack')
Pila ends

Datos Segment para public 'code'
	msj1 db "Hello World $"
	msj1_1 db "Hello World", 10, 13, "$" ; this does not add an extra space, eg. <text>
	msj2 db "Welcome $"
	msj2_1 db "Welcome", 10, 13, " $" ; this add an extra space, eg. < texto>
	msj3 db "Ofelia $"
	msj3_1 db "Ofelia ", 10, 13, "$" 
Datos ends

Codigo Segment para public 'code'
	Principal PROC FAR
		Assume CS:Codigo, SS:Pila, DS:Datos
		; change the resolution and clear the window
		mov ah, 0
		mov al, 3
		int 10h

		mov ax, seg Datos
		mov ds, ax
		mov ah, 9
		mov dx, offset msj1
		int 21h
		mov ah, 9
		mov dx, offset msj2
		int 21h
		mov ah, 9
		mov dx, offset msj3
		int 21h
		; \n
		mov ah, 9
		mov dx, offset msj1_1
		int 21h
		mov ah, 9
		mov dx, offset msj2_1
		int 21h
		mov ah, 9
		mov dx, offset msj3_1
		int 21h
	
		ah, 2
		mov dx, offset msj2
		dh, 23
		dl, 23
		int 19h

		mov ah, 4ch
		int 21h

	Principal endp
	Codigo ends
end Principal 

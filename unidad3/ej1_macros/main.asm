.stack
.data
	msj1 db "Hola$"
	msj2 db "Juan$"
	msj3 db "Bienvenido a los macros$"
	cont db ?

paint macro codigo
	mov ah, 2
	mov dh, codigo
	int 21h
endm

cout macro msj
	mov ah, 9
	mov dx, offset msj
	int 21h

clean macro
	mov ah, 0
	mov al, 3
	int 10h
endm
.code
	main proc far
		mov ax, @data
		mov ds, ax
		
		clean
		

.model small
.stack
.Data
	a db 9
	b db 9
	msj1 db "A es mayor que B$"
	msj2 db "B es mayor que A$"
	msj3 db "A y B son iguales$"
	ln db 10, 13, "$"

.code
	main proc far
		mov ax, @data
		mov ds, ax
		

		; limpiar pantalla
		mov ah, 0
		mov al, 3
		int 10h

		mov al, a
		cmp al, b
		ja msja
		jb msjb
		je msjc

		msja:
			mov ah, 9
			mov dx, offset msj1
			int 21h
			jmp endl

		msjb:
			mov ah, 9
			mov dx, offset msj2
			int 21h
			jmp endl

		msjc:
			mov ah, 9
			mov dx, offset msj3
			int 21h
			jmp endl

		endl:
			mov ah, 9
			mov dx, offset ln
			int 21h
			jmp fin

		fin:
			mov ah, 4ch
			int 21h
	main endp
end main

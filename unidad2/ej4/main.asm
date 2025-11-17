.model small
.stack
.data
	password db 25 dup(?)
	msj1 db "dar password$"
	msj2 db "password incorrecta$"
	msj3 db "password correcta$"
	password db "123$"
	ln db 10, 13, "$"

.code
	main proc far
		mov ax, @data
		mov ds, ax
		
		mov ah, 9
		mov dx, offset msj1
		int 21h
		
		mov ah, 9
		mov dx, offset ln
		int 21h

		mov cx, 10
		mov si, 0
		cycle1:
			mov ah, 7
			int 21h
			cmp al, 13d
			je mov_contador

			mov password[si], al

			mov ah, 2
			mov dl, "*"
			int 21h
				

		
			inc si
		loop cycle1
		mov_contador:
			mov cx, 10
		mov ah, 9
		mov dx, offset ln	
		int 21h
		mov ah, 4ch
		int 21h
	

	main endp
end main

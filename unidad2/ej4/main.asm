.model small
.stack
.data
	password db 25 dup(?)
	correcta db "1234$"
	msj1 db "dar password$"
	msj2 db "password incorrecta$"
	msj3 db "password correcta$"
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
		mov password[si], '$' ; terminador de cadena

		; salto de línea
		mov ah, 9
		mov dx, offset ln	
		int 21h

		; comparar contraseñas
		mov si, offset password
		mov di, offset correcta

	comparar:
		mov al, [si]
		mov bl, [di]
		cmp al, bl
		jne incorrecta
		cmp al, '$'
		je correcta_
		inc si
		inc di
		jmp comparar

	correcta_:
		mov ah, 9
		mov dx, offset ln
		int 21h
		mov ah, 9
		mov dx, offset msj3
		int 21h
		mov ah, 9
		mov dx, offset ln
		int 21h
		jmp fin

	incorrecta:
		mov ah, 9
		mov dx, offset ln
		int 21h
		mov ah, 9
		mov dx, offset msj2
		int 21h
		mov ah, 9
		mov dx, offset ln
		int 21h

	fin:
		mov ah, 4ch
		int 21h

	main endp
end main

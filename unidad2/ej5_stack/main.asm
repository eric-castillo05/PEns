.model small
.stack
.data
	nombre db "Eric Benitez Castillo$"
	ln db 10, 13, "$"
.code
	main proc far
		mov ax, @data
		mov ds, ax
		
		mov ah, 0
		mov al, 3
		int 10h
		
		mov al, "$"
		push ax
		mov si, 0

		cycle1:
			mov al, nombre[si]
			cmp al, "$"
			je print_stack
			push ax
			inc si
			jmp cycle1

		print_stack:
			pop dx
			cmp dl, "$"
			je fin
			mov ah, 2
			int 21h
			jmp print_stack
		

		fin:
			mov ah, 9
			mov dx, offset ln
			int 21h

			mov ah, 4ch
			int 21h
	main endp
end main

.model small
.stack
.data
	numtexto db 5 dup(?)
	numero_invertido db 5 dup (?)
	base db 10
	msj1 db "Introdyce la cantidad: $"
	numero db ?
	msj2 db 10, 13, "la suma +30 = $"
	ln db 10, 13, "$"
	expo db 1, 10, 100
	suma db ?

.code
	main proc far
		mov ax, @data
		mov ds, ax

		; clear screen
		mov ah, 0
		mov al, 3
		int 10h
	
		mov ah, 9
		mov dx, offset msj1
		int 21h
		
		mov al, "$"
		push ax

		enter_char:
			mov ah, 1
			int 21h
			cmp al, 13
			je _push_last
			push ax
			jmp enter_char
		mov si, 0
		_push_last:
			push ax
			jmp _invert_number
		_invert_number:
			pop dx
			cmp dl, "$"
			je _convert
			mov ah, 2
			int 21h
			mov dl, numero_invertido[si]
			inc si
			jmp _invert_number
		mov ah, 9
		mov dx, offset ln
		int 21h
		mov si, 0
		mov suma, 0
		mov ax, 0
		_convert:
			mov al, numero_invertido[si]
			cmp al, "$"
			je _end
			sub al, 30h
			mul expo[si]
			add suma, al
			inc si
			jmp _convert
		_end:
			mov ah, 4ch
			int 21h
	main endp
end main

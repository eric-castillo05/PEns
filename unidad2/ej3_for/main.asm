.model small
.stack
.Data
	nombre db "loop", 10, 13, "$"
	ln db 10, 13, "$"

.code
	main proc far

	mov ax, @data
	mov ds, ax

	mov ah, 0
	mov al, 3
	int 10h

	mov cx, 10
	cycle1:
		mov ah, 9
		mov dx, offset nombre
		int 21h

	loop cycle1
	
	mov ah, 9
	mov dx, offset ln
	int 21h

	mov si, 1
	cycle2:
		cmp si, 10
		jbe cout
		jmp fin
	cout:
		mov ah, 9
		mov dx, offset nombre
		int 21h
		inc si
		jmp cycle2
	fin:
		mov ah, 4ch
		int 21h
	
	;mov ah, 4ch
	;int 21h
	main endp
end main

.model small
.stack
.data
	nombre db 25 dup(?)
.code
	main proc far
	mov ax, @data
	mov ds, ax
	mov si, 0
	cycle1:
		mov ah, 1
		int 21h
		cmp al, 13
		je end_cycle1
		mov nombre[si], al
		inc si
		jmp cycle1
	end_cycle1:
		mov ah, 0
		mov al, 3
		int 10h
		mov ah, 2
		mov dh, 12
		mov dl, 40
		int 10h
		
		mov ah, 9
		mov dx, offset nombre
		int 21h
		
		mov ah, 4ch
		int 21h
	
	main endp
end main

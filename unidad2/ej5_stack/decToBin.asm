.model small
.stack
.data
	numDecimal db 192
	base db 2
	ln db 10, 13, "$"
.code
	main proc far
		mov ax, @data
		mov ds, ax
		
		mov ah, 0
		mov al, 3
		int 10h
		
		mov ah, "$"
		push ax
		mov ax, 0
		mov al, numDecimal
		cycle1:
			div base
			cmp al, 0
			je push_last	
			push ax
			mov ah, 0
			jmp cycle1

		push_last:
			push ax
			jmp print_stack

		print_stack:
			pop dx
			cmp dh, "$"
			mov dl, dh
			je fin
			add dl, 30h
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
		

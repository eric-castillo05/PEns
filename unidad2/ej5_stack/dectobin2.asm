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
		
		mov cx, 8              ; Counter for 8 bits
		mov ah, 0
		mov al, numDecimal
		
		cycle1:
			div base
			push ax            ; Push remainder (bit)
			mov ah, 0
			dec cx
			cmp cx, 0
			jne cycle1
		
		mov cx, 8              ; Reset counter for printing
		
		print_stack:
			pop dx
			add dl, 30h        ; Convert to ASCII
			mov ah, 2
			int 21h
			dec cx
			cmp cx, 0
			jne print_stack
			
		fin:
			mov ah, 9
			mov dx, offset ln
			int 21h
			mov ah, 4ch
			int 21h
	main endp
end main

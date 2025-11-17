.model small
.stack
.data
	numDecimal dw 0
	nNumbers db 0
	base dw 2
	ln db 10, 13, "$"
	bases db 1, 10, 100
	
cout_register macro char
	mov dl, char
	mov ah, 2h
	int 21h
endm

cout_offset macro reference
	mov ah, 9
	mov dx, offset reference
	int 21h
endm

cin macro
	mov ah, 1
	int 21h
endm

.code
	public second
	second proc far
		mov nNumbers, 0
		mov numDecimal, 0
		
	cin_numbers:
		cin
		cmp al, 13
		je exit_cin
		sub al, 30h
		mov bl, al
		push bx
		inc nNumbers
		jmp cin_numbers
		
	exit_cin:
		mov cl, nNumbers
		mov ch, 0
		mov si, 0
		
	convert_numbers:
		cmp cl, 0
		je temp_fun
		
		pop bx
		mov al, bl
		mov ah, 0
		mov bl, bases[si]
		mov bh, 0
		mul bx
		
		add numDecimal, ax
		inc si
		dec cl
		jmp convert_numbers
		
	temp_fun:
		mov ax, numDecimal
		mov dx, 0
		mov cx, 8
		
	cycle:
		div base
		push dx
		mov dx, 0
		dec cx
		jnz cycle
		
		mov cx, 8
		
	cout_stack:
		pop dx
		add dl, 30h
		cout_register dl
		loop cout_stack
		
		cout_offset ln
		ret
	second endp
end

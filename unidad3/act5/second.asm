.model small
.stack
.data
	numDecimal db ?
	base db 2
	ln db 10, 13, "$"

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
		cin
		cout_offset ln
		sub al, 30h
		mov cx, 8
		mov ah, 0
		cycle:
			div base
			push ax
			mov ah, 0
			dec cx
			jnz cycle
		mov cx, 8

		cout_stack:
			pop ax
			add ah, 30h
			mov dl, ah
			mov ah, 2
			int 21h
			loop cout_stack	
		cout_offset ln	
		ret
	second endp
end

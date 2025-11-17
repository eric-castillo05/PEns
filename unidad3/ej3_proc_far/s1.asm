.model small
.stack
.data
	msj db "El resultado de la suma = $"
	base db 10
	res db ?

cout_integer macro integer	
	mov dl, integer
	mov ah, 2h
	add dl, 30h
	int 21h
endm

cout macro char
	mov ah, 9
	mov dx, offset char
	int 21h
.code
	public suma
		suma proc far
			mov ax, @data
			mov ds, ax
			push bp
			mov bp, sp
			mov bx, [bp + 6]
			add bl, 10
			cout msj
			mov ax, bx
			div base
			mov res, ah
			cout_integer ah
			cout_integer res
			pop bp
			ret 2
			
	suma endp
end suma

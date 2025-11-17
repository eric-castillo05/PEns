.model small
.stack
.data
	msj db "Eric Benitez Castillo$"

cout_offset macro reference
	mov ah, 9
	mov dx, offset reference
	int 21h
endm
return macro zero
	mov ah, 4ch
	int 21h
endm

.code
	public first
		first proc far
		cout_offset msj
		ret
	first endp
			
end

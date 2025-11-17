.model small
.stack
.data

clear_screen macro
	mov ah, 0
	mov al, 3
	int 10h
endm

return macro zero
	mov ah, 4ch
	int 21h
endm

.code
	main proc far
		mov ax, @data
		mov ds, ax
		clear_screen
		mov ax, 5
		push ax
		call suma
		return 0
	main endp
end main

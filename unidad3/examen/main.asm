.model small
.stack
.data
    x1 db 1
    y1 db 1
    x2 db 78
    y2 db 23


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
	    extrn first:far

		mov ax, @data
		mov ds, ax

		clear_screen

		mov al, [x2]
		mov ah, [y2]
		push ax

		mov al, [x1]
		mov ah, [y1]
		push ax

		call first

		return 0
	main endp
end main
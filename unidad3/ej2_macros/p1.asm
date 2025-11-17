.model small
.stack
.data

	msj1 db "Estas en principal$"
.code
	main proc far
		mov ax, @data
		mov ds, ax
		; clear screen
		mov ah, 9
		mov offset msj1
		int 21h
		
		call pro1
		call pro3
		call pro2
		
		mov ah, 4ch
		int 21h
	main endp
end main


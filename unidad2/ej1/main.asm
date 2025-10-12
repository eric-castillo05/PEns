.model small
.stack
.Data
	nombre db "Juan $"
.code
main proc far
	mov ax, @data
	mov ds, ax

	; limpiar pantalla
	mov ah, 0
	mov al, 3
	int 10h

	mov ah, 2
	; mov bh, 0
	mov dh, 12
	mov dl, 30
	int 10h
	
	mov ah, 9
	mov dx, offset nombre
	int 21h



	mov ax, 4c00h
	int 21h
	; mov ah, 4ch
	; int 21h

main endp
end main

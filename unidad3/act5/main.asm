.model small
.stack
.data
	ln db 10, 13, "$"
	msj_menu db "1. Nombre", 10, 13, "2. Binario", 10, 13, "3. Margen", 10, 13, "4. Salir", 10, 13, "Dar opcion: ","$"
	msj db "works$"

return macro zero
	mov ah, 4ch
	int 21h
endm

clear_screen macro
	mov ah, 0
	mov al, 3
	int 10h
endm

cout_offset macro reference
	mov ah, 9
	mov dx, offset reference
	int 21h
endm

cout_register macro char
	mov dl, char
	mov ah, 2h
	int 21h
endm

cin macro
	mov ah, 1
	int 21h
endm



.code
	main proc far
		extrn first:far
		extrn second:far
		extrn three:far
		mov ax, @data
		mov ds, ax
			
		clear_screen
		
		cycle_menu:
			cout_offset ln
			cout_offset msj_menu
			cin
			cmp al, '1'
			je case_1
			cmp al, '2'
			je case_2
			cmp al, '3'
			je case_3
			cmp al, '4'
			je exit
		case_1:
			cout_offset ln
			; call first
			jmp cycle_menu
		case_2:
			cout_offset ln
			; call second
			jmp cycle_menu
		case_3:
			cout_offset ln
			call three
			jmp cycle_menu
		temporal:
			cout_offset msj
			cout_offset ln
			jmp cycle_menu
		exit:
			cout_offset ln
			return 0
		return 0

	main endp
end main

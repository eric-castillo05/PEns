.model small
.stack
.data
	ln db 10, 13, "$"
	menu db "Menu ", 10, 13, 
		"1. SHL/SAL", 10, 13,
		"2. SAR", 10, 13
		"3. SHR", 10, 13,
		"4. exit", 10, 13,
		"Enter option", 10, 13, "$" 
.code
	main proc far
	mov ax, @data
	mov ds, ax
	
	cycle_1:
		mov ah, 9
		mov dx, offset menu
		int 21h
		
		mov ah, 1
		int 21h
		
		cmp al, 34h
		je end_cycle_1	
	
		c mp al 31h
		
	
	main endp
end main

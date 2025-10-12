Pila Segment para stack 'stack'

	DP 64 dup ('stack')

Pila ends
 
Datos Segment para public 'code'

	ln dw 10,13, "$"

	msj1 db "Ingresa la variable 1 $"

	msj2 db "Ingresa la variable 2 $"

	v1 db ?

	v2 db ?

	residuo db ?

	r db ?

	bd db 10

Datos ends
 
Codigo Segment para public 'code'

	principal proc far

	assume ss: Pila, ds: Datos, cs: Codigo

		mov ax, seg Datos

		mov dx, ax

		mov al, 3

		int 10h

		mov ah, 9 ;inicia el msj1

		mov dx, offset msj1 

		int 21h ;Termina msj1

		mov ah, 1

		int 21h

		mov v1, al

		mov ah, 9;inicia

		mov dx, offset ln

		int 21h ;termina

		mov ah, 9 ;inicia

		mov dx, offset msj2

		int 21h ;termina

		mov ah, 1

		int 21h

		mov v2,al

        add al, v1

        mov r, al
 
		

		mov ah, 9 ;inicia
 
		int 21h ;termina

		mov ah, 4ch

		int 21h	

	principal endp

Codigo ends

end principal
 
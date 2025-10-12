Pila Segment para stack 'stack'
	DB 64 dup ('stack')
Pila ENDS


Datos Segment para public 'data'
	dddd dw 0
	dddw dw 300
	dddx dw 200
	dddy dw 150
	dddz dw 125
 	dddq dw 100
 	dddr dw 80
 	ddds dw 70
 	dddj dw 60
 	dddu dw 50
Datos ends


Codigo Segment para public 'code'
	Principal proc far
		Assume CS:Codigo, DS:Datos, SS:Pila
		mov ax, seg Datos
		mov ds, ax
		mov ax, dddw
		mov bx, offset dddx ; &dddx
		mov ax, [bx] ; *bx
		mov ax, [bx+2]
		mov si, 2
		mov ax, dddz[si]
		mov bx, offset dddw
		mov si, 8
		mov ax, [bx][si+2]
		mov ah, 4ch
		int 21h
	Principal endp
Codigo ends
end Principal
			 

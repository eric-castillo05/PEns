Pila segment para stack 'stack'
DB 64 dup('stack')
Pila ENDS

Datos Segment para public 'Data'
	v1 dw 20
	v2 dw 30
	R  dw ?
Datos ENDS

codigo segment para public 'code'
	principal proc FAR
		Assume cs:codigo,SS:Pila,DS:Datos
			mov Ax, seg Datos
			mov DS,Ax
			mov Ax,v1
			mov Bx,v2
			add Ax,Bx
			mov R,AX
            mov Ah,4ch 
            Int 21h
	principal ENDP 
codigo ENDS  
END principal

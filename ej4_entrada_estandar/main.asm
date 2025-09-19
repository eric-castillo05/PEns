pila Segment para stack 'stack'
    db 64 dup('stack')
pila ends

Datos segment para public 'data'
    m1 DB "Introduce valor 1?$"
    m2 DB 10,13,"Introduce valor 2?$"
    m3 DB 10,13,"la suma=$"

    v1 DB ?
    v2 DB ?
    R  DB ?

    BDecimal DB 10
    Resudio db ?
Datos ENDS
codigo segment para public 'code'
    principal proc FAR
    Assume cs:codigo,DS:Datos,ss:Pila
    mov Ax,seg datos
    mov Ds,Ax
    mov AL,3
    int 10h

    mov ah,9                ;siver para mostrar el mensaje 
    mov Dx, offset m1
    int 21h

    mov ah,1                ;captura un caracter 
    int 21h

    sub al,30h              ;sub sirve para restar y 30h va restar lo que tiene al 
    mov v1,al

    mov ah,9                ;siver para mostrar el mensaje 
    mov Dx, offset m2
    int 21h

    mov ah,1                ;captura un caracter 
    int 21h

    sub al,30h
    mov v2,al

    add al,v1               ;sumar el valo que contenga las variables
    
    mov R,al

    mov ah,9
    mov DX,offset m3        ;mostrar resultado
    int 21h 

    ;para mostrar solo un numero 
    ;mov R,al
    ;add R,30h 
    ;mov dl,R  
    ;mov ah,2                ;Exhibir un caracter
    ;int 21h
    
    ;division para mostrar 2 digitos de la suma
    mov AX,0
    mov Al,R 
    Div BDecimal
    mov Resudio,Ah

    mov DL,Al
    add DL,30h
    mov ah,2
    int 21h

    mov DL,Resudio
    add DL,30h
    mov ah,2
    int 21h

    mov ah,4ch
    int 21h
    principal ENDP
codigo ENDS
END principal

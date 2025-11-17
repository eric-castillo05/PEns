.model small
.stack
.data
    ln db 10, 13, "$"
    space db " $"

cout_char macro char
    mov dl, char
    mov ah, 2h
    int 21h
endm

cout macro char
    mov ah, 9
    mov dx, offset char
    int 21h
endm

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
cout_upper proc near
    upper:
        cout_char al
        cout space
        inc al
        cmp al, 91
        jne upper
        ret
cout_upper endp


cout_lower proc near
    lower:
        cout_char al
        cout space
        inc al
        cmp al, 123
        jne lower
        ret
cout_lower endp

cout_numbers proc near
    numbers:
        cout_char al
        cout space
        inc al
        cmp al, 58
        jne numbers
        ret
cout_numbers endp


main proc far
    mov ax, @data
    mov ds, ax

    clear_screen

    mov al, 65
    call cout_upper
    cout ln

    mov al, 97
    call cout_lower
    cout ln

    mov al, 48
    call cout_numbers
    cout ln

    return 0
main endp
end main

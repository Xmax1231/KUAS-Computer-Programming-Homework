TITLE
INCLUDE Irvine32.inc
.data
     prompt byte "a   {xmax|XMAX} oifjsijfoisjdfoisjfioj",0
.code
main PROC
    lea edx,prompt
    call WriteString
    call crlf

    push offset prompt         ;ebp+12
    push lengthof prompt       ;ebp+8
    call Uppercase             ;ebp+4 (return address)
    call WriteString

    exit
main ENDP

Uppercase PROC
    push ebp
    mov ebp,esp

    mov esi,0
    mov eax,0
    mov ebx,0
    mov ecx,0
    mov edx,0
    mov ecx,[ebp+8]
    mov edx,[ebp+12]

@1: mov bl,[edx+esi]
    cmp bl,61h        ;a=61h
    jl @2
    cmp bl,7Ah        ;z=7Ah
    jg @2
    sub bl,20h
    mov [edx+esi],bl
@2: inc esi
    loop @1

    pop ebp
    ret 8
Uppercase ENDP

END main
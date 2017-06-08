TITLE
INCLUDE Irvine32.inc

.data
    @tt byte "Fahrenheit: ",0
    @dot byte ".",0
    @Fahrenheit dword ?
.code
main PROC
    push OFFSET @tt
    call ReadNum
    mov @Fahrenheit,eax

    push OFFSET @dot     ;[ebp+12]
    push @Fahrenheit     ;[ebp+8]
    call Writesurface    ;[ebp+4] return address
    exit
main ENDP

ReadNum PROC
    push ebp
    mov ebp,esp

    mov esi,0
    mov eax,0
    mov ebx,0
    mov ecx,0
    mov edx,0

    mov  edx,[ebp+8]
    call WriteString
    call ReadInt
    pop ebp
    ret 4
ReadNum ENDP

Writesurface PROC
    push ebp              ;[ebp+0]
    mov ebp,esp

    mov esi,0
    mov eax,0
    mov ebx,0
    mov ecx,0
    mov edx,0

    mov eax,[ebp+8]
    sub eax,20h
    mov ebx,5
    imul ebx
    cdq
    mov ebx,9
    idiv ebx

    call WriteDec

    test edx,edx
    jz @break
    mov eax,edx
    mov edx,[ebp+12]
    call WriteString

@1: mov ebx,10
    mul ebx
    mov ebx,9
    idiv ebx
    call WriteDec
    mov eax,edx
    inc esi
    cmp esi,15
    jg @break
    test eax,eax
    jnz @1

@break:
    pop ebp
    ret 8
Writesurface ENDP

END main
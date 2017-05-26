TITLE
INCLUDE Irvine32.inc

.data
    @tt byte "number: ",0
    @length dword ?
    @width dword ?
    @height dword ?
.code
main PROC
    push OFFSET @tt
    call ReadNum
    mov @length,eax
    push OFFSET @tt
    call ReadNum
    mov @width,eax
    push OFFSET @tt
    call ReadNum
    mov @height,eax

    push @length        ;[ebp+16]
    push @width         ;[ebp+12]
    push @height        ;[ebp+8]
    call Writevolume    ;[ebp+4] return address
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

Writevolume PROC
    push ebp             ;[ebp+0]
    mov ebp,esp

    mov esi,0
    mov eax,0
    mov ebx,0
    mov ecx,0
    mov edx,0

    mov eax,[ebp+8]
    mov ebx,[ebp+12]
    imul ebx
    mov ebx,[ebp+16]
    imul ebx
    call WriteInt
    pop ebp
    ret 12
Writevolume ENDP

END main
TITLE
INCLUDE Irvine32.inc
.data
    arr1 dword -1,-5,9,9487,78,34
    arr2 dword -1,-5,9,87,-87,34
.code
main PROC
    push offset arr2        ;ebp+16
    push offset arr1        ;ebp+12
    push lengthof arr1      ;ebp+8
    call CountMatches       ;ebp+4 (return address)
    call WriteDec
    exit
main ENDP

CountMatches PROC
    push ebp                ;ebp+0
    mov ebp,esp

    mov esi,0
    mov eax,0
    mov ebx,0
    mov ecx,0
    mov edx,0
    mov ecx,[ebp+8]
    
@1: mov ebx,[ebp+12]        ;offset arr1
    mov edx,[ebx+[esi]]
    mov ebx,[ebp+16]        ;offset arr2
    cmp edx,[ebx+[esi]]
    jnz @2
    inc eax
@2: add esi,4
    loop @1

    pop ebp
    ret 12
CountMatches ENDP

END main
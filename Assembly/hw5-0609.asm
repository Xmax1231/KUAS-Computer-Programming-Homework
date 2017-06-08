TITLE
INCLUDE Irvine32.inc

.data
    key BYTE -2, 4, 1, 0, -3, 5, 2, -4, -4, 6
    tt  BYTE "@@@@@@@@@@@@D@@@@@@@@@@@@@@@@@@",0
    tt2  BYTE "katou megumi boku wa daisuki.<3",0
    Encryption PROTO, keyw:DWORD, str1:DWORD, len:DWORD
    Decryption PROTO, keyw:DWORD, str1:DWORD, len:DWORD
    alert PROTO, str1:DWORD
.code
main PROC
    INVOKE Encryption, ADDR key, ADDR tt, lengthof tt
    INVOKE alert, ADDR tt
    INVOKE Decryption, ADDR key, ADDR tt, lengthof tt
    INVOKE alert, ADDR tt
    INVOKE Encryption, ADDR key, ADDR tt2, lengthof tt2
    INVOKE alert, ADDR tt2
    INVOKE Decryption, ADDR key, ADDR tt2, lengthof tt2
    INVOKE alert, ADDR tt2
    exit
main ENDP

alert PROC, str1:DWORD
    mov edx,str1
    call writestring
    call crlf
    ret
alert ENDP

Encryption PROC, keyw:DWORD, str1:DWORD, len:DWORD
    mov esi,keyw
    mov edi,str1
    mov eax,0
    mov ebx,0
    mov ecx,0
    mov edx,len

@lp:mov cl,[esi+ebx]
    test cl,cl
    jz @1
    cmp cl,0
    jg @2
    neg cl
    rol byte ptr [edi+eax],cl
    jmp @1
@2: ror byte ptr [edi+eax],cl
@1: inc ebx
    dec edx
    inc eax
    cmp ebx,10
    jl @3
    mov ebx,0
@3: cmp edx,0
    jg @lp

    ret
Encryption ENDP
Decryption PROC, keyw:DWORD, str1:DWORD, len:DWORD
    mov esi,keyw
    mov edi,str1
    mov eax,0
    mov ebx,0
    mov ecx,0
    mov edx,len

@lp:mov cl,[esi+ebx]
    test cl,cl
    jz @1
    cmp cl,0
    jg @2
    neg cl
    ror byte ptr [edi+eax],cl
    jmp @1
@2: rol byte ptr [edi+eax],cl
@1: inc ebx
    dec edx
    inc eax
    cmp ebx,10
    jl @3
    mov ebx,0
@3: cmp edx,0
    jg @lp

    ret
Decryption ENDP
END main
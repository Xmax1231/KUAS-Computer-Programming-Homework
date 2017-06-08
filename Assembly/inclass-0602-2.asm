INCLUDE Irvine32.inc

.data
	target BYTE "abcxxxxdefghijklmop", 0
	Str_remove PROTO, str1:DWORD, len:DWORD
.code
main PROC
	INVOKE Str_remove, ADDR [target+3], 4
	lea edx,target
	call WriteString
	exit
main ENDP

Str_remove PROC, str1:DWORD, len:DWORD
	mov esi,str1
	mov edi,esi
	add edi,len

	mov ebx,0
@1:	mov bl,[edi]
	mov [esi],bl
	inc esi
	inc edi
	test bl,bl
	jnz @1

	ret
Str_remove ENDP

END main
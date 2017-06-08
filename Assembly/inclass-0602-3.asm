INCLUDE Irvine32.inc

.data
	target BYTE "Johnson, Calvin", 0
	Str_nextword PROTO, str1:DWORD, keyword:DWORD
.code
main PROC
	INVOKE Str_nextword, ADDR target, ','
	call WriteInt
	exit
main ENDP

Str_nextword PROC, str1:DWORD, keyword:DWORD
	mov esi,str1
	mov edi,keyword
	mov eax,0

@1:	mov dl,[esi]
	inc esi
	inc eax
	cmp dl,[edi]
	je @bk
	test dl,dl
	jnz @1
	CLD
	jmp @ed
@bk:STD
@ed:
	ret
Str_nextword ENDP

END main
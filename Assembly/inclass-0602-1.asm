INCLUDE Irvine32.inc

.data
	targetStr BYTE "ABCDE", 10 DUP(0)
	sourceStr BYTE "FGH", 0
	Str_concat PROTO, str1:DWORD, str2:DWORD
.code
main PROC
	INVOKE Str_concat, ADDR targetStr, ADDR sourceStr
	lea edx,targetStr
	call WriteString
	exit
main ENDP

Str_concat PROC, str1:DWORD, str2:DWORD
	mov esi,str1	;offset targetStr 
	mov edi,str2	;offset sourceStr
	mov eax,0
	mov ebx,0

@1:	mov bl,[esi]
	inc esi
	test ebx,ebx
	jnz @1
	dec esi			;start '0'
	
	mov ecx,0
	mov edx,0
@2:	mov cl,[edi]
	mov [esi],cl
	inc edi
	inc esi
	test ecx,ecx
	jnz @2
	ret
Str_concat ENDP

END main
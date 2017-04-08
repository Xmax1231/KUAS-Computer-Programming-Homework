TITLE
INCLUDE Irvine32.inc

.data
	buffer BYTE "This is a Plaintext message"
	nothing BYTE 10 dup(?)
	kyword	BYTE "ABXmv#7"
	N BYTE 0

.code
main PROC

mn:					; N=0 加密 ，N=1 解密
	mov ecx,LENGTHOF buffer		; ecx = buffer的長度
	mov esi,0			; init
	mov ebx,0			; init
L1:								
	mov al,kyword[ebx]		; read key
	xor buffer[esi],al		; xor
	inc esi				; esi ++
	inc ebx				; ebx ++
	cmp ebx,LENGTHOF kyword		; if ebx > key的長度
	jae L1_1			; then L1_1
L1_0:
	loop L1				; LOOP
	jmp next			; end

L1_1:					;
	mov ebx,0			; ebx = 0
	jmp L1_0			; goback

next:					;
	mov edx,offset buffer		; print("%s", buffer)
	call writestring		; call module
	call  Crlf			; print("\n")
	inc N				; N ++
	cmp N,2				; if N < 2
	jb mn				; again
exit
main ENDP
END main

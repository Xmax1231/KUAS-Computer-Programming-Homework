TITLE
INCLUDE Irvine32.inc

delay_time = 500
.data
	numbers BYTE 10 DUP(?)
.code
main PROC
	mov ebx,0
	call Randomize
@1:
	mov eax,99
	call RandomRange 
	inc eax
	mov numbers[ebx],al
	call WriteDec
	call Crlf
	inc ebx
	cmp ebx,10
	jb @1
	call WaitMsg

exit
main ENDP
END main
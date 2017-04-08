TITLE
INCLUDE Irvine32.inc

.data
	text BYTE "Please input something: ",0
	buffer BYTE 100 DUP(?),0
	t BYTE "Title"

.code
main PROC
	lea edx,text
	call WriteString

	lea edx,buffer
	mov ecx,( SIZEOF buffer ) - 1
	call ReadString

	lea eax,buffer
	lea ebx,t

	push MB_OK
	push ebx
	push eax
	push 0
	call MessageBox

	push 0
	call ExitProcess
exit
main ENDP
END main
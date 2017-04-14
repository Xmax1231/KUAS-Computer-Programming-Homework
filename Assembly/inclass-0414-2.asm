TITLE
INCLUDE Irvine32.inc

delay_time = 500
.data
	sum BYTE ?
	text1 BYTE "A = ",0
	text2 BYTE "B = ",0
	text3 BYTE "A + B = ",0
.code
main PROC
	lea edx,text1
	call WriteString
	call ReadInt
	mov sum,al
	call Clrscr

	lea edx,text2
	call WriteString
	call ReadInt
	add sum,al
	call Clrscr

	lea edx,text3
	call WriteString
	mov eax,0
	mov al,sum
	call WriteDec
	call Crlf
	call WaitMsg
exit
main ENDP
END main
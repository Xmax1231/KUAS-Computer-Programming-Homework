TITLE
INCLUDE Irvine32.inc

delay_time = 1000
.data
	number BYTE 1
	number2 BYTE 10
.code
main PROC

;Use different foreground colors to show the numbers
	mov eax,white+(blue*16)
	call SetTextColor
	call Clrscr

;Show numbers 1 to 10 on the screen (call WriteInt)
@1:	movzx eax,number
	call random_places
	call WriteInt
	inc number
	jmp @3

;Show numbers 10 to 1 on the screen
@3:	movzx eax,number2
	test al,al
	jz @4
	call random_places
	call WriteInt
	call Delay_1sec
	call Clear_screen
	dec number2
	cmp number,10
	jg @4
	jmp @1
@4:

exit
main ENDP

Delay_1sec PROC  ;Pause 1 second before showing the numbers.
	PUSHAD
	mov eax,delay_time
	call Delay
	POPAD
	ret
Delay_1sec ENDP

Clear_screen PROC  ;Clear the screen
	PUSHAD
	call Clrscr
	POPAD
	ret
Clear_screen ENDP

random_places PROC
	PUSHAD
	mov dl,30
    mov dh,5
    call goto_XY
	POPAD
	ret
random_places ENDP

goto_XY PROC
	mov eax,20
	call RandomRange
	add dl,al
	call RandomRange
	add dh,al
	call GotoXY
	ret
goto_XY ENDP

END main
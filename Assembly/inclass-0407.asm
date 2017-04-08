TITLE
INCLUDE Irvine32.inc

.data
	sum DWORD ?
	count DWORD ?
	array DWORD 0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100,-1,-2,-3,-4,-5
	array_length = ($ - array) / TYPE DWORD
.code
main PROC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Q1
;	mov sum,0
;	mov count,0
;L1:
;	cmp	sum,1000
;	jae next
;	mov eax,count
;	add sum,eax
;	inc count
;	jmp L1
;next1:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Q2
;	mov sum,1100
;	mov count,1
;L2:
;	cmp sum,1000
;	jb next2
;	dec sum
;	inc count
;	jmp L2
;next2:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Q3
;	mov sum,0
;	mov count,1
;L3:
;	cmp sum,1000
;	jae next3
;	cmp count,24
;	ja next3
;	mov eax,count
;	add sum,eax
;	inc count
;	jmp L3
;next3:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Q4
;	mov sum,0
;	mov count,100
;L4:
;	cmp sum,1000
;	jae L4_1
;L4_re:
;	mov eax,count
;	add sum,eax
;	dec count
;	jmp L4
;L4_1:
;	cmp count,0
;	jge L4_re
;next4:
;	mov eax,sum
;	call WriteDec

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Q5
;	mov ebx,1	;	nextDaywage = 1
;	mov eax,0	;	total = 0
;	mov ecx,0	;	day = 0
;L5:
;	inc ecx
;	add eax,ebx
;	add ebx,ebx
;	cmp eax,1000000
;	ja next5
;	jmp L5
;next5:
;	call WriteDec

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Q6
;	mov ecx,array_length
;	mov esi,0
;	mov eax,0
;L6:
;	add eax,array[esi*4]
;	cmp eax,60
;	jae next6
;	cmp esi,ecx
;	jae next6
;	inc esi
;	jmp L6
;next6:
;	sub eax,array[esi*4]
;	call WriteDec

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Q7
;	mov ecx,array_length
;	mov esi,0
;	mov eax,0
;L7:
;	add eax,array[esi*4]
;	cmp eax,60
;	jae L7_1
;re:	cmp esi,ecx
;	jae next7
;	inc esi
;	jmp L7
;L7_1:
;	cmp eax,100
;	jbe re
;next7:
;	sub eax,array[esi*4]
;	call WriteDec

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Q8
	mov ecx,array_length
	mov esi,0
	mov eax,0
L8:
	cmp array[esi*4],0
	jl L8_1
re8:
	inc esi
	cmp esi,ecx
	jae next8
	jmp L8

L8_1:
	inc eax
	jmp re8
next8:
	call WriteDec
exit
main ENDP
END main
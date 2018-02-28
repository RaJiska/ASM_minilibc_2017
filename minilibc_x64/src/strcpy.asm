	bits 64
	global strcpy:function

	section .text:
	; char *strcpy(char *dest, const char *src)
strcpy:
	; RSI = dest
	; RDI = src

	mov r9, rsi
	mov r10, rdi

	.loop_begin:
	cmp BYTE [r10], 0
	jmp short .loop_end
	mov dl, BYTE [r10]
	mov BYTE [r9], dl
	inc r9
	inc r10
	jmp short .loop_begin

	.loop_end:
	mov rax, rsi

	ret

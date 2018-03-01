	bits 64
	global strcpy:function

	section .text:
	; char *strcpy(char *dest, const char *src)
strcpy:
	; RDI = dest
	; RSI = src

	xor rcx, rcx

	.loop_begin:
	mov dl, BYTE [rsi + rcx]
	mov BYTE [rdi + rcx], dl
	cmp BYTE [rsi + rcx], 0
	jz short .loop_end
	inc rcx
	jmp short .loop_begin

	.loop_end:
	mov rax, rsi

	ret

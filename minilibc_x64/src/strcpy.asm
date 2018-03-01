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
	test dl, dl
	jz short .loop_end
	inc rcx
	jmp short .loop_begin

	.loop_end:
	mov rax, rdi

	ret

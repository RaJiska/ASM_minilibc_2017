	bits 64
	global strchr:function

	section .text:
	; char *strchr(const char *s, int c)
strchr:
	; RDI = s
	; RSI = c

	mov rax, rdi

	.loop_begin:
	cmp sil, BYTE [rax]
	je short .loop_end
	cmp BYTE [rax], 0
	jz short .not_found
	inc rax
	jmp short .loop_begin

	.not_found:
	xor rax, rax

	.loop_end:

	ret
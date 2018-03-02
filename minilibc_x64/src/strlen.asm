	bits 64
	global strlen:function

	section .text:
	; size_t strlen(const char *s)
strlen:
	; RDI = s

	xor rax, rax

	.loop_begin:
	mov dl, BYTE [rdi + rax]
	test dl, dl
	jz short .loop_end
	inc rax
	jmp short .loop_begin

	.loop_end:

	ret

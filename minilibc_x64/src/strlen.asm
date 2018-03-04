	bits 64
	global strlen:function

	section .text:
	; size_t strlen(const char *s)
strlen:
	; RDI = s

	xor rax, rax

	.loop_begin:
	cmp BYTE [rdi + rax], 0
	je short .loop_end
	inc rax
	jmp short .loop_begin

	.loop_end:

	ret

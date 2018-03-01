	bits 64
	global strlen:function

	section .text:
	; size_t strlen(const char *s)
strlen:
	; RDI = s

	mov rax, rdi

	.loop_begin:
	mov dl, BYTE [rax]
	cmp dl, 0x0
	je short .loop_end
	inc rax
	jmp short .loop_begin

	.loop_end:
	sub rax, rdi

	ret
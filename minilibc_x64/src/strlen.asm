	bits 64
	global strlen:function

	section .text:
strlen:
	push rbp
	mov rbp, rsp

	mov rax, rdi

	.loop_begin:
	mov dl, BYTE [rax]
	cmp dl, 0x0
	je short .loop_end
	inc rax
	jmp short .loop_begin

	.loop_end:
	sub rax, rdi

	pop rbp
	ret

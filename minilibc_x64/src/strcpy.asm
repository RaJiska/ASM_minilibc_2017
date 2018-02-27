	bits 64
	global strcpy:function

	section .text:
strcpy:
	push rbp
	mov rbp, rsp

	mov rdx, rsi

	.loop_begin:
	movzx rax, BYTE [rsi]
	mov BYTE [rdi], al
	test al, al
	je short .loop_end
	inc rdi
	inc rsi
	jmp short .loop_begin

	.loop_end:
	mov rax, rdx

	pop rbp
	ret

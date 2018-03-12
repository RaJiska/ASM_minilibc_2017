	bits 64
	global memmove:function

	section .text:
	; void *memmove(void *dest, const void *src, size_t n)
memmove:
	; RDI = dest
	; RSI = src
	; RDX = n

	push rbp
	mov rbp, rsp

	xor rcx, rcx
	test rdx, rdx	; n == 0
	jz short .copy_end
	cmp rdi, rsi	; dest == src
	je short .copy_end
	jae short .right_copy

	.left_copy:

	.lc_begin_loop:
	cmp rcx, rdx
	jae short .copy_end
	mov al, BYTE [rsi + rcx]
	mov BYTE [rdi + rcx], al
	inc rcx
	jmp short .lc_begin_loop

	.right_copy:
	mov rcx, rdx
	dec rcx

	.rc_begin_loop:
	mov al, BYTE [rsi + rcx]
	mov BYTE [rdi + rcx], al
	test rcx, rcx
	jz short .copy_end
	dec rcx
	jmp short .rc_begin_loop

	.copy_end:
	mov rax, rdi

	pop rbp
	ret
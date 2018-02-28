	bits 64
	global memcpy:function

	section .text:
	; void *memcpy(void *dest, const void *src, size_t n)
memcpy:
	; RDI = dest
	; RSI = src
	; RDX = n

	xor rcx, rcx

	.loop_begin:
	cmp rcx, rdx
	je short .loop_end
	mov r9b, BYTE [rsi + rcx]
	mov BYTE [rdi + rcx], r9b
	inc rcx
	jmp short .loop_begin

	.loop_end:
	mov rax, rdi

	ret

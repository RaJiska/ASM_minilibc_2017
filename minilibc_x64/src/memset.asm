	bits 64
	global memset:function

	section .text:
	; void *memset(void *s, int c, size_t n)
memset:
	; RDI = s
	; RSI = c
	; RDX = n

	xor rcx, rcx

	.loop_begin:
	cmp rcx, rdx
	jge short .loop_end
	mov BYTE [rdi + rcx], sil
	inc rcx
	jmp short .loop_begin

	.loop_end:
	mov rax, rdi

	ret

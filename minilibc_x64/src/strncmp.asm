	bits 64
	global strncmp:function

	section .text
	; int strncmp(const char *s1, const char *s2, size_t n)
strncmp:
	; RDI = s1
	; RSI = s2
	; RDX = n

	test rdx, rdx
	jz short .return_0

	xor rcx, rcx

	.loop_begin:
	cmp rcx, rdx
	jae short .return_0
	mov al, BYTE [rdi + rcx]
	cmp al, BYTE [rsi + rcx]
	jne short .loop_end
	test al, al
	jz short .return_0
	inc rcx
	jmp short .loop_begin

	.loop_end:
	movzx eax, al
	movzx r8d, BYTE [rsi + rcx]
	sub eax, r8d
	jmp short .return

	.return_0:
	xor eax, eax

	.return:

	ret

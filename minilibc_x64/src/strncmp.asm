	bits 64
	global strcmp:function

	section .text
	; int strncmp(const char *s1, const char *s2, size_t n)
strcmp:
	; RDI = s1
	; RSI = s2
	; RDX = n

	xor rax, rax
	xor rcx, rcx
	mov [rsp - 0x8], rdi
	mov [rsp - 0x10], rsi

	.loop_begin:
	cmp rcx, rdx
	je short .return_0
	mov al, BYTE [rdi + rcx]
	mov dl, BYTE [rsi + rcx]
	cmp al, dl
	jne short .loop_end

	test al, al
	jz short .return_0

	inc rcx
	jmp short .loop_begin

	.loop_end:
	movzx eax, al
	movzx edx, dl
	sub eax, edx
	jmp short .return

	.return_0:
	xor eax, eax

	.return:

	ret

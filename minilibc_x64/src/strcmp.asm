	bits 64
	global strcmp:function

	section .text
	; int strcmp(const char *s1, const char *s2)
strcmp:
	; RDI = s1
	; RSI = s2

	xor rcx, rcx

	.loop_begin:
	mov al, BYTE [rdi + rcx]
	cmp al, BYTE [rsi + rcx]
	jne short .loop_end
	test al, al
	jz short .return_0
	inc rcx
	jmp short .loop_begin

	.loop_end:
	movsx eax, al
	movsx edx, BYTE [rsi + rcx]
	sub eax, edx
	jmp short .return

	.return_0:
	xor eax, eax

	.return:

	ret

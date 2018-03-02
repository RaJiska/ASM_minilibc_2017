	bits 64
	global rindex:function

	section .text:
	; char *rindex(const char *s, int c)
rindex:
	; RDI = s
	; RSI = c

	xor rcx, rcx
	xor rax, rax

	.loop_begin:
	cmp sil, BYTE [rdi + rcx]
	jne short .not_matching
	mov rax, rdi
	add rax, rcx

	.not_matching:
	cmp BYTE [rdi + rcx], 0
	je short .return
	inc rcx
	jmp short .loop_begin

	.return:

	ret
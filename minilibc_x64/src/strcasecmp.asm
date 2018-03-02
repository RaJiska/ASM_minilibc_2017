	bits 64
	global strcasecmp:function

	section .text
	; char to_lower(char val)
to_lower:
	cmp dil, 65
	jl short .return_initial
	cmp dil, 90
	jg short .return_initial
	mov al, dil
	add al, 32
	jmp short .return

	.return_initial:
	mov al, dil

	.return:

	ret

	; int strcasecmp(const char *s1, const char *s2)
strcasecmp:
	; RDI = s1
	; RSI = s2

	push rbp
	mov rbp, rsp

	xor rcx, rcx

	.loop_begin:
	mov r8b, BYTE [rdi + rcx]
	mov r9b, BYTE [rsi + rcx]

	mov [rbp - 0x10], rdi	; Push RDI on the stack
	mov dil, r8b
	call to_lower
	mov r8b, al

	mov dil, r9b
	call to_lower
	mov r9b, al
	mov rdi, [rbp - 0x10]	; Resotre RDI

	cmp r8b, r9b
	jne short .loop_end
	test r8b, r8b
	jz short .return_0
	inc rcx
	jmp short .loop_begin

	.loop_end:
	movzx eax, r8b
	movzx edx, r9b
	sub eax, edx
	jmp short .return

	.return_0:
	xor eax, eax

	.return:

	pop rbp
	ret

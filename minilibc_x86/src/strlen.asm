	bits 32
	global strlen:function

	section .text:
	; size_t strlen(const char *s)
strlen:
	; EBP + 0x8 = s

	push ebp
	mov ebp, esp

	mov eax, DWORD [ebp + 0x8]

	.loop_begin:
	cmp BYTE [eax], 0x0
	je short .loop_end
	inc eax
	jmp short .loop_begin

	.loop_end:
	sub eax, DWORD [ebp + 0x8]

	pop ebp
	ret

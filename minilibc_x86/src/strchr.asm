	bits 32
	global strchr:function

	section .text:
	; char *strchr(const char *s, int c)
strchr:
	; EBP + 0x8 = s
	; EBP + 0xC = c

	push ebp
	mov ebp, esp

	mov eax, DWORD [ebp + 0x8]
	mov dl, BYTE [ebp + 0xC]

	.loop_begin:
	cmp dl, BYTE [eax]
	je short .loop_end
	cmp BYTE [eax], 0
	je short .not_found
	inc eax
	jmp short .loop_begin

	.not_found:
	xor eax, eax

	.loop_end:

	pop ebp
	ret
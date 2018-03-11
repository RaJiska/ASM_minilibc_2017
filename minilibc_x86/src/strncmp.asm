	bits 32
	global strncmp:function

	section .text
	; int strncmp(const char *s1, const char *s2, size_t n)
strncmp:
	; EBP + 0x8 = s1
	; EBP + 0xC = s2
	; EBP + 0x10 = y

	push ebp
	mov ebp, esp

	cmp DWORD [ebp + 0x10], 0
	jz short .return_0

	xor ecx, ecx

	.loop_begin:
	cmp ecx, [ebp + 0x10]
	jge short .return_0
	mov edx, [ebp + 0x8]
	mov al, BYTE [edx + ecx]
	mov edx, [ebp + 0xC]
	cmp al, BYTE [edx + ecx]
	jne short .loop_end
	test al, al
	jz short .return_0
	inc ecx
	jmp short .loop_begin

	.loop_end:
	movzx eax, al
	movzx edx, BYTE [edx + ecx]
	sub eax, edx
	jmp short .return

	.return_0:
	xor eax, eax

	.return:

	pop ebp
	ret
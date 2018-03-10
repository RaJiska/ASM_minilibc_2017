	bits 32
	global strcmp:function

	section .text
	; int strcmp(const char *s1, const char *s2)
strcmp:
	; EBP + 0x8 = s1
	; EBP + 0xC = s2

	push ebp
	mov ebp, esp

	xor ecx, ecx

	.loop_begin:
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
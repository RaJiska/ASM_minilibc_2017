	bits 32
	global strcpy:function

	section .text:
strcpy:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 0x8]
	mov edx, [ebp + 0xC]

	.loop_begin:
	movzx ecx, BYTE [edx]
	mov BYTE [eax], cl
	test cl, cl
	je short .loop_end
	inc eax
	inc edx
	jmp short .loop_begin

	.loop_end:
	mov BYTE [eax], 0x0
	mov eax, [ebp + 0x8]

	pop ebp
	ret

	bits 32
	global strlen:function

	section .text:
strlen:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 0x4]

	.loop_begin:
	cmp BYTE [eax], 0x0
	je short .loop_end
	inc eax
	jmp short .loop_begin

	.loop_end:
	sub eax, [esp + 0x4]

	pop ebp
	ret

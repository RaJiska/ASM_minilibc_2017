	bits 32
	global strlen:function

	section .text:
strlen:
	push ebp
	mov ebp, esp

	mov edi, [esp + 0x8]
	mov eax, edi

	.loop_begin:
	mov dl, BYTE [eax]
	cmp dl, 0x0
	je short .loop_end
	inc eax
	jmp short .loop_begin

	.loop_end:
	sub eax, edi

	pop ebp
	ret

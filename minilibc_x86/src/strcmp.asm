	bits 32
	global strcmp:function

	section .text
strcmp:
	push ebp
	mov ebp, esp

	mov edi, [ebp + 0x8]
	mov esi, [ebp + 0xc]

	.loop_begin:
	mov al, BYTE [edi]
	mov dl, BYTE [esi]
	cmp al, 0x0
	je short .loop_end
	cmp dl, 0x0
	je short .ret_1
	cmp dl, al
	jg short .ret_neg_1
	cmp al, dl
	jg short .ret_1
	inc edi
	inc esi
	jmp short .loop_begin

	.loop_end:
	cmp dl, 0x0
	jne short .ret_neg_1
	xor eax, eax
	jmp short .return

	.ret_1:
	mov eax, 0x1
	jmp short .return

	.ret_neg_1:
	mov eax, -0x1

	.return:

	pop ebp
	ret

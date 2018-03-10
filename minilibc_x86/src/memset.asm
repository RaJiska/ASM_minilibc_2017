	bits 32
	global memset:function

	section .text:
	; void *memset(void *s, int c, size_t n)
memset:
	; EBP + 0x8 = s
	; EBP + 0xC = c
	; EBP + 0x14 = n

	push ebp
	mov ebp, esp

	xor ecx, ecx

	.loop_begin:
	cmp ecx, [ebp + 0x14]
	jge short .loop_end
	mov al, BYTE [ebp + 0xC]
	mov edx, [ebp + 0x8]
	mov BYTE [edx + ecx], al
	inc ecx
	jmp short .loop_begin

	.loop_end:
	mov eax, [ebp + 0x8]

	pop ebp
	ret

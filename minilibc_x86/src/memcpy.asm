	bits 32
	global memcpy:function

	section .text:
	; void *memcpy(void *dest, const void *src, size_t n)
memcpy:
	; EBP + 0x8 = dest
	; EBP + 0xC = src
	; EBP + 0x14 = n

	push ebp
	mov ebp, esp

	xor ecx, ecx

	.loop_begin:
	cmp ecx, [ebp + 0x14]
	je short .loop_end
	mov edx, [ebp + 0xC]
	mov al, BYTE [edx + ecx]
	mov edx, [ebp + 0x8]
	mov BYTE [edx + ecx], al
	inc ecx
	jmp short .loop_begin

	.loop_end:
	mov eax, [ebp + 0x8]

	pop ebp
	ret
	bits 32
	global memmove:function

	section .text:
	; void *memmove(void *dest, const void *src, size_t n)
memmove:
	; EBP + 0x8 = dest
	; EBP + 0xC = src
	; EBP + 0x10 = n

	push ebp
	mov ebp, esp

	xor ecx, ecx
	mov edx, DWORD [ebp + 0x10]
	test edx, edx	; n == 0
	jz short .copy_end
	mov edx, DWORD [ebp + 0x8]
	cmp edx, DWORD [ebp + 0xC]	; dest == src
	je short .copy_end
	jae short .right_copy

	.left_copy:


	.lc_begin_loop:
	cmp ecx, DWORD [ebp + 0x10]
	jae short .copy_end
	mov edx, DWORD [ebp + 0xC]
	mov al, BYTE [edx + ecx]
	mov edx, DWORD [ebp + 0x8]
	mov BYTE [edx + ecx], al
	inc ecx
	jmp short .lc_begin_loop

	.right_copy:
	mov ecx, DWORD [ebp + 0x10]
	dec ecx

	.rc_begin_loop:
	mov edx, DWORD [ebp + 0xC]
	mov al, BYTE [edx + ecx]
	mov edx, DWORD [ebp + 0x8]
	mov BYTE [edx + ecx], al
	test ecx, ecx
	jz short .copy_end
	dec ecx
	jmp short .rc_begin_loop

	.copy_end:
	mov eax, DWORD [ebp + 0x8]

	pop ebp
	ret
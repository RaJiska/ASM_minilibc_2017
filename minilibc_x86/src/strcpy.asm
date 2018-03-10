	bits 32
	global strcpy:function

	section .text:
	; char *strcpy(char *dest, const char *src)
strcpy:
	; EBP + 0x8 = dest
	; EBP + 0xC = src

	push ebp
	mov ebp, esp

	xor ecx, ecx

	.loop_begin:
	mov edx, [ebp + 0xC]
	mov al, BYTE [edx + ecx]
	mov edx, [ebp + 0x8]
	mov BYTE [edx + ecx], al
	test al, al
	jz short .loop_end
	inc ecx
	jmp short .loop_begin

	.loop_end:
	mov eax, [ebp + 0x8]

	pop ebp
	ret

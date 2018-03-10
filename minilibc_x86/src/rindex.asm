	bits 32
	global rindex:function

	section .text:
	; char *rindex(const char *s, int c)
rindex:
	; EBP + 0x8 = s
	; EBP + 0xC = c

	push ebp
	mov ebp, esp

	xor ecx, ecx
	xor eax, eax

	.loop_begin:
	mov edx, [ebp + 0x8]
	mov dl, BYTE [edx + ecx]
	cmp dl, BYTE [ebp + 0xC]
	jne short .not_matching
	mov eax, [ebp + 0x8]
	add eax, ecx

	.not_matching:
	mov edx, [ebp + 0x8]
	cmp BYTE [edx, ecx], 0
	je short .return
	inc ecx
	jmp short .loop_begin

	.return:

	pop ebp
	ret
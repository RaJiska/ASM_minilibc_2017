	bits 32
	global strcasecmp:function

	section .text
	; char to_lower(char val)
to_lower:
	; EBP + 0x8 = val

	push ebp
	mov ebp, esp

	mov al, BYTE [ebp + 0x8]
	cmp al, 65
	jl short .return_initial
	cmp al, 90
	jg short .return_initial
	add al, 32
	jmp short .return

	.return_initial:
	mov al, BYTE [ebp + 0x8]

	.return:

	pop ebp
	ret

	; int strcasecmp(const char *s1, const char *s2)
strcasecmp:
	; EBP + 0x8 = s1
	; EBP + 0xC = s2

	push ebp
	mov ebp, esp

	xor ecx, ecx

	.loop_begin:
	mov edx, DWORD [ebp + 0xC]
	mov dl, BYTE [edx + ecx]
	push edx
	call to_lower
	add esp, 0x4
	push eax	; Save our result for later user

	mov edx, DWORD [ebp + 0x8]
	mov dl, BYTE [edx + ecx]
	push edx
	call to_lower
	add esp, 0x4

	cmp al, BYTE [esp]
	jne short .loop_end
	add esp, 0x4	; Discard saved result
	test al, al
	jz short .return_0
	inc ecx
	jmp short .loop_begin

	.loop_end:
	movzx eax, al
	pop edx
	movzx edx, dl
	sub eax, edx
	jmp short .return

	.return_0:
	xor eax, eax

	.return:

	pop ebp
	ret
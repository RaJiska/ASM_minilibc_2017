	bits 32
	global strpbrk:function

	section .text:
	; char is_char_in_list(char c, const char *list)
is_char_in_list:
	; EBP + 0x8 = c
	; EBP + 0xC = list

	push ebp
	mov ebp, esp

	xor ecx, ecx
	mov edx, DWORD [ebp + 0xC]

	.loop_begin:
	cmp BYTE [edx + ecx], 0
	je short .loop_not_found
	mov al, BYTE [ebp + 0x8]
	cmp al, BYTE [edx + ecx]
	je short .loop_found
	inc ecx
	jmp short .loop_begin

	.loop_found:
	mov al, 1
	jmp short .loop_end

	.loop_not_found:
	mov al, 0

	.loop_end:

	pop ebp
	ret

	; char *strpbrk(const char *s, const char *accept)
strpbrk:
	; EBP + 0x8 = s
	; EBP + 0xC = accept

	push ebp
	mov ebp, esp

	mov edx, DWORD [ebp + 0x8]

	.loop_begin:
	cmp BYTE [edx], 0
	je short .return_0

	push edx
	mov eax, DWORD [ebp + 0xC]
	push eax
	mov dl, BYTE [edx]
	push edx
	call is_char_in_list
	add esp, 0x8
	pop edx

	cmp al, 0x1
	je short .return_addr
	inc edx
	jmp short .loop_begin

	.return_0:
	xor eax, eax
	jmp short .return

	.return_addr:
	mov eax, edx

	.return:

	pop ebp
	ret
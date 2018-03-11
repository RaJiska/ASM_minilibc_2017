	bits 32
	global strcspn:function

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

	; size_t strcspn(const char *s, const char *reject)
strcspn:
	; EBP + 0x8 = s
	; EBP + 0xC = reject

	push ebp
	mov ebp, esp

	sub esp, 0x4	; 1 long ; Rejected counter

	xor ecx, ecx	; Set main counter
	mov DWORD [ebp - 0x4], ecx	; Save rejected counter
	mov edx, DWORD [ebp + 0x8]

	.loop_begin:
	cmp BYTE [edx + ecx], 0
	je short .loop_end

	push ecx
	push edx

	mov eax, DWORD [ebp + 0xC]
	push eax
	mov eax, DWORD [edx + ecx]
	push eax
	call is_char_in_list
	add esp, 0x8

	pop edx
	pop ecx

	test al, al
	jnz short .loop_end
	inc ecx

	.loop_rejected:
	inc DWORD [ebp - 0x4]
	jmp short .loop_begin

	.loop_end:
	mov eax, DWORD [ebp - 0x4]

	add esp, 0x4

	pop ebp
	ret
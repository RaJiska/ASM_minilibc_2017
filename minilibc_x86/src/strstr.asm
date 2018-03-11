	bits 32
	global strstr:function
	extern strlen
	extern strncmp

	section .text:
	; char *strstr(const char *haystack, const char *needle)
strstr:
	; EBP + 0x8 = haystack
	; EBP + 0xC = needle

	push ebp
	mov ebp, esp

	sub esp, 0x8	; 2 longs

	mov edx, DWORD [ebp + 0x8]
	push edx
	call strlen WRT ..plt
	add esp, 0x4
	mov DWORD [ebp - 0x4], eax	; Haystack len

	mov edx, DWORD [ebp + 0xC]
	push edx
	call strlen WRT ..plt
	add esp, 0x4
	mov DWORD [ebp - 0x8], eax	; Needle len

	xor ecx, ecx
	test eax, eax
	jz short .found

	.loop_begin:
	mov edx, DWORD [ebp - 0x4]
	sub edx, ecx
	cmp edx, DWORD [ebp - 0x8]
	jl short .not_found

	push ecx
	mov edx, DWORD [ebp - 0x8]
	push edx
	mov edx, DWORD [ebp + 0xC]
	push edx
	mov edx, DWORD [ebp + 0x8]
	add edx, ecx
	push edx

	call strncmp WRT ..plt
	add esp, 0xC
	pop ecx

	test eax, eax
	jz short .found
	inc ecx
	jmp short .loop_begin

	.not_found:
	xor eax, eax
	jmp short .return

	.found:
	mov eax, DWORD [ebp + 0x8]
	add eax, ecx

	.return:

	add esp, 0x8

	pop ebp
	ret
	bits 64
	global strcspn:function

	section .text:
	; char is_char_in_list(char c, const char *list)
is_char_in_list:
	; DIL = c
	; RSI = list

	xor al, al
	xor rcx, rcx

	.loop_begin:
	cmp BYTE [rsi + rcx], 0
	je short .loop_end
	cmp dil, BYTE [rsi + rcx]
	je short .loop_found
	inc rcx
	jmp short .loop_begin

	.loop_found:
	mov al, 1

	.loop_end:

	ret

	; size_t strcspn(const char *s, const char *reject)
strcspn:
	; RDI = s
	; RSI = reject

	xor r8, r8	; To store return val
	xor rcx, rcx

	.loop_begin:
	cmp BYTE [rdi + rcx], 0
	je short .loop_end

	push rdi
	push rcx
	mov dil, BYTE [rdi + rcx]
	call is_char_in_list	; RSI already set
	pop rcx
	pop rdi

	test al, al
	jnz short .loop_end
	inc r8

	.loop_rejected:
	inc rcx
	jmp short .loop_begin

	.loop_end:
	mov rax, r8

	ret

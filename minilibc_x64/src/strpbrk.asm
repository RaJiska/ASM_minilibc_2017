	bits 64
	global strpbrk:function

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

	; char *strpbrk(const char *s, const char *accept)
strpbrk:
	; RDI = s
	; RSI = accept

	.loop_begin:
	cmp BYTE [rdi], 0
	je short .return_0
	push rdi
	mov rdi, [rsp]
	mov dil, BYTE [rdi]
	call is_char_in_list
	pop rdi
	cmp al, 1
	je short .return_addr
	inc rdi
	jmp short .loop_begin

	.return_0:
	xor rax, rax
	jmp short .return

	.return_addr:
	mov rax, rdi

	.return:

	ret

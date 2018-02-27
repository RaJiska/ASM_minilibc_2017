	bits 64
	global strcmp:function

	section .text
strcmp:
	xor rax, rax
	mov [rsp - 0x8], rdi
	mov [rsp - 0x10], rsi

	.loop_begin:
	mov al, BYTE [rdi]
	mov dl, BYTE [rsi]
	cmp al, dl
	jne short .loop_end

	test al, al
	jz short .return_0

	inc rdi
	inc rsi
	jmp short .loop_begin

	.loop_end:
	movzx eax, al
	movzx edx, dl
	sub eax, edx
	jmp short .return

	.return_0:
	xor eax, eax

	.return:
	mov rdi, [rsp - 0x8]
	mov rsi, [rsp - 0x10]

	ret

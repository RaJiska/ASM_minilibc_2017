	bits 64
	global strstr:function
	extern strlen
	extern strcmp

	section .text:
	; char *strstr(const char *haystack, const char *needle)
strstr:
	; RDI = haystack
	; RSI = needle

	push rbp
	mov rbp, rsp

	sub rsp, 0x28	; 5 long vars
	mov [rbp - 0x8], rdi
	mov [rbp - 0x10], rsi

	call strlen WRT ..plt
	mov [rbp - 0x18], rax	; RDI len
	mov rdi, [rbp - 0x10]
	call strlen WRT ..plt
	mov [rbp - 0x20], rax	; RSI len

	xor rcx, rcx
	mov [rbp - 0x28], rcx	; Count
	test rax, rax
	jz short .found

	.loop_begin:
	mov rax, [rbp - 0x18]
	sub rax, rcx
	cmp rax, [rbp - 0x20]
	jl short .not_found

	mov [rbp - 0x28], rcx
	mov rdi, [rbp - 0x8]
	mov rsi, [rbp - 0x10]
	add rdi, rcx
	call strcmp WRT ..plt

	test eax, eax
	jz short .found
	mov rcx, [rbp - 0x28]
	inc rcx
	jmp short .loop_begin

	.not_found:
	xor rax, rax
	jmp short .return

	.found:
	mov rax, [rbp - 0x8]
	add rax, [rbp - 0x28]

	.return:

	add rsp, 0x28

	pop rbp
	ret
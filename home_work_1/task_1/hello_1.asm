global _start

section .data
	message db "Hello world!", 10
	length equ $ - message

section .text

_start:
	mov rax, 1		;системный вызов write
	mov rdi, 1		
	mov rsi, message;адрес строки для вывода
	mov rdx, length	;количество байт
	syscall

	cmp rax, 0
	jl error

	mov rax, 60		;системный вызов exit
	mov rdi, 0
	syscall

error:
	mov rax, 60		;системный вызов exit с ошибкой
	mov rdi, 1
	syscall

global _start

section .data

	filename db "output.txt", 0
	message db "Hello, World!", 10
	length equ $ -message

section .bss
	fd resq 1		;переменная для дескриптора

section .text
_start:
mov rax, 2			;Открытие файла для записи
mov rdi, filename	;имя файла
mov rsi, 0x241		; флаги на запись, создание и перезапись
mov rdx, 0644o		;чтение, запись
syscall
mov [fd], rax		;запись строки в файл
mov rax, 1
mov rdi, [fd]
mov rsi, message
mov rdx, length
syscall				;закрытие файла
mov rax, 3
mov rdi, [fd]
syscall				;выход
mov rax, 60
xor rdi, rdi
syscall

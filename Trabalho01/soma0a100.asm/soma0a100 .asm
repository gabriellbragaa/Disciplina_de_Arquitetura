global _start
extern printf

section .data
    msg db "O valor da soma de 1 a 100: %d", 10, 0
    result dq 0

section .text
_start:
    xor rax, rax            ; Zerar rax
    mov rcx, 1              ; Inicializar rcx com 1

calc_sum:
    add rax, rcx            ; Adiciona rcx a rax
    inc rcx                 ; Incrementa rcx
    cmp rcx, 101            ; Compara rcx com 101
    jb calc_sum             ; Se rcx < 101, continua o laço

    ; Armazenar o resultado na variável result
    mov [result], rax       ; Move o resultado da soma em result

    ; Preparar os argumentos para printf
    mov rdi, msg            ; Passa o endereço da mensagem para rdi
    mov rsi, [result]       ; Passa o resultado para rsi
global _start
extern printf

section .data
    msg db "O valor da soma de 1 a 100: %d", 10, 0
    result dq 0

section .text
_start:
    xor rax, rax            ; Zerar rax
    mov rcx, 1              ; Inicializar rcx com 1

calc_sum:
    add rax, rcx            ; Adiciona rcx a rax
    inc rcx                 ; Incrementa rcx
    cmp rcx, 101            ; Compara rcx com 101
    jb calc_sum             ; Se rcx < 101, continua o laço

    ; Armazenar o resultado na variável result
    mov [result], rax       ; Move o resultado da soma em result

    ; Preparar os argumentos para printf
    mov rdi, msg            ; Passa o endereço da mensagem para rdi
    mov rsi, [result]       ; Passa o resultado para rsi

    ; Chamar printf
    call printf

    ; Encerrar o programa
    mov rax, 60             ; Código da chamada de sistema para sys_exit
    xor rdi, rdi            ; Código de saída 0
    syscall                 ; Chama o kernel para encerrar

    ; Chamar printf
    call printf

    ; Encerrar o programa
    mov rax, 60             ; Código da chamada de sistema para sys_exit
    xor rdi, rdi            ; Código de saída 0
    syscall                 ; Chama o kernel para encerrar

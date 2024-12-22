section .data
    dig db 'Digite um número inteiro positivo: ', 0
    num db '%u', 0
    imp_soma db 'A soma dos inteiros de 1 até %u é %u.', 0aH, 0 
    imp_int db 'O número deve ser um inteiro positivo.', 0

section .bss
    n resd 1  ; Reserva espaço para armazenar o número
    soma resd 1 ; Reserva espaço para armazenar a soma

section .text
extern printf, scanf

global main


funcao_soma:
    push    ebp
    mov     ebp, esp
    mov     eax, [ebp+8]   ; EAX = N
    add     eax, 1         ; EAX = N + 1
    imul    eax, [ebp+8]   ; EAX = N * (N + 1)
    shr     eax, 1         ; EAX = (N * (N + 1)) / 2
    pop     ebp
    ret

main:
    push    ebp
    mov     ebp, esp
    sub     esp, 8

    ; Exibe a mensagem para o usuário
    push    dig
    call    printf
    add     esp, 4

    ; Lê o número do usuário
    lea     eax, [n]       ; Endereço da variável onde o número será armazenado
    push    eax
    push    num
    call    scanf
    add     esp, 8

    ; Verifica se o número é positivo
    mov     eax, [n]
    cmp     eax, 0
    jbe     a

    ; Calcula a soma
    push    eax
    call    funcao_soma
    add     esp, 4

    ; Armazena a soma
    mov     [soma], eax

    ; Exibe o resultado
    mov     eax, [n]
    push    eax
    mov     eax, [soma]
    push    eax
    push    imp_soma
    call    printf
    add     esp, 12

    jmp     b

a:
    ; Exibe mensagem de erro
    push    imp_int
    call    printf
    add     esp, 4

b:
    ; Finaliza a função main
    mov     esp, ebp
    pop     ebp
    ret

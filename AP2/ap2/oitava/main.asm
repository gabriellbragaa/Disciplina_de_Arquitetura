section .data
    prompt db 'Digite o ano atual e o ano de nascimento: ', 0
    fmt db '%u', 0
    imp_anos db 'Idade em anos: %d', 0xa, 0
    imp_meses db 'Idade em meses: %d', 0xa, 0
    imp_dias db 'Idade em dias: %d', 0xa, 0

section .bss
    ano_atual resd 1
    ano_nascimento resd 1

section .text
    extern printf, scanf
    global main

main:
    push    ebp
    mov     ebp, esp
    sub     esp, 12                 ; Espaço para variáveis temporárias

    ; Solicita ao usuário que insira o ano atual e o ano de nascimento
    push    prompt
    call    printf
    add     esp, 4

    ; Lê o ano atual
    lea     eax, [ano_atual]
    push    eax
    push    fmt
    call    scanf
    add     esp, 8

    ; Lê o ano de nascimento
    lea     eax, [ano_nascimento]
    push    eax
    push    fmt
    call    scanf
    add     esp, 8

    ; Calcula a idade
    mov     eax, [ano_atual]
    sub     eax, [ano_nascimento]  ; EAX = anos de idade
    mov     [ebp-4], eax           ; Armazena idade em anos

    ; Calcula a idade em meses
    mov     ecx, [ano_atual]
    sub     ecx, [ano_nascimento]  ; ECX = anos de idade
    imul    ecx, 12                ; ECX = idade em meses
    mov     [ebp-8], ecx           ; Armazena idade em meses

    ; Calcula a idade em dias
    mov     edx, [ano_atual]
    sub     edx, [ano_nascimento]  ; EDX = anos de idade
    imul    edx, 365               ; EDX = idade em dias
    mov     [ebp-12], edx          ; Armazena idade em dias

    ; Exibe a idade em anos
    mov     eax, [ebp-4]
    push    eax
    push    imp_anos
    call    printf
    add     esp, 8

    ; Exibe a idade em meses
    mov     eax, [ebp-8]
    push    eax
    push    imp_meses
    call    printf
    add     esp, 8

    ; Exibe a idade em dias
    mov     eax, [ebp-12]
    push    eax
    push    imp_dias
    call    printf
    add     esp, 8

    ; Finaliza a função main
    mov     esp, ebp
    pop     ebp
    ret

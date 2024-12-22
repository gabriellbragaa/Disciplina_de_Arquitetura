section .data
    msg_media db "Digite a media do final aluno: ", 0xA, 0
    msg_invalido db "Voce digitou numero invalido ", 0xA, 0
    msg_aprovado db "APROVADO !", 0xA, 0
    msg_reprovado db "REPROVADO !", 0xA, 0
    msg_fim db "Fim do programa!", 0xA, 0

section .bss
    media resd 1

section .text
    global _start

_start:
    ; Loop principal
    loop:
        ; Imprime a mensagem para digitar a média
        mov eax, 4
        mov ebx, 1
        mov ecx, msg_media
        mov edx, size msg_media
        int 0x80

        ; Lê a média do usuário
        mov eax, 3
        mov ebx, 0
        mov ecx, media
        mov edx, 4
        int 0x80

        ; Verifica se a média é inválida
        cmp dword [media], -1
        je fim
        cmp dword [media], 10
        jg invalido

        ; Verifica se o aluno foi aprovado ou reprovado
        cmp dword [media], 7
        jge aprovado
        jmp reprovado

    invalido:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg_invalido
        mov edx, size msg_invalido
        int 0x80
        jmp loop

    aprovado:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg_aprovado
        mov edx, size msg_aprovado
        int 0x80
        jmp loop

    reprovado:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg_reprovado
        mov edx, size msg_reprovado
        int 0x80
        jmp loop

    fim:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg_fim
        mov edx, size msg_fim
        int 0x80

        ; Encerrar o programa
        mov eax, 1
        xor ebx, ebx
        int 0x80

section .data
    msg_maior db 'Maior elemento: %d (Linha: %d, Coluna: %d)', 0xa, 0
    msg_menor db 'Menor elemento: %d (Linha: %d, Coluna: %d)', 0xa, 0
    matriz dd 1, 2, 3
           dd 4, 5, 6
           dd 7, 8, 9
           dd 10, 11, 12
           dd 13, 14, 15
           dd 16, 17, 18

section .bss
    maior_elemento resd 1
    menor_elemento resd 1
    pos_maior_linha resd 1
    pos_maior_col resd 1
    pos_menor_linha resd 1
    pos_menor_col resd 1

section .text
    extern printf
    global main

main:
    push    ebp
    mov     ebp, esp
    sub     esp, 12

    mov     eax, [matriz]
    mov     [maior_elemento], eax
    mov     [menor_elemento], eax
    mov     dword [pos_maior_linha], 0
    mov     dword [pos_maior_col], 0
    mov     dword [pos_menor_linha], 0
    mov     dword [pos_menor_col], 0

    xor     ecx, ecx            ; Linha = 0
    xor     edx, edx            ; Coluna = 0

iter_linhas:
    cmp     ecx, 6              ; Verifica se todas as linhas foram processadas
    jge     end_loop

    mov     ebx, ecx
    imul    ebx, 3              ; ebx = linha * número de colunas
    imul    ebx, 4              ; ebx = linha * número de colunas * tamanho do inteiro
    add     ebx, matriz         ; ebx = endereço do início da linha atual

    xor     edx, edx            ; Coluna = 0

iter_colunas:
    cmp     edx, 3              ; Verifica se todas as colunas foram processadas
    jge     next_line

    mov     eax, [ebx + edx * 4] ; Carrega o valor da matriz em eax
    mov     esi, [maior_elemento]
    cmp     eax, esi
    jle     check_menor

    mov     [maior_elemento], eax
    mov     dword [pos_maior_linha], ecx
    mov     dword [pos_maior_col], edx

check_menor:
    mov     esi, [menor_elemento]
    cmp     eax, esi
    jge     next_col

    mov     [menor_elemento], eax
    mov     dword [pos_menor_linha], ecx
    mov     dword [pos_menor_col], edx

next_col:
    inc     edx
    jmp     iter_colunas

next_line:
    inc     ecx
    jmp     iter_linhas

end_loop:
    mov     eax, [maior_elemento]
    mov     ebx, [pos_maior_linha]
    mov     ecx, [pos_maior_col]
    push    ecx
    push    ebx
    push    eax
    push    msg_maior
    call    printf
    add     esp, 16

    mov     eax, [menor_elemento]
    mov     ebx, [pos_menor_linha]
    mov     ecx, [pos_menor_col]
    push    ecx
    push    ebx
    push    eax
    push    msg_menor
    call    printf
    add     esp, 16

    mov     esp, ebp
    pop     ebp
    ret

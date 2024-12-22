global main
extern printf



section .data

    resultado db 'A soma de a + b eh: %d', 0HA, 0  ; Mensagem para printf com nova linha

section .bss
    soma resd 1  ; Reserva 4 bytes para armazenar o resultado da soma

section .text
    

funcao:
    ; Função que recebe um argumento e retorna a soma
    push    ebp
    mov     ebp, esp
    sub     esp, 8               ; Reserva espaço na pilha para variáveis locais

    ; int a = 5
    mov     DWORD [ebp - 4], 5

    ; int b = x
    mov     eax, DWORD [ebp + 8] ; pega o valor de x 
    mov     DWORD [ebp - 8], eax ; move o valor de x para b 

    ; return a + b
    mov     eax, DWORD [ebp - 4] ; carrega o valor de a
    add     eax, DWORD [ebp - 8] ; adiciona o valor de b

    ; Restaura a pilha e retorna
    mov     esp, ebp
    pop     ebp
    ret     4                    ; Retorna 4 bytes, que é o tamanho do argumento

main:
    ; Função principal
    push    ebp
    mov     ebp, esp
    sub     esp, 4               ; Reserva espaço na pilha para variáveis locais

    ; soma = funcao(2);
    push    2
    call    funcao
    add     esp, 4               ; retorna funcao(2)
    mov     [soma], eax          ; guarda eax em soma

    ; Chama o printf
    mov     eax, [soma]
    push    eax
    push    resultado            ; Passa o endereço diretamente para printf
    call    printf
    add     esp, 8               ; | eax | -4 |-8 | retorna o eax

    ; retorna da main     
    xor eax, 0
    mov esp, ebp
    pop ebp 
    ret 
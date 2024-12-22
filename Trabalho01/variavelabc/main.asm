; a = (2 ∗ b) + (c/2) + 200;

section .data
    b dw 10          ; Inicializando a variável b com o valor 10
    c dw 20          ; Inicializando a variável c com o valor 20
    a dw 0           ; Inicializando a variável a com 0 (para armazenar o resultado)
    duzentos dw 200   ; Constante 200
    men db ' Resultado: %d', 0 
    msg_len equ $ - men

section .bss 
    resultado resb 4    ; reservar o espaco de saida


section .text
    global _start

_start:
    ; Carregar o valor de b em um registrador
    mov eax, [b]      ; ax = b

    ; Calcular 2 * b usando SHL (shift left)
    shl eax, 1        ; ax = ax << 1 (ax = 2 * b) ; move 1 para mult por 2

    ; Armazenar 2 * b temporariamente em dx
    mov edx, eax       ; dx = 2 * b

    ; Carregar o valor de c em um registrador
    mov eax, [c]      ; ax = c

    ; Calcular c / 2 usando SHR (shift right)
    shr eax, 1        ; ax = ax >> 1 (ax = c / 2)

    ; Adicionar c / 2 ao resultado temporário (2 * b)
    add eax, edx       ; ax = ax + (2 * b)

    ; Adicionar 200 ao resultado
    add eax, [duzentos] ; ax = ax + 200

    ; Armazenar o resultado final em a
    mov [a], eax      ; a = resultado final

    ; preparar mensagem de saida
    mov eax, 4       ; syscall número para write
    mov ebx, 1       ; file descriptor para stdout
    mov ecx, men     ; endereço da mensagem
    mov edx, msg_len ; comprimento da mensagem
    int 0x80         ; chamada do sistema para escrever a mensagem

     ; Preparar o valor para saída
    mov eax, [a]     ; carregar o resultado final
    mov [resultado], eax ; armazenar o resultado

    ; Saída da mensagem
    mov eax, 4       ; syscall número para write
    mov ebx, 1       ; file descriptor para stdout
    mov ecx, resultado  ; endereço do resultado
    mov edx, 4       ; comprimento do resultado
    int 0x80         ; chamada do sistema para escrever o resultado

    ; Encerrar o programa (só para Linux; substitua conforme necessário)
    mov eax, 1       ; syscall número para exit
    xor ebx, ebx     ; código de saída 0
    int 0x80         ; chamada do sistema para encerrar o programa

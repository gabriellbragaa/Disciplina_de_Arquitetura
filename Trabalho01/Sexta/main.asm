section .data
    array dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  ; Array de 10 números
    msg db 'A soma dos numeros e: ', 0  ; Mensagem a ser exibida
    num_buffer times 5 db 0  ; Buffer para armazenar a representação em ASCII da soma
    len equ $ - msg

section .bss
    soma resw 1  ; Variável para armazenar a soma

section .text
    global _start

_start:
    mov ecx, 10  ; Contador para o loop
    mov esi, array  ; Ponteiro para o início do array
    mov eax, 0  

loop_sum:
    add eax, [esi]  ; Soma o elemento atual ao acumulador
    add esi, 2  ; Incrementa o ponteiro para o próximo elemento
    loop loop_sum  ; Decrementa o contador e repete o loop

    ; Conversão para ASCII de forma recursiva (até 5 dígitos)
    
    mov ecx, 10  ; Divisor para obter os dígitos
    mov esi, num_buffer + 4  ; Início do buffer (dígito mais significativo)

convert:
    xor edx, edx  ; Limpa o registrador 
    div ecx  ; Divide AX por 10
    add dl, '0'  ; Converte o resto para ASCII
    mov [esi], dl
    dec esi
    cmp eax, 0  ; Verifica se ainda há dígitos a converter
    jne convert

    ; Exibir a soma
    mov eax, 4  
    mov ebx, 1  
    mov ecx, msg  
    mov edx, len + 5  ; tamanho (incluindo o buffer)
    int 0x80

    ; Encerrar 
    mov eax, 1  
    xor ebx, ebx  
    int 0x80

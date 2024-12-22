section .data
    array dw 2, 3, 4, 5, 6  ; Array de 5 números
    msg db 'a multiplicacao dos numeros e: ', 0  ; Mensagem a ser exibida
    num_buffer times 10 db 0  ; Buffer para armazenar a representação em ASCII da soma
    len equ $ - msg

section .bss
    produto resd 1  ; Variável para armazenar o produto (32 bits)

section .text
    global _start

_start:
    mov ecx, 5  ; Contador para o loop
    mov esi, array  ; Ponteiro para o início do array
    mov eax, 1  ; Inicializa com 1

loop_mult:
    mov ebx, [esi]  ; Carrega o número atual em BX
    imul ebx  ; Multiplica EAX por BX (resultado em EAX:EDX)
    add esi, 2  ; Incrementa o ponteiro para o próximo elemento
    loop loop_mult  ; Decrementa o contador e repete o loop

    
    mov ecx, 10  ; Divisor para obter os dígitos
    mov esi, num_buffer + 9  ; Início do buffer (dígito mais significativo)
convert:
    xor edx, edx  ; Limpa o registrador EDX para a divisão
    div ecx  ;  EAX / 10
    add dl, '0'  ; Converte o resto para ASCII
    mov [esi], dl
    dec esi
    cmp eax, 0  ; Verifica se ainda há dígitos a converter
    jne convert

    ; Exibir o produto
    mov eax, 4  
    mov ebx, 1  
    mov ecx, msg  
    mov edx, len + 10  ; tamanho (incluindo o buffer)
    int 0x80

    ; Encerrar
    mov eax, 1  
    xor ebx, ebx  
    int 0x80

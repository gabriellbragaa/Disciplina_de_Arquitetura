;;;     section .data
    msg db 'Numeros entre 1000 e 1999 que ao serem divididos por 11 resultam em resto 5:', 10, 0
    newline db 10                  ; Nova linha

section .bss
    num resb 4                     ; Buffer para armazenar o número convertido (no formato ASCII)

section .text
    global _start

_start:
    
    mov ecx, 1000                 

loop_start:
    ; Verificar se o número é <= 1999
    cmp ecx, 1999
    jg done                       ; Se for maior que 1999, terminar o loop

    ; Dividir ecx por 11 
    mov eax, ecx                  ; Copiar número para EAX
    mov ebx, 11                   ; Divisor
    xor edx, edx                  ; Limpar EDX (resto)
    div ebx                       ; Divisão: EAX / EBX (resultado em EAX, resto em EDX)

    ; Verificar se o resto é 5
    cmp edx, 5
    jne increment               ; Se o resto não é 5, incrementar e continuar

    
    mov eax, ecx                  ; Número a ser convertido
    call print_num            ; Função para imprimir o número

    

increment:
    
    inc ecx
    jmp loop_start                ; Repetir o loop

exit:
    ; Encerrar o programa
    mov eax, 1                    ; syscall para sys_exit
    xor ebx, ebx                  ; status 0
    int 0x80                      ; chamada de sistema


    ; Imprimir o número
    mov eax, 4                    ; syscall para sys_write
    mov ebx, 1                    ; file descriptor 1 (stdout)
    mov ecx, ebx                  ; ponteiro para o número convertido
    mov edx, 4                    ; tamanho máximo do número
    sub edx, ebx                  ; ajustar tamanho real do número
    int 0x80                      ; chamada de sistema

    ret
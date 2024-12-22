section .data
    array db 10, 3, 5, 1, 8, 7, 6, 4, 2, 9 ; Vetor de 10 valores
    size equ 10

    msg db 'Segundo menor valor: ', 0
    msg_len equ $ - msg
    
    msg2 db 'Segundo maior valor: ', 0
    msg2_len equ $ - msg2

section .bss
    second_min resb 1
    second_max resb 1
    min1 resb 1
    min2 resb 1
    max1 resb 1
    max2 resb 1
    i resb 1
    j resb 1

section .text
    global _start

_start:
   
    mov byte [min1], 255  ; valor máximo possível para min1
    mov byte [min2], 255  ; valor máximo possível para min2
    mov byte [max1], 0    ; valor mínimo possível para max1
    mov byte [max2], 0    ; valor mínimo possível para max2

    ; Encontrar o menor e o maior
    mov ecx, size         ; contador
    mov ebx, array        ; ponteiro para o array

array:
    
    mov eax, [ebx]         ; valor atual
    
    ; Encontrar o menor valor
    cmp eax, [min1]        ; comparar com min1
    jge check_min2        ; se não for menor, pular
    mov [min2], [min1]    ; atualizar min2
    mov [min1], eax        ; atualizar min1
    jmp check_max

check_min2:
    cmp eax, [min2]        ; comparar com min2
    jge check_max         ; se não for menor, pular
    mov [min2], eax        ; atualizar min2

check_max:
    ; Encontrar o maior valor
    cmp eax, [max1]        ; comparar com max1
    jle check_max2        ; se não for maior, pular
    mov [max2], [max1]    ; atualizar max2
    mov [max1], eax        ; atualizar max1
    jmp increment_index

check_max2:
    cmp eax, [max2]        ; comparar com max2
    jle increment_index   ; se não for maior, pular
    mov [max2], eax        ; atualizar max2

increment_index:
    inc ebx               ; mover para o próximo elemento
    loop array    ; repetir até o final do array

    ; Imprimir resultados
    ; Imprimir segundo menor
    mov eax, 4           
    mov ebx, 1            
    mov ecx, msg          
    mov edx, msg_len      
    int 0x80              

    mov eax, [min2]        ; carregar o segundo menor
    call print_number     ; imprimir o número

    ; Imprimir segunda linha
    mov eax, 4            
    mov ebx, 1            
    mov ecx, msg2         
    mov edx, msg2_len     
    int 0x80              

    mov eax, [max2]        ; carregar o segundo maior
    call print_number     ; imprimir o número

    ; Encerrar o programa
    mov eax, 1            
    xor ebx, ebx          ; status 0
    int 0x80              ; chamada de sistema

; imprimir um número em ASCII
print_number:
    ; EAX contém o número a ser impresso
    add eax, '0'           ; converter para ASCII
    mov [num], eax         ; armazenar no buffer
    mov eax, 4            
    mov ebx, 1           
    mov ecx, num          ; ponteiro para o número
    mov edx, 1            ; tamanho do número
    int 0x80              ; chamada de sistema
    ret

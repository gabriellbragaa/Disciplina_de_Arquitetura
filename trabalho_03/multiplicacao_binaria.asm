global multiplicacao_binaria:function
extern printf

section .bss
    resultado resd 1

section .data
    num1 dd 6      ; Valor 1 (em decimal)
    num2 dd 9      ; Valor 2 (em decimal)
    saida_resultado db "Resultado da multiplicacao: %d",0AH,0H

section .text

multiplicacao_binaria:
   
    mov eax, [num1]      
    mov ecx, [num2]       
    xor edx, edx          ; EDX = 0 (acumulador para o resultado)
    xor ebx, ebx          ; EBX = 0 (contador para deslocamento)

multiplicacao_loop:
    test ecx, 1           ; Testa o bit menos significativo de ECX
    jz skip_add           ; Se o bit for 0, pula a adição
    add edx, eax          ; Adiciona EAX ao resultado

skip_add:
    shl eax, 1            ; Desloca EAX para a esquerda (multiplicando por 2)
    shr ecx, 1            ; Desloca ECX para a direita (dividindo por 2)
    loop multiplicacao_loop ; Repete até ECX ser 0

    mov [resultado], edx  ; Armazena o resultado

    ; Imprime o resultado
    push DWORD [resultado]
    push saida_resultado
    call printf
    add esp, 8

    ret

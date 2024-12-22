global multiplicacao_imul:function
extern printf

section .data
    num1 dd 6          ; Valor 1 (em decimal)
    num2 dd -9         ; Valor 2 (em decimal, negativo para demonstrar)
    saida_resultado db "Resultado da multiplicacao: %d",0AH,0H

section .text

multiplicacao_imul:
    mov eax, [num1]    ; EAX = num1 (multiplicador)
    imul eax, [num2]   ; EAX = EAX * num2 (multiplicando)
    ; A instrução IMUL multiplica EAX por num2 e armazena o resultado em EAX

    ; Imprime o resultado
    push eax           ; O resultado da multiplicação está em EAX
    push saida_resultado
    call printf
    add esp, 8         
    ret

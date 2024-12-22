global multiplicacao_mul:function
extern printf

section .data
    num1 dd 6        
    num2 dd 9        
    saida_resultado db "Resultado da multiplicacao: %d",0AH,0H

section .text

multiplicacao_mul:
    mov eax, [num1]    ; EAX = num1 (multiplicador)
    mov ebx, [num2]    ; EBX = num2 (multiplicando)
    mul ebx            ; EAX = EAX * EBX, resultado em EAX (lower) e EDX (higher)
    

    ; Imprime o resultado
    push eax           ; O resultado da multiplicação está em EAX
    push saida_resultado
    call printf
    add esp, 8       

    ret

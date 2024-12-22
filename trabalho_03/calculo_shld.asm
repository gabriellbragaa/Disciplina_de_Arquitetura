global calculo_shld:function
extern printf

section .bss
    a_shld resd 1

section .data
    i      dd 0
    limite dd 3
    v_shld dd 5
    b_shld dd 3  ; Valor com o qual os bits deslocados serão combinados
    saida_ant_shld db "valor antigo shld: %d",0AH,0H
    saida_nov_shld db "valor novo shld %d deslocado à esquerda por 1 bit e combinado com %d: %d",0AH,0H

section .text

calculo_shld:
    mov eax, [v_shld]
    mov [a_shld], eax    
    push DWORD [a_shld]
    push saida_ant_shld
    call printf    
    add esp, 8
    
    mov ebx, [i]
    
laco_shld:
    cmp ebx, [limite]
    jae next_shld
    inc ebx
    mov eax, [a_shld]        
    shl eax, 1                ; Desloca 'a_shld' para a esquerda por 1 bit
    mov edx, [b_shld]        
    mov ecx, 1                ; Deslocamento em bits
    shld eax, edx, cl        ; Desloca 'a_shld' e combina com 'b_shld'
    mov [a_shld], eax

    
    jmp laco_shld
    
next_shld:
    
    push DWORD [a_shld]
    push DWORD [v_shld]
    push DWORD [b_shld]
    push saida_nov_shld
    call printf    
    add esp, 16
    
    
    ret

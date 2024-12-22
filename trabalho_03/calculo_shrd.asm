global calculo_shrd:function
extern printf

section .bss
    a_shrd resd 1

section .data
    i      dd 0
    limite dd 3
    v_shrd dd 40
    b_shrd dd 3  
    saida_ant_shrd db "valor antigo shrd: %d",0AH,0H
    saida_nov_shrd db "valor novo shrd %d deslocado à direita por 1 bit e combinado com %d: %d",0AH,0H

section .text

calculo_shrd:
    mov eax, [v_shrd]
    mov [a_shrd], eax    
    push DWORD [a_shrd]
    push saida_ant_shrd
    call printf    
    add esp, 8
    
    mov ebx, [i]
    
laco_shrd:
    cmp ebx, [limite]
    jae next_shrd
    inc ebx
    mov eax, [a_shrd]        
    mov edx, [b_shrd]        
    mov ecx, 1                ; Deslocamento em bits
    shrd eax, edx, cl        ; Desloca 'a_shrd' e combina com 'b_shrd'
    mov [a_shrd], eax

    
    mov edx, [a_shrd]
    mov [b_shrd], edx

    
    jmp laco_shrd
    
next_shrd:
    push DWORD [a_shrd]
    push DWORD [v_shrd]
    push DWORD [b_shrd]
    push saida_nov_shrd
    call printf    
    add esp, 16
    
    
    ret

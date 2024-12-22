global calculo_ror:function
extern printf

section .bss
    a_ror resd 1

section .data
    i      dd 0
    limite dd 3
    v_ror  dd 20
    saida_ant_ror db "valor antigo ror: %d",0AH,0H
    saida_nov_ror db "valor novo ror %d rotacionado por 1 bit: %d",0AH,0H

section .text

calculo_ror:
    mov eax, [v_ror]
    mov [a_ror], eax    
    push DWORD [a_ror]
    push saida_ant_ror
    call printf    
    add esp, 8
    
    mov ebx, [i]    
laco_ror:
    cmp ebx, [limite]
    jae next_ror
    inc ebx
    mov eax, [a_ror]        
    ror eax, 1  ; Rotaciona 'a_ror' para a direita por 1 bit
    mov [a_ror], eax
    
    
    jmp laco_ror
    
next_ror:
    push DWORD [a_ror]
    push DWORD [v_ror]
    push saida_nov_ror
    call printf    
    add esp, 12
    ret

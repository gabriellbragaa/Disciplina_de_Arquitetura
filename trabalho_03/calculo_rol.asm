global calculo_rol:function
extern printf

section .bss
    a_rol resd 1

section .data
    i      dd 0
    limite dd 3
    v_rol  dd 5
    saida_ant_rol db "valor antigo rol: %d",0AH,0H
    saida_nov_rol db "valor novo rol %d rotacionado por 1 bit: %d",0AH,0H

section .text

calculo_rol:
    mov eax, [v_rol]
    mov [a_rol], eax    
    push DWORD [a_rol]
    push saida_ant_rol
    call printf    
    add esp, 8
    
    mov ebx, [i]    
laco_rol:
    cmp ebx, [limite]
    jae next_rol
    inc ebx
    mov eax, [a_rol]        
    rol eax, 1  ; Rotaciona 'a_rol' para a esquerda por 1 bit
    mov [a_rol], eax
    
    
    jmp laco_rol
    
next_rol:
    push DWORD [a_rol]
    push DWORD [v_rol]
    push saida_nov_rol
    call printf    
    add esp, 12
    
    ret
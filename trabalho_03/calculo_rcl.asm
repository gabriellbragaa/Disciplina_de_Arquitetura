global calculo_rcl
extern printf

section .bss
    a_rcl resd 1

section .data
    i      dd 0
    limite dd 3
    v_rcl  dd 5
    carry  db 0      
    saida_ant_rcl db "valor antigo rcl: %d",0AH,0H
    saida_nov_rcl db "valor novo rcl %d rotacionado com carry por 1 bit: %d",0AH,0H

section .text

calculo_rcl:
    mov eax, [v_rcl]
    mov [a_rcl], eax    
    push DWORD [a_rcl]
    push saida_ant_rcl
    call printf    
    add esp, 8
    
    mov ebx, [i]
    mov byte [carry], 0  ; Inicializa o carry flag

laco_rcl:
    cmp ebx, [limite]
    jae next_rcl
    inc ebx
    
    mov eax, [a_rcl]
    movzx ecx, byte [carry] ; Carrega o carry flag em ecx
    shl eax, 1                ; Desloca 'a_rcl' para a esquerda por 1 bit
    rcl eax, 1                ; Rotaciona com carry para a esquerda por 1 bit
    mov [a_rcl], eax
    
    ; Atualiza o carry flag
    movzx edx, al
    mov byte [carry], dl

    
    jmp laco_rcl
    
next_rcl:
    ; Impressão final após o loop
    push DWORD [a_rcl]
    push DWORD [v_rcl]
    push saida_nov_rcl
    call printf    
    add esp, 12
    
    ret

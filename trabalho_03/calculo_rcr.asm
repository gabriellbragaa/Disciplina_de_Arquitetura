global calculo_rcr:function
extern printf

section .bss
    a_rcr resd 1

section .data
    i      dd 0
    limite dd 3
    v_rcr  dd 40
    carry  db 0     
    saida_ant_rcr db "valor antigo rcr: %d",0AH,0H
    saida_nov_rcr db "valor novo rcr %d rotacionado com carry por 1 bit: %d",0AH,0H

section .text

calculo_rcr:
    mov eax, [v_rcr]
    mov [a_rcr], eax    
    push DWORD [a_rcr]
    push saida_ant_rcr
    call printf    
    add esp, 8
    
    mov ebx, [i]
    mov byte [carry], 0  ; Inicializa o carry flag

laco_rcr:
    cmp ebx, [limite]
    jae next_rcr
    inc ebx
    
    mov eax, [a_rcr]
    movzx ecx, byte [carry] ; Carrega o carry flag em ecx
    rcr eax, 1                ; Rotaciona com carry para a direita por 1 bit
    mov [a_rcr], eax
    
    ; Atualiza o carry flag
    movzx edx, al
    mov byte [carry], dl

    ;push DWORD [a_rcr]
    ;push DWORD [v_rcr]
    ;push saida_nov_rcr
    ;call printf    
    ;add esp, 12
    
    jmp laco_rcr
    
next_rcr:
    ; Impressão final após o loop
    push DWORD [a_rcr]
    push DWORD [v_rcr]
    push saida_nov_rcr
    call printf    
    add esp, 12
    
    ret


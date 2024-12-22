global main 
extern printf
extern calcular_shl

section .bss
    a_shl resd 1
section .data
    i     dd 0
    v_shl dd 5

    saida_a_shl db "o valor antigo: %d", 0AH, 0H 
    aida_n_shl db "o valor novo: 2^%d", 0AH, 0H 
    

section .text 
main:

    call calcular_shl
    call fim 

calcular_shl: 
    mov eax, [v_shl]
    mov [v_shl], eax 
    push DWORD, [a_shl]
    push saida_ant_shl
    call printf
    add esp, 8


    mov eax, [a_shl]
    shl eax, 1
    mov [a_shl], eax 
    push DWORD, [a_shl]
    push ebx
    push DWORD, [v_shl]
    push saida, nov_shl
    call printf
    add esp, 16

fim:
    mov eax, 1
    mov ebx, 0
    int 0x80


section .data
    prompt db 'Digite o valor do preço: ', 0
    num_format db '%u', 0
    imp_barato db 'barato ', 0
    imp_normal db 'normal ', 0
    imp_caro db 'caro ', 0
    imp_muitoCaro db 'Muito Caro ', 0

section .bss
    preco resd 1  

section .text
    extern printf, scanf
    global main

main:
    push    ebp
    mov     ebp, esp
    sub     esp, 4                   

   
    push    prompt
    call    printf
    add     esp, 4

   
    lea     eax, [preco]            
    push    eax
    push    num_format
    call    scanf
    add     esp, 8

    
    mov     eax, [preco]
    cmp     eax, 80
    jle     barato
    cmp     eax, 120
    jle     normal
    cmp     eax, 200
    jle     caro
    jmp     muitoCaro

barato:
    push    imp_barato
    call    printf
    add     esp, 4
    jmp     final

normal:
    push    imp_normal
    call    printf
    add     esp, 4
    jmp     final

caro:
    push    imp_caro
    call    printf
    add     esp, 4
    jmp     final

muitoCaro:
    push    imp_muitoCaro
    call    printf
    add     esp, 4

final:
    mov     esp, ebp
    pop     ebp
    ret

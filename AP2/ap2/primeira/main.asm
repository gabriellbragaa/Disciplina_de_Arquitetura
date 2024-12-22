global main 
extern printf

section .data
    imp db 'A soma de %d e %d é: %d', 0

section .text

soma:
    push    ebp
    mov     ebp, esp
    mov     eax, [ebp+8]
    add     eax, [ebp+12]
    pop     ebp
    ret

main:
    push    ebp
    mov     ebp, esp
    sub     esp, 16
    mov     DWORD [ebp-8], 10
    mov     DWORD [ebp-4], 5

    mov     eax, DWORD [ebp-4]
    push    eax
    mov     eax, DWORD [ebp-8]
    push    eax

    call    soma
    add     esp, 8

    mov     DWORD [ebp-12], eax

    mov     edx, DWORD [ebp-12]
    push    edx
    mov     eax, DWORD [ebp-4]
    push    eax
    mov     eax, DWORD [ebp-8]
    push    eax
    push    imp
    call    printf
    add     esp, 16

    xor     eax, eax
    mov     esp, ebp
    pop     ebp
    ret

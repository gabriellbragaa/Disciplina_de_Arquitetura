global main
extern printf

section .data
    imp DB 'A soma dos números é: %d', 0

section .bss

section .text
main:
    push    ebp
    mov     ebp, esp
    sub     esp, 40

    mov     DWORD [ebp-40], 1
    mov     DWORD [ebp-36], 2
    mov     DWORD [ebp-32], 3
    mov     DWORD [ebp-28], 4
    mov     DWORD [ebp-24], 5
    mov     DWORD [ebp-20], 6
    mov     DWORD [ebp-16], 7
    mov     DWORD [ebp-12], 8
    mov     DWORD [ebp-8], 9
    mov     DWORD [ebp-4], 10

    mov     DWORD [ebp-44], 0
    mov     DWORD [ebp-48], 0

lopp:
    cmp     DWORD [ebp-48], 10
    jge     print_sum

    mov     ecx, DWORD [ebp-48]
    mov     edx, DWORD [ebp-44]
    mov     eax, DWORD [ebp-40 + ecx*4]
    add     edx, eax
    mov     DWORD [ebp-44], edx

    add     DWORD [ebp-48], 1
    jmp     lopp

print_sum:
    mov     eax, DWORD [ebp-44]
    push    eax
    push    imp
    call    printf
    add     esp, 8

    mov     esp, ebp
    pop     ebp
    ret

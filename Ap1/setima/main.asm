global main
extern printf

section .data
    imp db 'A multiplicacao dos numeros e: %d', 10, 0

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

    mov     eax, 1
    mov     DWORD [ebp-44], eax

    mov     ecx, 0

lopp:
    mov     eax, DWORD [ebp+ecx*4-40]
    mov     edx, DWORD [ebp-44]
    imul    edx, eax
    mov     DWORD [ebp-44], edx

    add     ecx, 1
    cmp     ecx, 10
    jl      lopp

print_mul:
    mov     eax, DWORD [ebp-44]
    push    eax
    push    imp
    call    printf
    add     esp, 8

    mov     esp, ebp
    pop     ebp
    ret

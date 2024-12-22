global main
extern printf

section .data
        imp db '%d', 0ah, 00h
section .bss

section .text

main:

    push ebp
    mov ebp, esp
    sub esp, 12

    ; eax = 1000
    mov DWORD [ebp - 8], 1000

    ; ebx = 1999 
    mov DWORD [ebp - 12], 1999

    mov eax, DWORD [ebp - 8]
    mov DWORD [ebp - 4], eax 
    jmp divisivel

    ; for (int i = inicio; i <= fim; i++) {

vai: 
    mov ecx, DWORD [ebp - 4]
    add ecx, 1 
    mov DWORD [ebp - 4], ecx

divisivel:
    mov edx, DWORD [ebp - 4]
    cmp edx, DWORD [ebp - 12]
    jg  retorna

    ; if (i % 11 == 5) {
    mov eax, DWORD [ebp -4]
    cdq
    mov ecx, 11
    idiv ecx
    cmp edx, 5 
    jne final 

    ; imprime 
    mov edx, DWORD [ebp-4]
    push edx 
    push imp
    call printf
    add esp, 8

final:
    jmp vai 

retorna:
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret 0

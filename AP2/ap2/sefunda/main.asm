global main
extern printf

section .data
    ar dd 10, 20, 30, 40
    size  dd 4
    fmt   db "Resultado: %d, %d, %d, %d", 0xA, 0

section .text

main:
    mov ecx, [size]
    dec ecx
    mov esi, ecx
    shl ecx, 2
    mov eax, [ar + ecx]

    mov ecx, [size]
    dec ecx
loop:
    mov ebx, ecx
    dec ebx
    shl ebx, 2
    mov edx, [ar + ebx]
    mov [ar + ebx + 4], edx
    loop loop

    mov [ar], eax

    push dword [ar + 12]
    push dword [ar + 8]
    push dword [ar + 4]
    push dword [ar]
    push fmt
    call printf

    xor eax, eax
    mov esp, ebp
    pop ebp
    ret

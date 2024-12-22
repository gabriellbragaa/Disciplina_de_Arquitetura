section .data
    imp_sum db 'soma eh: %d', 0aH, 0

section .bss 

section .text
    extern printf
    global main

soma: 
    ; int soma(int a, int size)
    push    ebp
    mov     ebp, esp
    sub     esp, 8
    mov     DWORD [ebp-4], 0         ; sum = 0

.loop:
    mov     eax, DWORD [ebp+12]      ; eax = a
    mov     ecx, DWORD [ebp+8]       ; ecx = size
    cmp     ecx, 0
    je      .end_loop                ; if size == 0, exit loop
    add     DWORD [ebp-4], eax       ; sum += a
    add     DWORD [ebp+12], 1        ; a++
    sub     DWORD [ebp+8], 1         ; size--
    jmp     .loop

.end_loop:
    mov     eax, DWORD [ebp-4]       ; return sum
    mov     esp, ebp
    pop     ebp
    ret

main: 
    push    ebp
    mov     ebp, esp
    sub     esp, 8

    push    5                       ; size = 5
    push    1                       ; a = 1
    call    soma                    ; call soma(1, 5)
    add     esp, 8
    mov     DWORD [ebp-4], eax      ; store result of soma

    mov     eax, DWORD [ebp-4]      ; prepare to call printf
    push    eax
    push    imp_sum
    call    printf
    add     esp, 8

    xor     eax, eax                ; return 0
    mov     esp, ebp
    pop     ebp
    ret

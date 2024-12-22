 global main
 extern printf

section .data
    format_par db "Soma dos numeros pares de 1 a 100: %d", 0aH, 00H
    format_impar db "Soma dos numeros impares de 1 a 100: %d", 0aH, 00H
    format_total db "Soma total: %d", 10, 0

section .bss
    soma_par resd 1
    soma_impar resd 1

section .text
   

main:
        push    ebp
        mov     ebp, esp
        sub     esp, 16                             
        mov     DWORD [ebp-8], 0
        mov     DWORD [ebp-12], 0
        mov     DWORD [ebp-4], 1
        jmp     $LN4@main
$LN2@main:
        mov     eax, DWORD [ebp-4]
        add     eax, 1
        mov     DWORD [ebp-4], eax
$LN4@main:
        cmp     DWORD [ebp-4], 100      
        jg      $LN3@main
        mov     ecx, DWORD [ebp-4]
        and     ecx, -2147483647              
        jns     $LN8@main
        dec     ecx
        or      ecx, -2                          
        inc     ecx
$LN8@main:
        test    ecx, ecx
        jne     $LN5@main
        mov     edx, DWORD [ebp-8]
        add     edx, DWORD [ebp-4]
        mov     DWORD [ebp-8], edx
        jmp     $LN6@main
$LN5@main:
        mov     eax, DWORD [ebp-12]
        add     eax, DWORD [ebp-4]
        mov     DWORD [ebp-12], eax
$LN6@main:
        jmp     $LN2@main
$LN3@main:
        mov     ecx, DWORD [ebp-8]
        add     ecx, DWORD [ebp-12]
        mov     DWORD [ebp-16], ecx
        mov     edx, DWORD [ebp-8]
        push    edx
        push    format_par
        call    printf
        add     esp, 8

        mov     eax, DWORD [ebp-12]
        push    eax
        push    format_impar
        call    printf
        add     esp, 8
        
        mov     ecx, DWORD [ebp-16]
        push    ecx
        push    format_total
        call    printf
        add     esp, 8
        
        
         xor eax, eax 
        mov esp, ebp
        pop ebp 
        ret 0
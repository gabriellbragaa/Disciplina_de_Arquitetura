global main
extern printf

section .data
    imp db "Segundo menor: %d", 10, "Segundo maior: %d", 10, 0
    array dd 12, 45, 7, 22, 34, 89, 4, 66, 23, 18  

section .bss
    menor resd 1  
    maior resd 1  

section .text
main:
   
    push    ebp
    mov     ebp, esp

   
    mov     dword [menor],  2147483647  ; Maior número representável
    mov     dword [maior], -2147483648  ; Menor número representável 

    
    mov     ecx, 10          ; Contador de 10 números
    lea     ebx, [array]      ; Apontar para o início do array
segundo_menor:
    mov     eax, [ebx]        ; Carregar o valor atual

    ; Verificar segundo menor
    cmp     eax, [menor]
    jge     segundo_maior
    ; Atualizar segundo menor
    mov     [menor], eax
    jmp     loop_c

segundo_maior:
    ; Verificar segundo maior
    cmp     eax, [maior]
    jle     loop_c
    ; Atualizar segundo maior
    mov     [maior], eax

loop_c:
    add     ebx, 4            ; Avançar para o próximo elemento
    loop    segundo_menor

    
    push    dword [maior]
    push    dword [menor]
    push    imp
    call    printf
    add     esp, 12           

   
    mov     esp, ebp
    pop     ebp
    ret

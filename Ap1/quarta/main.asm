global main
extern printf

section .data 
    imp_par db 'O numero %d eh par', 0Ah, 0
    imp_impar db 'O numero %d eh impar', 0Ah, 0

section .text

main:
    
    push    ebp
    mov     ebp, esp
    sub     esp, 4            

    
    mov     DWORD [ebp - 4], 10

    
    mov eax, DWORD [ebp - 4]
    and eax, 1                
    jnz impar                  

    
par:    
    mov ecx, DWORD [ebp - 4]
    push ecx 
    push imp_par
    call printf                
    add esp, 8
    jmp encerra

    
impar:
    mov edx, DWORD [ebp - 4]
    push edx
    push imp_impar
    call printf                
    add esp, 8

    
encerra: 
    xor eax, eax              
    mov esp, ebp 
    pop ebp 
    ret

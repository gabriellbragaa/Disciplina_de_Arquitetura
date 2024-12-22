global main 
extern printf

section .data
    imp db 'O valor de a é: %d', 0    

section .bss

section .text

main: 
    
    push ebp
    mov ebp, esp
    sub esp, 12

    ; Atribuição de b = 10 e c = 20
    mov DWORD [ebp-12], 10      ; b = 10
    mov DWORD [ebp-8], 20       ; c = 20
    
    ; int a = (2 * b) + (c / 2) + 200;
    ; Calculando c / 2
    mov eax, DWORD [ebp-8]      ; eax = c
    cdq                         ; Extende o sinal de eax para edx
    sar eax, 1                  ; eax = c / 2

    ; Calculando 2 * b
    mov ecx, DWORD [ebp-12]     ; ecx = b
    lea edx, [ecx*2]            ; edx = 2 * b

    ; Somando (2 * b) + (c / 2) + 200
    add eax, edx                ; eax = (2 * b) + (c / 2)
    add eax, 200                ; eax = (2 * b) + (c / 2) + 200
    mov DWORD [ebp-4], eax      ; armazena o resultado em a (ebp-4)

   
    mov eax, DWORD [ebp-4]      
    push eax                    
    push imp                    
    call printf                 
    add esp, 8                  

    
    xor eax, eax                
    mov esp, ebp 
    pop ebp 
    ret

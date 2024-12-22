global main
extern printf

section .data
    media_aluno db 'A média ponderada dos três alunos é: %d', 10, 0
    imp_apro db 'APROVADO!', 0
    imp_rep db 'REPROVADO!', 0

section .bss
    resultado resd 1              

section .text
main:
    
    push ebp
    mov ebp, esp
    sub esp, 8

    
    mov dword [ebp-4], 8          ; Aluno 1: 8
    mov dword [ebp-8], 7          ; Aluno 2: 7
    mov eax, 6                    ; Aluno 3: 6
    mov [ebp-12], eax             

    ; Cálculo da média ponderada
    ; (media1 + media2 + media3) / 3
    mov eax, [ebp-4]              ; Carrega media1 em eax (8)
    add eax, [ebp-8]              ; Soma com media2 (7)
    add eax, [ebp-12]             ; Soma com media3 (6)
    cdq                            ; Estende o sinal de eax
    mov ebx, 3                     
    idiv ebx                       
    mov [resultado], eax           

    ; Exibe a média ponderada
    mov eax, [resultado]
    push eax
    push media_aluno
    call printf
    add esp, 8

    ; Verifica se a média ponderada é >= 7 
    jge aprovado
    jmp reprovado

aprovado:
    push imp_apro
    call printf
    add esp, 4
    jmp encerra

reprovado:
    push imp_rep
    call printf
    add esp, 4
    jmp encerra

encerra:
   
    mov esp, ebp
    pop ebp
    ret

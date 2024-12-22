;  4. Escreva um programa que leia uma constante numérica inteira e, em seguida, escreva na tela se o
;     número é par ou ímpar.
;   
;   - sabemos que se usamos a porta AND com o numero e ele retornar 1 quer dizer q o numero é impar

;   - se retornar 0 e par
;   
;




section .data 
    a dw 10 
    const dw 2                                  ; numero inteiro 
    par db 'o numero e par' ,0 
    impar db 'o numero e impar' ,0 


section .bss
    temp resb 10                                 ; reserva o espaco de 10 10bytes


section .text
        global _start

_start:
    mov eax , [a]                             ; eax = 7

    ; verificar se é impar ou par

    mov ebx , [const]                              ; ebx = 2
    idiv eax , ebx                                 ; eax / ebx
    cmp edx , 0                                    ; o resto fica armazenado em edx
    je  par 

    ; se for impar 

    mov eax, 4   
    mov ebx, 1
    mov ecx, impar
    mov edx, 20 
    int 0x80
    jmp exit                                       ; pular para sair


par:
    mov eax, 4             ; Código da chamada de sistema para sys_write
    mov ebx, 1             ; Descriptor de arquivo para stdout
    mov ecx, par           ; Mensagem para imprimir
    mov edx, 18            ; Comprimento da mensagem
    int 0x80               ; Chamada de sistema para escrever


exit: 
        mov eax, 1 
        xor ebx, ebx
        int 0x80               



;1. Escreva um programa que calcule a soma dos números par e impar de 1 até 100. O resultado deverá
;   ser armazenado no registrador eax e também deverá ser exibido na tela


global main 
extern printf

section .data 
    imprimir db "o valor da saida de 1 ate 100: %d", 10, 0 ; string formada para printf, e cria uma nova linha e termina em 0

section .text 
main: 

    xor eax, eax            ; modo mais eficiente de atribuir 0 para o registrador eax
    mov ecx, 1              ; mover 1 para o registrador ecx

laco: 

    add eax, ecx            ; soma ecx com eax
    inc ecx
    cmp ecx, 100            ; compare o valor de ecx com 100 ; se e igual da o jump 
    jbe laco 

    ; se nao eh igual 
    push eax
    push imprimir
    add esp, 8              ; usamos para restaurar um espaco da pilha com 8bytes

    mov eax, 1              ; chamada para o sistema sys_exit para encerrar o processo
    mov ebx, 0              ; sys_exit para saida bem sucedida; define a saida do codigo como 0
    int 0x80                ; chama kernel ; chamada do sistema para encerrar o programa
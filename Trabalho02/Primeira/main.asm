;   Escreva o seguinte código em assembly, modulado e com pilha. Mostre a impressão do resultado.
;   1 #include
;   2 int main (){
;   3 int a=5;
;   4 printf("a=%d, eax=%d\n", a, a+2);
;   5
;   6 return 0;
;   7 


global main
extern printf 


section .data 
    imp db "o valor a=%d, eax=%d", 0aH, 00H
section .bss

section .text 


main: 

    push ebp                    ; salva o valor de ebp na pilha e decremneta o esp
    mov ebp, esp                ; atualiza o ebp para apontar para o topo da pilha onde ebp foi armazenado
    push ecx                    ; salva o valor de ecx na pilha e decrementa o esp

    mov DWORD [ebp - 4], 5      ; int a= 5         
    mov eax, DWORD [ebp - 4]
    
    add eax, 2                  ; eax = a + 2
    push eax 
    mov ecx, DWORD [ebp - 4]    ; salva o valor de eax = a + 2
    push ecx
    push imp 
    call printf                
    add esp, 12                 ;           

    xor eax, eax 
    mov esp, ebp
    pop ebp 
    ret 0
;   #include
;    void funcao (){
;    int a = 5;
;    int b = 2;
;    int soma = a+b;
;    printf("A soma eh: %d", soma);
;    }
;    int main (){
;
;   soma ();
;
;     return 0;
;   }

;///////////////////////////////////////////////////////
;///////////////////////////////////////////////////////

global main
extern printf 

section .data 
        fmt db 'a soma eh: %d', 0Ah
       
section .bss
        soma resd 1

section .text
        call printf
        call soma

funcao: 
        ; void funcao(){
        push ebp 
        mov  ebp, esp
        sub  esp, 12 

        ; int a = 5
        mov DWORD [ebp - 4], 5
        

        ; int b = 2
        mov DWORD [ebp - 8], 2
        

        ; int soma = a+b 
        mov eax, DWORD [ebp - 4]    ; eax = a
        add eax, DWORD [ebp - 8]    ; eax = a + b
        mov DWORD [ebp - 12], eax   ; salvar o valor da soma em ebp - 12 

        ; imprimir o print 
        mov  ecx, DWORD [ebp - 12]
        push ecx                    ; coloca o resultado da soma na pilha
        push fmt 
        call printf
        add  esp, 8                 ; limpar a pilha 

        ; encerrar a funcao
        mov esp, ebp 
        pop ebp 
        ret 0

main: 

        ; inicio da main  
        push ebp 
        mov  ebp, esp

        ; chama a funcao main()
        call funcao 
        xor  eax, eax

        ;encerrar a main()
        pop  ebp 
        ret  0 








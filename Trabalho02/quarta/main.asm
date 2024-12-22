global main
extern printf

section .data 
        imp db 'o valor da soma eh: %d"', 0AH, 00h 
section .bss
        soma resd 1                     ; salva na memoria
section .text
        call printf
        call soma
main: 
        ;cria o int main
        push ebp
        mov ebp, esp
        push ecx
        
        ; cria soma = funcao (2,3)
        push 3                          ; 3
        push 2                          ; 2
        call funcao                       ; funxao(2,3)    
        add esp, 8                        ; 
        mov DWORD[ebp - 4], eax           ; guardar o valor da funcao em DWORD[ebp-4]

        ; cria o printf(soma)
        mov eax, DWORD[ebp - 4]           ; guarda o valor da funcao em eax
        push eax
        push imp 
        call printf
        add esp, 8                      ; limpa a pilha 

        ; return 0 
        xor eax, eax                    ; limpa 

        ; encerra a main 
        mov esp, ebp
        pop ebp
        ret 0

funcao:

        ; funcao(int x, int y)
        push ebp
        mov ebp, esp
        sub esp,8

        ;int a = x;
        mov eax, DWORD[ebp + 8]         ; x 
        mov DWORD[ebp - 4], eax         ; a = x


        mov ecx, DWORD[ebp + 12]        ; y
        mov DWORD[ebp - 8], ecx         ; b = y

        ; return a+b
        mov eax, DWORD[ebp-4]           ; a
        add eax, DWORD[ebp-8]           ; a + b

        ; encerra a funcao
        mov esp, ebp 
        pop ebp
        ret 0




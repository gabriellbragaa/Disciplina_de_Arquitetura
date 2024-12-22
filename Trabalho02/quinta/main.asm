;    #include
; void par(int x);
;
;   int main (){
;   int a = par (4);
;
;    if(a == 0){
;       printf("par=%d",a);
;   }else{
;       printf("impar =%d",a);
;   }
;    return 0;
;   }

global main
extern printf




section .data 
    imp_par db 'par: %d', 0AH
    imp_impar db 'impar: %d', 0AH

section .bss


section .text 
        call printf
main:   
        ; int main()
        push ebp 
        mov ebp, esp 
        push ecx

        ; a = par(4)
        push 4
        call par 
        add esp, 4 
        mov DWORD [ebp - 4], eax

        ; if (a == 0){
        cmp DWORD [ebp - 4], 0
        jne short print_impar

        ; printf("par = %d\n", a);
        mov eax, DWORD [ebp - 4]
        push eax
        push imp_par
        call printf
        add esp, 8
        
        ; else
        jmp end_main

print_impar:
        mov ecx, DWORD[ebp-4]
        push ecx
        push imp_impar
        call printf
        add esp, 8

        
end_main: 
        xor eax, eax
        mov esp, ebp
        pop ebp
        ret 0

        ; int par(int x)
par:    
        push ebp 
        mov ebp , esp

        ; return x % 2

        mov eax, DWORD [ ebp + 8]
        and eax, 1 
        jns short end_par
        dec eax
        or eax, -2
        inc eax

end_par:         
        pop ebp 
        ret 0


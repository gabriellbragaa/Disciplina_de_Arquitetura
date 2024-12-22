maior$ = -56                                     ; size = 4
_menor$ = -52                                     ; size = 4
_i$ = -48                                         ; size = 4
_numeros$ = -44                               ; size = 40
__$ArrayPad$ = -4                                 ; size = 4
_main   PROC
        push    ebp
        mov     ebp, esp
        sub     esp, 56                             ; 00000038H
        mov     eax, DWORD PTR ___security_cookie
        xor     eax, ebp
        mov     DWORD PTR __$ArrayPad$[ebp], eax
        mov     DWORD PTR _numeros$[ebp], 1
        mov     DWORD PTR _numeros$[ebp+4], 2
        mov     DWORD PTR _numeros$[ebp+8], 3
        mov     DWORD PTR _numeros$[ebp+12], 4
        mov     DWORD PTR _numeros$[ebp+16], 5
        mov     DWORD PTR _numeros$[ebp+20], 6
        mov     DWORD PTR _numeros$[ebp+24], 7
        mov     DWORD PTR _numeros$[ebp+28], 8
        mov     DWORD PTR _numeros$[ebp+32], 9
        mov     DWORD PTR _numeros$[ebp+36], 10         ; 0000000aH
        mov     eax, 4
        imul    ecx, eax, 0
        mov     edx, DWORD PTR _numeros$[ebp+ecx]
        mov     DWORD PTR _menor$[ebp], edx
        mov     eax, DWORD PTR _menor$[ebp]
        mov     DWORD PTR _maior$[ebp], eax
        mov     DWORD PTR _i$[ebp], 1
        jmp     SHORT $LN4@main
$LN2@main:
        mov     ecx, DWORD PTR _i$[ebp]
        add     ecx, 1
        mov     DWORD PTR _i$[ebp], ecx
$LN4@main:
        cmp     DWORD PTR _i$[ebp], 10                    ; 0000000aH
        jge     SHORT $LN3@main
        mov     edx, DWORD PTR _i$[ebp]
        mov     eax, DWORD PTR _numeros$[ebp+edx*4]
        cmp     eax, DWORD PTR _maior$[ebp]
        jle     SHORT $LN5@main
        mov     ecx, DWORD PTR _i$[ebp]
        mov     edx, DWORD PTR _numeros$[ebp+ecx*4]
        mov     DWORD PTR _maior$[ebp], edx
$LN5@main:
        mov     eax, DWORD PTR _i$[ebp]
        mov     ecx, DWORD PTR _numeros$[ebp+eax*4]
        cmp     ecx, DWORD PTR _menor$[ebp]
        jge     SHORT $LN6@main
        mov     edx, DWORD PTR _i$[ebp]
        mov     eax, DWORD PTR _numeros$[ebp+edx*4]
        mov     DWORD PTR _menor$[ebp], eax
$LN6@main:
        jmp     SHORT $LN2@main
$LN3@main:
        mov     ecx, DWORD PTR _maior$[ebp]
        push    ecx
        push    OFFSET $SG9748
        call    _printf
        add     esp, 8
        mov     edx, DWORD PTR _menor$[ebp]
        push    edx
        push    OFFSET $SG9749
        call    _printf
        add     esp, 8
        xor     eax, eax
        mov     ecx, DWORD PTR __$ArrayPad$[ebp]
        xor     ecx, ebp
        call    @__security_check_cookie@4
        mov     esp, ebp
        pop     ebp
        ret     0
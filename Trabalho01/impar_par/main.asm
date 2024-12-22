# License: MSVC Proprietary
# The use of this compiler is only permitted for internal evaluation purposes and is otherwise governed by the MSVC License Agreement.
# See https://visualstudio.microsoft.com/license-terms/vs2022-ga-community/
_DATA   SEGMENT
COMM    `__local_stdio_printf_options'::`2'::_OptionsStorage:QWORD                                                    ; `__local_stdio_printf_options'::`2'::_OptionsStorage
_DATA   ENDS
_DATA   SEGMENT
$SG9740 DB        'a=%d, eax=%d', 0aH, 00H
_DATA   ENDS

_a$ = -4                                                ; size = 4
_main   PROC
        push    ebp
        mov     ebp, esp
        push    ecx
        mov     DWORD PTR _a$[ebp], 5
        mov     eax, DWORD PTR _a$[ebp]
        add     eax, 2
        push    eax
        mov     ecx, DWORD PTR _a$[ebp]
        push    ecx
        push    OFFSET $SG9740
        call    _printf
        add     esp, 12                             ; 0000000cH
        xor     eax, eax
        mov     esp, ebp
        pop     ebp
        ret     0
_main   ENDP
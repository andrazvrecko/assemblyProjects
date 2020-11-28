;fn = fn-3 + fn-2. f0 = 1; f1 = 1; f2=7
; 1 1 7 2 8 9 10 17 19 27
global  _main
    extern  _printf
    extern  _scanf

global _func1

    section .data
    
message:  db  '%d',10, 0 ;za izpis stevil
formatin: db "%d", 0 ;input
message1: db "Vpisite stevilo: ",10, 0 
integer1: times 4 db 0 ; 32-bits integer = 4 bytes
divider1: times 4 db 11; 
       section .text
_clen:
    push    dword 8
    add     esp, 4
    mov     ebx, dword[esp - 0]
    jmp     _jmpback

_main:
    mov     ebp, esp; for correct debugging
    push    message1 
    call    _printf ;izpise sporocilo
    add     esp, 4 ;izbrise
    ;
    push    integer1 
    push    formatin
    call    _scanf
    add     esp, 8
    mov     ecx, dword[integer1]
    ;
    mov     eax, 12
    ;
    push    dword 1
    push    dword 1
    push    dword 7
    push    ecx
    
    call    _func1
    
    add     esp, 16
    ;
    
    
    ;mov     ebx, dword [esp - 4] ;0
    ;mov     eax, dword [esp - 8] ;1  esp - 12 = 7
    ;add     ebx, eax
    ;
_for:    
    ;push    ecx
    ;jmp     _clen
_jmpback:
    ;push    ebx
    ;push    message
    ;call    _printf
    ;add     esp, 4
    ;pop     ebx
    ;pop     ecx
    ;loop    _for, ecx
    ;pop     ecx
    ret
    
    
_func1:
    push    ebp
    mov     ebp, esp
    sub     esp, 4
    
    push    ebx
    push    esi
    push    edx
    
    mov     esi, [ebp + 8]
    sub     esi, 1
    
    

    push    esi
    push    message
    ;call    _printf
    add     esp, 8
    

    mov     ebx, [ebp + 16] ;1
    push    ebx
    mov     edx, [ebp + 12] ;7
    push    edx
    mov     edx, [ebp + 20] ;0
    add     ebx, edx
    push    ebx
    cmp     esi, 0
    je      _true
_false:
    push    esi
    call    _func1
    add     esp, 24
    jmp     _ret
_true:
    push    ebx
    push    message
    call    _printf
    add     esp, 24
_ret:    
    pop     edx
    pop     esi
    pop     ebx
    mov     esp, ebp
    pop     ebp
    ret
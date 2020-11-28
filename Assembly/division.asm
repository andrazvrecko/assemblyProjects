 global  _main
    extern  _printf
    extern  _scanf

    section .data
    
message:  db  '%d',10, 0 ;za izpis stevil
formatin: db "%d", 0 ;input
message1: db "Vpisite stevilo: ",10, 0 
integer1: times 4 db 0 ; 32-bits integer = 4 bytes
divider1: times 4 db 11; 
       section .text

_printDiv11:
    push     ebx;
    push    message
    call    _printf
    add     esp,8
    jmp     _jumpback   
       
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
    ;
    ;mov     ecx, 3
    mov     edx, 1
    mov     ecx, dword [integer1]
    mov     ebx, 11
_for:
    push    ecx
    push    edx
    push    message
    ;call    _printf
    add     esp, 4
    pop     edx
    pop     ecx
    ;
    push    eax
    push    edx
    push    ecx
    push    ebx
    mov     eax, edx
    mov     ebx, edx
    mov     edx, 0
    mov     ecx, 11
    div     ecx
    ;
    cmp     edx, 0
    je      _printDiv11
_jumpback:
    ;
    push    edx
    push    message
    ;call    _printf
    add     esp, 8

    ;
    pop     ebx
    pop     ecx
    pop     edx
    pop     eax
    ;
    add     edx, 1
    loop    _for, ecx
    ret

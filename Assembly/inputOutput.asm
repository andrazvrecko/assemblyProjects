 global  _main
    extern  _printf
    extern  _scanf

    section .data
    
message:  db  '%d',10, 0
formatin: db "%d", 0
message1: db "Vpisite stevilo: ",10, 0
integer1: times 4 db 4 ; 32-bits integer = 4 bytes
 
       section .text
_main:
    mov     ebp, esp
    push    message1
    call    _printf
    add     esp, 4
    ;
    push    integer1
    push    formatin
    call    _scanf
    add     esp, 8
    ;
    ;mov     ecx, 3
    mov     edx, 1
    mov     ecx, dword [integer1]
_for:
    push    ecx
    push    edx
    push    message
    call    _printf
    add     esp, 4
    pop     edx
    pop     ecx
    add     edx, 1
    loop    _for, ecx
    ret

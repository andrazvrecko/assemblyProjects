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

jmp1:
    mov eax, ebx
    jmp jback

jmp2:
    mov eax, ecx
    jmp jback

jmp3:
    push eax
    push    message
    call    _printf
    add     esp, 4
    pop eax
    jmp     jback2
jmp4:
    push edx
    push    message
    call    _printf
    add     esp, 4
    pop edx
    jmp     jback2
    
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
    mov ebx, dword[integer1]
    push    integer1 
    push    formatin
    call    _scanf
    add     esp, 8
    mov esi, dword[integer1]
    push    integer1 
    push    formatin
    call    _scanf
    add     esp, 8
    mov ecx, dword[integer1]
    mov edx, esi
    push ecx
    push ebx
    push edx
    
    call _func1
    add esp, 12
    ret
    
    ;
    ;mov ecx, 16
    ;mov ebx, 117
    ;mov edx, 13
    ;
    cmp ebx, ecx
    jge jmp1
    jle jmp2
    ;
;jback:
    cmp eax, edx
    jge jmp3
    jle jmp4


_func1:
    push    ebp
    mov     ebp, esp
    sub     esp, 4
    
    push    edi
    push    esi

    
    mov     ebx, [ebp + 8]
    mov     ecx, [ebp + 16] ;1
    mov     edx, [ebp + 12] ;7

    cmp ebx, ecx
    jge jmp1
    jle jmp2
    ;
jback:
    cmp eax, edx
    jge jmp3
    jle jmp4
jback2:
_ret:    
    mov     esp, ebp
    pop     ebp
    ret

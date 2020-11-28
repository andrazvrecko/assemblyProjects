
global _main
    extern  _printf
    extern  _scanf
section .data
    izpis: db "%d", 10, 0
    array: dd 1,2,3,4,5
section .text

_main:
    mov ebp, esp; for correct debugging

_izpis:
    push dword 5
    push dword array
    call _func1
    add esp, 8
    ret
    
    
    
    
_func1:
    push    ebp
    mov     ebp, esp
    sub     esp, 4
    
    mov     ebx, [ebp + 12]
    mov     edx, [ebp + 8]
    ;pretvorba polja
loop2:
    ;mov     ax, [esi + edi*4]
    mov     ax, 0 ;ini ax
    mov     si, ax; ini si
    mov     di, ax; ini di
    
    
    lea     si, [edx + 0*4]
    cld
    lodsb ;iz si v ax
    
    lea     si, [edx + 4*4]
    lea     di, [edx + 0*4]
    cld
    movsb ;iz si v ds
    
    
    lea     di, [edx + 4*4]
    cld
    stosb; iz al v di
    
    ;
    
    lea     si, [edx + 1*4]
    cld
    lodsb ;iz ds v ax
    
    lea     si, [edx + 3*4]
    lea     di, [edx + 1*4]
    cld
    movsb ;iz si v ds


    lea     di, [edx + 3*4]
    cld
    stosb; iz al v di
    
    
    ;izpis polja
    mov     edi, 0
    mov     ebx, [ebp + 12]
    mov     esi, edx
loop1:
    mov     eax, [esi + edi*4]
    push    eax
    push    izpis
    call    _printf
    add     esp, 8
    add     edx, 1
    sub     ebx, 1
    add     edi, 1
    cmp     ebx, 0
    jg      loop1
   
    mov     esp, ebp
    pop     ebp
    ret

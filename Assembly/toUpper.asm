
global _main
    extern  _printf
    extern  _scanf
section .data
    izpis: db "%d", 10, 0
    string: db "nbkdjsadsa", 10, 0
    len: equ $-string

section .bss    
    string2: resb 20   

section .text

_main:     
    pushad    
    mov    ecx, len
    mov    esi, string
    mov    edi, string2      
    push    ecx
    push    esi
    push    edi
    call _func1
    add esp, 12
    popad
    
    ;mov eax, 1
    ;int 0x80
    ret

_func1:
    push    ebp
    mov     ebp, esp
    sub     esp, 4
    
    mov     ecx, [ebp + 16]
    mov     esi, [ebp + 12]
    mov     edi, [ebp + 8]
   
   cld
	
loop1:
   lodsb
   cmp      al,'a'
   jb       jback
   cmp      al,'z'
   ja       jback
   and     al, ~0x20
   jback:
   stosb
   loop    loop1	
   
   ;cld
   ;rep	movsb
	
   ;mov	edx,     20	        ;message length
   ;mov	ecx,     string2	;message to write
   ;mov	ebx,     1   	        ;file descriptor (stdout)
   ;mov	eax,     4	        ;system call number (sys_write)
   ;int	0x10	                ;call kernel
	



    push string2
    call _printf
    add esp, 4
    
    mov     esp, ebp
    pop     ebp
    ret
    
    
    
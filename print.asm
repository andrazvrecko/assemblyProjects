 global  _main
    extern  _printf

    section .data
message:
db  'Andraz Vrecko, E1100230', 10, 0
    section .text
_main:

    push    message
    call    _printf
    add     esp, 4
    ret

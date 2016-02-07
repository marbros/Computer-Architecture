section .bss

buffer resb 512
section .data

dMay1: db 64,64,64,64,64,64,64,64
dMay2: db 94,94,94,94,94,94,94,94
dMin1: db 96,96,96,96,96,96,96,96
dMin2: db 123,123,123,123,123,123,123,123
d0: db 32,32,32,32,32,32,32,32
compa: db 'l'
text db "Too much arguments, try again...", 0
textlen equ $ - text

section .text

global _start

_start:
    mov  eax,2
    pop  ebx
    cmp  eax,ebx
    je   _minus
    jl   _tooArgu

_mayus:
    mov ebx, 0 
    mov eax, 3
    mov ecx, buffer
    mov edx, 512
    int 0x80

    cmp     eax, 0
    je      _exit
    
    mov esi,eax
    mov esp,0
    
_cicloMayus:
    
    movups  xmm1,[dMin1]
    movups  xmm2,[dMin2]
    movups  xmm3,[d0]

    mov eax,esp
    mov ebp,8
    mul ebp
    movups  xmm0,[buffer+eax]
    movups  xmm4,xmm0
    pcmpgtb xmm2,xmm0
    pcmpgtb xmm4,xmm1
    pand    xmm4,xmm2
    pand    xmm4,xmm3
    psubb   xmm0,xmm4
    movups  [buffer+eax],xmm0

    cmp esp,64
    jge _outMayus
    inc esp
    jmp _cicloMayus
 
_outMayus:
    mov edx, esi
    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, buffer
    int 0x80
    jmp _mayus

_minus:
    mov ebx, 0 
    mov eax, 3
    mov ecx, buffer
    mov edx, 512
    int 0x80

    cmp     eax, 0
    je      _exit
    
    mov esi,eax
    mov esp,0
    
_cicloMinus:
    
    movups  xmm1,[dMay1]
    movups  xmm2,[dMay2]
    movups  xmm3,[d0]

    mov eax,esp
    mov ebp,8
    mul ebp
    movups  xmm0,[buffer+eax]
    movups  xmm4,xmm0
    pcmpgtb xmm2,xmm0
    pcmpgtb xmm4,xmm1
    pand    xmm4,xmm2
    pand    xmm4,xmm3
    paddb   xmm0,xmm4
    movups  [buffer+eax],xmm0

    cmp esp,64
    jge _outMinus
    inc esp
    jmp _cicloMinus
 
_outMinus:
    mov edx, esi
    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, buffer
    int 0x80
    jmp _minus

_tooArgu:
    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, text
    mov edx, textlen
    int 0x80
    jmp _exit

_exit:
    mov     eax,    1
    mov     ebx,    0
    int     80h
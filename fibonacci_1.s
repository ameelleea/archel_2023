.data
fib: .space 64    ;array
n:   .word 8      ;numero di elementi

.code           
start:
    LD r1, n(r0)        ;contatore
    DADDI r2, r0, fib   ;puntatore primo elemento
   
    DADDI r3, r0, 1     ;a[0] = 1
    DADDI r4, r0, 1     ;a[1] = 1 
    DADDI r1, r1, -2    ;aggiornamento contatore 
    SD r3, 0(r2)        ;allocare il risultato  
    SD r4, 8(r2)        ;allocare il risultato
    DADDI r2, r2, 16    ;aggiornamento puntatore

loop2: 
    LD r3, -16(r2)      ;caricamento a[1-2] 
    DADD r4, r4, r3     ;a[i-1] + a[i-2] 
    DADDI r1, r1, -1    ;aggiornamento contatore 
    SD r4, 0(r2)        ;allocazione a[i]
    DADDI r2, r2, 8     ;aggiornamento puntatore
    BNEZ r1, loop2

end: 
    HALT
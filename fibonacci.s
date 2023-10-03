.data
fib: .space 64    ;array
n:   .word 8      ;numero di elementi

.code           
start:
    LD r1, n(r0)        ;contatore
    DADDI r2, r0, fib   ;puntatore primo elemento

loop:
    SLTI r3, r1, 7      ;i <= 1    
    BNEZ r3, loop2      
    DADDI r5, r0, 1     ;a[i] = 1 
    SD r5, 0(r2)        ;allocare il risultato
    DADDI r1, r1, -1    ;aggiornamento contatore
    DADDI r2, r2, 8     ;aggiornamento puntatore
    BNEZ r1, loop

loop2: 
    LD r4, -16(r2)      ;caricamento a[i-2]
    DADD r5, r5, r4     ;a[i-1] + a[i-2]
    SD r5, 0(r2)        ;allocazione risultato
    DADDI r1, r1, -1    ;aggiornamento contatore 
    DADDI r2, r2, 8     ;aggiornamento puntatore
    BNEZ r1, loop2

end: 
    HALT
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
    DADD r5, r3, r4     ;a[i] = a[i-1] + a[i-2]
    DADDI r1, r1, -3    ;aggiornamento contatore
    DADD r3, r5, r4     ;a[i+1] = a[i] + a[i-1]
    SD r5, 0(r2)        ;allocazione a[i] 
    DADD r4, r5, r3     ;a[i+2] = a[i+1] + a[i] 
    SD r3, 16(r2)       ;allocazione a[i+1] 
    SD r4, 8(r2)        ;allocazione a[i+2]
    DADDI r2, r2, 24    ;aggiornamento puntatore
    BNEZ r1, loop2

end: 
    HALT
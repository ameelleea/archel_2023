.data
fib: .space 64    ;array
n:   .word 8      ;numero di elementi

.code           
start:
    DADDI r2, r0, fib   ;puntatore primo elemento
   
    DADDI r3, r0, 1     ;a[0] = 1
    DADDI r4, r0, 1     ;a[1] = 1 
    
    DADD r5, r4, r3     ;a[2] = a[1] + a[0]
    SD r3, 0(r2)        ;allocazione a[0]
    SD r4, 8(r2)        ;allocazione a[1] 
    DADD r6, r5, r4     ;a[3] = a[2] + a[1]
    SD r5, 16(r2)       ;allocazione a[2] 
    DADD r7, r6, r5     ;a[4] = a[3] + a[2]
    SD r6, 24(r2)       ;allocazione a[3]
    SD r7, 32(r2)       ;allocazione a[4] 
    DADD r8, r7, r6     ;a[5] = a[4] + a[3]
    DADD r9, r8, r7     ;a[6] = a[5] + a[4]
    DADD r10, r9, r8    ;a[7] = a[6] + a[5]
    SD r8, 40(r2)       ;allocazione a[5]  
    SD r9, 48(r2)       ;allocazione a[6]
    SD r10, 56(r2)      ;allocazione a[7] 

end: 
    HALT
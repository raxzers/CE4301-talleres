start:
    li a1,0x56         # valor_semilla 0x56 en el registro a1
    li a2,0x100        # mem_pos 0x100 en el registro a2
    sw a1,0(a2)        # se guarda la semilla en memoria usando a2 
    li a3,0x0          # contador en 0 en el registro a3
    li a4,0x64         # numero maximo 0x64=100 en el registro a4
lsfr:
    li a0,0x80         #mascara al bit8
    and t1,a0,a1
    srli t0,t1,0x7      # [t0] <- [lsfr_value] >> 2 (pos 8)
    
    li a0,0x20        #mascara al bit6
    and t1,a0,a1
    srli t1,t1,0x5      # [t1] <- [lsfr_value] >> 3 (pos 5)
    xor t2,t1,t0        # [t2] <- [t1] ^ [t0] : [b6] xor [b5]
    
    li a0,0x10     
    and t1,a0,a1
    srli t1,t1,0x4
    xor t2,t1,t2
    
    li a0,0x04
    and t1,a0,a1
    srli t1,t1,0x3
    xor t2,t1,t2
    
    slli a1,a1,0x19
    srli a1,a1,0x18
    add a1,t2,a1

check:
    addi a3,a3,0x1      # contador+1
    addi a2,a2,0x4      # mem_pos + 4
    sw a1,0(a2)         # se guarda el nuevo valor en memoria usando mem_pos
    blt a3,a4,lsfr      # if (contador < contadormaximo): salte a lsfr
    j end               # else: salte a end


end:
    nop                  # fin de algoritmo

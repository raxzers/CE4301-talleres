start:
    li a1,0x56         # [a1] <- 0x56 : lsfr_valor 
    li a2,0x100         # [a2] <- 0x100 : mem_pos
    sw a1,0(a2)         # 0x56 -> M[0x100] 
    li a3,0x0           # [a3] <- 0x0 : counter
    li a4,0x64          # [a4] <- 0x64 : stop_count(100)
lsfr:
    li a0,0x80        #mascara al bit8
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
     slli t2,t2,0x7
     srli a1,a1,0x1
     add a1,t2,a1

check:
    addi a3,a3,0x1      # counter = counter + 1
    addi a2,a2,0x4      # mem_pos = mem_pos + 4
    sw a1,0(a2)         # [lsfr_value] -> M[mem_pos]
    blt a3,a4,lsfr      # counter < stop_count? -> lsfr
    j end               # else: go to end


end:
    nop                  # end algorithm

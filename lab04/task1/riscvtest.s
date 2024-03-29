# riscvtest.s
# Sarah.Harris@unlv.edu
# David_Harris@hmc.edu
# 27 Oct 2020
#
# Test the RISC-V processor.  
#  add, sub, and, or, slt, addi, lw, sw, beq, jal
# If successful, it should write the value 25 to address 100

#       RISC-V Assembly         Description               Address    
main:     addi x2, x0, 5          # x2 = 5                   0       
          addi x3, x0, 12         # x3 = 12                  4       
          addi x7, x3, -9         # x7 = (12 - 9) = 3        8       
          or   x4, x7, x2         # x4 = (3 OR 5) = 7        C       
          and  x5, x3, x4         # x5 = (12 AND 7) = 4      10      
          add  x5, x5, x4         # x5 = (4 + 7) = 11        14      
          beq  x5, x7, end        # shouldn't be taken       18      
          slt  x4, x3, x4         # x4 = (12 < 7) = 0        1C      
          bne  x4, x0, myLabel    # shouldn't be taken       20
          beq  x4, x0, around     # should be taken          24      
          addi x5, x0, 0          # shouldn't happen         28      
around:   slt  x4, x7, x2         # x4 = (3 < 5)  = 1        2C      
          add  x7, x4, x5         # x7 = (1 + 11) = 12       30      
          sub  x7, x7, x2         # x7 = (12 - 5) = 7        34      
          sw   x7, 84(x3)         # [96] = 7                 38      
          lw   x2, 96(x0)         # x2 = [96] = 7            3C      
          add  x9, x2, x5         # x9 = (7 + 11) = 18       40      
          bne  x9, x2, myLabel    # 18 != 7 should be taken  44
          addi x4, x0, 0          # shouldn't happen         48
myLabel:  jal  x3, end            # jump to end, x3 = 0x50?  4C      
          addi x2, x0, 1          # shouldn't happen         50      
end:      add  x2, x2, x9         # x2 = (7 + 18)  = 25      54      
          sw   x2, 0x20(x3)       # mem[112] = 25            58      
done:     beq  x2, x2, done       # infinite loop            5C      
		
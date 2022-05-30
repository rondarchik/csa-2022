# 10 - Довгун Виктория Александровна	1
# Реализуйте функцию вычисления факториала. Эта функция принимает один целочисленный параметр n и возвращает n!.

.globl iterative
.globl recursive

.data
n: .word 5

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, tester

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

tester:
    addi sp, sp, -8
    sw x10, 4(sp)
    sw x1, 0(sp)

	jal x1, iterative
	addi x7, t0, 0

	jal x1, recursive

	beq x7, x10, finish_test
	addi a0, x0, 10
	ecall

	finish_test:
        lw ra, 0(sp)
        addi sp, sp, 8
        jr ra

iterative:
    addi t0, zero, 1 # temp = 1
    blt a0, t1, else # если n < 1

    li x6, 1 # int i = 1
    mv x5, a0
    loop:
        mul x5, x6, x5 # a0 = a0*i
        addi x6, x6, 1 # i++
        blt x6, a0, loop # if (i <= N)

	jr ra
    
recursive:
    addi sp, sp, -8
    sw x1, 4(sp)
    sw x10, 0(sp)

    addi x5, x10, -1 
    bgt x5, x0, else 

    addi x10, zero, 1
    addi sp, sp, 8
    jr x1

else:
    addi x10, x10, -1
    jal x1, recursive
    addi x6, x10, 0
    lw x10, 0(sp)
    lw x1, 4(sp)
    addi sp, sp, 8
    mul x10, x10, x6

    jr x1



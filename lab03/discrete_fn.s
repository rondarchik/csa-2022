# 10	Довгун Виктория Александровна	1	

.globl f

.data
case1:   .asciiz "f(-3) should be 6, and it is: "
case2:   .asciiz "f(-2) should be 61, and it is: "
case3:   .asciiz "f(-1) should be 17, and it is: "
case4:   .asciiz "f(0) should be -38, and it is: "
case5:   .asciiz "f(1) should be 19, and it is: "
case6:   .asciiz "f(2) should be 42, and it is: "
case7:   .asciiz "f(3) should be 5, and it is: "

output: .word   6, 61, 17, -38, 19, 42, 5

.text
main:
	######### перебор случаев, случай 1 (case1) #########
    la a0, case1 
    jal print_str 
    li a0, -3 
    la a1, output
    # выполняем f(case1)
    jal f     
    jal print_int
    jal print_newline

	######### перебор случаев, случай 2 (case2) #########
    la a0, case2
    jal print_str
    li a0, -2
    la a1, output
    jal f                
    jal print_int
    jal print_newline

	######### перебор случаев, случай 3 (case3) #########
    la a0, case3
    jal print_str
    li a0, -1
    la a1, output
    jal f               
    jal print_int
    jal print_newline

	######### перебор случаев, случай 4 (case4) #########
    la a0, case4
    jal print_str
    li a0, 0
    la a1, output
    jal f               
    jal print_int
    jal print_newline

	######### перебор случаев, случай 5 (case5) #########
    la a0, case5
    jal print_str
    li a0, 1
    la a1, output
    jal f                
    jal print_int
    jal print_newline

	######### перебор случаев, случай 6 (case6) #########
    la a0, case6
    jal print_str
    li a0, 2
    la a1, output
    jal f               
    jal print_int
    jal print_newline

	######### перебор случаев, случай 7 (case7) #########
    la a0, case7
    jal print_str
    li a0, 3
    la a1, output
    jal f                
    jal print_int
    jal print_newline

	
    li a0, 10
    ecall

# f принимает два аргумента:
# a0 значение для которого мы хотим вычислить функцию f
# a1 адрес выходного ("output") массива, содержащего все допустимые варианты.
f:
    slli a2, a0, 2 
    addi a2, a2, 12
    add a2, a2, a1 
    lw a0, 0(a2) 
    jr ra               


# печатает одно целое число
# вход: a0: число на печать
# ничего не возвращает
print_int:
    mv a1, a0
    li a0, 1
    ecall
    jr    ra


# печатает строку
print_str:
    mv a1, a0
    li a0, 4 
    ecall
    jr    ra


print_newline:
    li a1, '\n'
    li a0, 11
    ecall
    jr    ra
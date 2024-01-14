.data
endl: .asciiz "\n"
str0: .asciiz "hello"
str1: .asciiz " world"
.text
main:
li $t1, 0
sw $t1, 0($sp)

lw $t1, 0($sp)
move $a0, $t1
jal printInt
la $a0, endl
jal printString

li $t1, 1
move $t2, $t1
sw $t2, 0($sp)

lw $t1, 0($sp)
move $a0, $t1
jal printInt
la $a0, endl
jal printString

li $t1, 2
move $t2, $t1
sw $t2, 0($sp)

lw $t1, 0($sp)
lw $t2, 0($sp)
li $t3, 0
mul $t3, $t1, $t2
li $t4, 3
li $t5, 0
mul $t5, $t3, $t4
move $t6, $t5
sw $t6, 0($sp)

lw $t1, 0($sp)
move $a0, $t1
jal printInt
la $a0, endl
jal printString

li $t1, 6
sw $t1, 4($sp)

lw $t1, 4($sp)
li $t2, 7
li $t3, 0
mul $t3, $t1, $t2
li $t4, 32
move $a0, $t3
jal printInt
move $a0, $t4
jal printInt
la $a0, endl
jal printString

lw $t1, 0($sp)
lw $t2, 4($sp)
li $t3, 0
mul $t3, $t1, $t2
sw $t3, 8($sp)

lw $t1, 8($sp)
move $a0, $t1
jal printInt
la $a0, endl
jal printString

la $t1, str0
move $t2, $t1
sw $t2, 12($sp)

la $t1, str1
move $t2, $t1
sw $t2, 16($sp)

lw $t1, 12($sp)
lw $t2, 16($sp)
move $a0, $t1
jal printString
move $a0, $t2
jal printString
la $a0, endl
jal printString

li $v0, 10
syscall

# Esta sección es añadida automáticamente por el compilador y contiene funciones usadas
# Internamente.

readInt:
    li $v0, 5  # read_int syscall
    syscall
    jr $ra

readFloat:
    li $v0, 6  # read_float syscall
    syscall
    jr $ra

printString:
    li $v0, 4  # print_string syscall
    syscall
    jr $ra

printInt:
    li $v0, 1  # print_int syscall
    syscall
    li $v0, 4  # print_string syscall
    jr $ra

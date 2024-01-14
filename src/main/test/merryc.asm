.data
endl: .asciiz "\n"
.text
main:
li $t1, 1
sw $t1, 0($sp)

li $t1, 2
sw $t1, 4($sp)

lw $t1, 0($sp)
lw $t2, 4($sp)
li $t3, 0
add $t3, $t1, $t2
li $t4, 4
li $t5, 0
add $t5, $t3, $t4
move $a0, $t5
jal printInt
la $a0, endl
jal printString

lw $t1, 0($sp)
lw $t2, 4($sp)
li $t3, 0
add $t3, $t1, $t2
sw $t3, 8($sp)

li $t1, 17
move $t2, $t1
sw $t2, 0($sp)

lw $t1, 8($sp)
move $a0, $t1
jal printInt
la $a0, endl
jal printString

lw $t1, 8($sp)
lw $t2, 0($sp)
li $t3, 0
add $t3, $t1, $t2
lw $t4, 8($sp)
lw $t5, 0($sp)
li $t6, 0
add $t6, $t4, $t5
li $t7, 4
li $t8, 0
add $t8, $t6, $t7
move $a0, $t3
jal printInt
move $a0, $t8
jal printInt
la $a0, endl
jal printString

li $t1, 1
lw $t2, 0($sp)
li $t3, 0
sub $t3, $t1, $t2
li $t4, 24
li $t5, 0
add $t5, $t3, $t4
sw $t5, 12($sp)

lw $t1, 12($sp)
li $t2, -16
li $t3, 0
sub $t3, $t1, $t2
move $a0, $t3
jal printInt
la $a0, endl
jal printString

li $t1, 1
li $t2, 10
li $t3, 2
li $t4, 0
div $t2, $t3
mflo $t4
li $t5, 0
add $t5, $t1, $t4
move $a0, $t5
jal printInt
la $a0, endl
jal printString

li $t1, 1
li $t2, 2
li $t3, 3
li $t4, 0
mul $t4, $t2, $t3
li $t5, 0
add $t5, $t1, $t4
move $a0, $t5
jal printInt
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

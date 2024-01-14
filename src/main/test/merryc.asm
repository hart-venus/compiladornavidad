.data
endl: .asciiz "\n"
str0: .asciiz "y Adios mundo"
str1: .asciiz "Hola mundo "
str2: .asciiz " once told me "
.text
main:
li $t1, 2
sw $t1, 0($sp)

li $t1, 0
sw $t1, 4($sp)

la $t1, endl
sw $t1, 8($sp)

la $t1, str0
move $t2, $t1
sw $t2, 12($sp)

lw $t1, 8($sp)
move $a0, $t1
jal printString
la $a0, endl
jal printString

la $t1, str1
move $t2, $t1
sw $t2, 8($sp)

lw $t1, 8($sp)
lw $t2, 12($sp)
la $t3, str2
lw $t4, 0($sp)
move $a0, $t1
jal printString
move $a0, $t2
jal printString
move $a0, $t3
jal printString
move $a0, $t4
jal printInt
la $a0, endl
jal printString

li $t1, 3
move $t2, $t1
sw $t2, 0($sp)

lw $t1, 0($sp)
lw $t2, 4($sp)
move $a0, $t1
jal printInt
move $a0, $t2
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

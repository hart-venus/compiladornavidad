.data
endl: .asciiz "\n"
str0: .asciiz "Hola mundo"
str1: .asciiz "Adios mundo, "
str2: .asciiz "hola Marte."
str3: .asciiz "pero, "
.text
main:
    la $t1, str0
    move $t0, $t1
    sw $t0, 0($sp)

    lw $t1, 0($sp)
    move $a0, $t1
    jal printString
    la $a0, endl
    jal printString

la $t1, str1
move $t0, $t1
sw $t0, 0($sp)

la $t1, str2
move $t0, $t1
sw $t0, 4($sp)

lw $t1, 0($sp)
la $t2, str3
lw $t3, 4($sp)
move $a0, $t1
jal printString
move $a0, $t2
jal printString
move $a0, $t3
jal printString
la $a0, endl
jal printString

li $v0, 10
syscall
_add:

lw $t1, null


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

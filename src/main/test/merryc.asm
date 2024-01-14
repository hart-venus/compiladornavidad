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
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

li $t1, 1
move $t2, $t1
sw $t2, 0($sp)

lw $t1, 0($sp)
move $a0, $t1
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

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
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

li $t1, 6
sw $t1, 4($sp)

lw $t1, 4($sp)
li $t2, 7
li $t3, 0
mul $t3, $t1, $t2
li $t4, 32
move $a0, $t3
li $v0, 1
syscall
move $a0, $t4
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

lw $t1, 0($sp)
lw $t2, 4($sp)
li $t3, 0
mul $t3, $t1, $t2
sw $t3, 8($sp)

lw $t1, 8($sp)
move $a0, $t1
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

la $t1, str0
move $t2, $t1
sw $t2, 12($sp)

la $t1, str1
move $t2, $t1
sw $t2, 16($sp)

lw $t1, 12($sp)
lw $t2, 16($sp)
move $a0, $t1
li $v0, 4
syscall
move $a0, $t2
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

li $t1, 1
li $t2, 2
li $t3, 0
add $t3, $t1, $t2
li $t4, 2
li $t5, 0
mul $t5, $t3, $t4
sw $t5, 20($sp)

li $t1, 1
li $t2, 2
li $t3, 2
li $t4, 0
mul $t4, $t2, $t3
li $t5, 0
add $t5, $t1, $t4
move $t6, $t5
sw $t6, 8($sp)

lw $t1, 20($sp)
move $a0, $t1
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

lw $t1, 8($sp)
move $a0, $t1
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

li $t1, 15
li $t2, 4
li $t3, 0
div $t1, $t2
mfhi $t3
sw $t3, 24($sp)

lw $t1, 24($sp)
move $a0, $t1
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

li $t1, 10
li $t2, 3
li $t3, 0
div $t1, $t2
mfhi $t3
li $t4, 2
li $t5, 0
div $t3, $t4
mfhi $t5
move $t6, $t5
sw $t6, 24($sp)

lw $t1, 24($sp)
move $a0, $t1
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

li $t1, 60
li $t2, 13
li $t3, 0
div $t1, $t2
mfhi $t3
move $a0, $t3
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

li $t1, 2
li $t2, 3
move $a0, $t1
move $a1, $t2
addi $sp, $sp, -4
sw $ra, 0($sp)
jal expInt
move $t3, $v0
lw $ra, 0($sp)
addi $sp, $sp, 4
li $t4, 2
li $t5, 0
add $t5, $t3, $t4
move $a0, $t5
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

li $t1, 2
li $t2, 3
move $a0, $t1
move $a1, $t2
addi $sp, $sp, -4
sw $ra, 0($sp)
jal expInt
move $t3, $v0
lw $ra, 0($sp)
addi $sp, $sp, 4
li $t4, 2
li $t5, 0
add $t5, $t3, $t4
move $t6, $t5
sw $t6, 0($sp)

lw $t1, 0($sp)
li $t2, 2
li $t3, 0
div $t1, $t2
mfhi $t3
move $a0, $t3
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

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

expInt: # calcula $a0 ** $a1
    # guardar $t0, $t1
    addi $sp, $sp, -8
    sw $t0, 0($sp)
    sw $t1, 4($sp)
    
    move $t0, $a0 # base
    move $t1, $a1 # exponente
    li $v0, 1 # resultado

    beq $t1, 0, expEnd # si $t1 == 0, salta a expEnd

    expLoop:
        mul $v0, $v0, $t0 # $v0 = $v0 * $t0
        sub $t1, $t1, 1 # $t1 = $t1 - 1
        bgtz $t1, expLoop # si $t1 > 0, salta a expLoop
    expEnd:
        # restaurar $t0, $t1
        lw $t0, 0($sp)
        lw $t1, 4($sp)
        addi $sp, $sp, 8

        jr $ra # retorna

.data
endl: .asciiz "\n"
fzero: .float 0.0
str0: .asciiz "ho ho ho"
float1: .float 2.718281828459045
float2: .float 3.14
float3: .float 3.14
float4: .float 3.14
float5: .float 2.5
float6: .float 1.0
str7: .asciiz "z = "
float8: .float -6.0
float9: .float 3.14
float10: .float 1.0
float11: .float 2.0
float12: .float 10.0
float13: .float 2.0
float14: .float 5.5
float15: .float 2.0
.text
main:
la $t0, str0
move $t1, $t0
sw $t1, 0($sp)

lw $t0, float1
sw $t0, 4($sp)

li $t0, 3

lw $t0, 4($sp)
mtc1 $t0, $f12
li $v0, 2
syscall
la $a0, endl
li $v0, 4
syscall

lw $t0, float2
move $t1, $t0
sw $t1, 4($sp)

lw $t0, float3

lw $t0, float4
li $t1, 2

lw $t0, float5
lw $t1, float6
mtc1 $t0, $f0
mtc1 $t1, $f2
add.s $f0, $f0, $f2
mfc1 $t2, $f0
sw $t2, 8($sp)

la $t0, str7
lw $t1, 8($sp)
move $a0, $t0
li $v0, 4
syscall
mtc1 $t1, $f12
li $v0, 2
syscall
la $a0, endl
li $v0, 4
syscall

lw $t0, float8
move $t1, $t0
sw $t1, 8($sp)

lw $t0, float9
lw $t1, float10
lw $t2, float11
mtc1 $t1, $f0
mtc1 $t2, $f2
div.s $f0, $f0, $f2
mfc1 $t3, $f0
mtc1 $t0, $f3
mtc1 $t3, $f4
div.s $f3, $f3, $f4
mfc1 $t4, $f3
lw $t5, 8($sp)
mtc1 $t4, $f5
mtc1 $t5, $f6
add.s $f5, $f5, $f6
mfc1 $t6, $f5
lw $t7, float12
mtc1 $t6, $f7
mtc1 $t7, $f8
mul.s $f7, $f7, $f8
mfc1 $t8, $f7
lw $t9, float13
mtc1 $t8, $f9
mtc1 $t9, $f10
div.s $f9, $f9, $f10
mfc1 $t0, $f9
mtc1 $t0, $f12
li $v0, 2
syscall
la $a0, endl
li $v0, 4
syscall

li $t0, 3
li $t1, 3
li $t2, 2
li $t3, 0
div $t1, $t2
mflo $t3
li $t4, 0
div $t0, $t3
mflo $t4
li $t5, -6
li $t6, 0
add $t6, $t4, $t5
li $t7, 10
li $t8, 0
mul $t8, $t6, $t7
li $t9, 2
li $t0, 0
div $t8, $t9
mflo $t0
move $a0, $t0
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

lw $t0, float14
lw $t1, float15
move $a0, $t0
move $a1, $t1
addi $sp, $sp, -4
sw $ra, 0($sp)
jal moduloFloat
move $t2, $v0
lw $ra, 0($sp)
addi $sp, $sp, 4
mtc1 $t2, $f12
li $v0, 2
syscall
la $a0, endl
li $v0, 4
syscall

li $t0, 2
li $t1, -1
move $a0, $t0
move $a1, $t1
addi $sp, $sp, -4
sw $ra, 0($sp)
jal expInt
move $t2, $v0
lw $ra, 0($sp)
addi $sp, $sp, 4
move $a0, $t2
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

li $t0, -1
li $t1, -1
move $a0, $t0
move $a1, $t1
addi $sp, $sp, -4
sw $ra, 0($sp)
jal expInt
move $t2, $v0
lw $ra, 0($sp)
addi $sp, $sp, 4
move $a0, $t2
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

li $t0, 1
li $t1, -230
move $a0, $t0
move $a1, $t1
addi $sp, $sp, -4
sw $ra, 0($sp)
jal expInt
move $t2, $v0
lw $ra, 0($sp)
addi $sp, $sp, 4
move $a0, $t2
li $v0, 1
syscall
la $a0, endl
li $v0, 4
syscall

li $t0, -2
li $t1, 2
move $a0, $t0
move $a1, $t1
addi $sp, $sp, -4
sw $ra, 0($sp)
jal expInt
move $t2, $v0
lw $ra, 0($sp)
addi $sp, $sp, 4
move $a0, $t2
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

expInt:
    # Salvar $t0, $t1, $t2
    addi $sp, $sp, -12
    sw $t0, 0($sp)
    sw $t1, 4($sp)
    sw $t2, 8($sp)

    move $t0, $a0 # Base
    move $t1, $a1 # Exponente
    li $v0, 1     # Resultado

    # caso especial para 1^x = 1
    li $t2, 1
    beq $t0, $t2, expEnd # si la base es 1, el resultado es 1

    li $t2, -1
    beq $t0, $t2, expNegativeOne # Si la base es -1, manejar caso especial (para exponentes negativos)

    # Si el exponente es negativo, manejar caso especial
    bltz $t1, expNegative 

    # Ciclo regular
    beq $t1, 0, expEnd #  Si el exponente es 0, el resultado es 1 (0^0 = 1 en nuestro caso, aunque es indeterminado)
    expLoop:
        mul $v0, $v0, $t0 # $v0 = $v0 * $t0
        sub $t1, $t1, 1   # $t1 = $t1 - 1
        bgtz $t1, expLoop # Si $t1 > 0, repetir ciclo

        j expEnd

    expNegativeOne:
        # Para exponente negativo y base -1, alternar entre 1 y -1
        andi $t2, $t1, 1    # Ultimo bit del exponente
        beqz $t2, expEnd    # Si es 0, resultado es 1
        li $v0, -1          # Si es 1, resultado es -1
        j expEnd

    expNegative:
        # Para cualquier otro exponente negativo, el resultado es 0
        li $v0, 0

    expEnd:
        # Restaurar $t0, $t1, $t2
        lw $t0, 0($sp)
        lw $t1, 4($sp)
        lw $t2, 8($sp)
        addi $sp, $sp, 12

        jr $ra # Return

moduloFloat: 
    # calcula $a0 % $a1
    # guardar $f0, $f1, $f2, $t0
    addi $sp, $sp, -16
    swc1 $f0, 0($sp)
    swc1 $f1, 4($sp)
    swc1 $f2, 8($sp)
    sw $t0, 12($sp)

    # cargar $a0 y $a1 en $f0 y $f1
    mtc1 $a0, $f0
    mtc1 $a1, $f1

    # $f2 = $f0 / $f1
    div.s $f2, $f0, $f1

    # truncar $f2 convirtiendolo a int y de vuelta
    cvt.w.s $f2, $f2
    mfc1 $t0, $f2
    mtc1 $t0, $f2
    cvt.s.w $f2, $f2

    # $f2 = $f2 * $f1
    mul.s $f2, $f2, $f1
    # $f0 = $f0 - $f2
    sub.s $f0, $f0, $f2

    # guardar valor en $v0
    mfc1 $v0, $f0

    # restaurar $f0, $f1, $f2, $t0
    lwc1 $f0, 0($sp)
    lwc1 $f1, 4($sp)
    lwc1 $f2, 8($sp)
    lw $t0, 12($sp)
    addi $sp, $sp, 16

    jr $ra # retorna


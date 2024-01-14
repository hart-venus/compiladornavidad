
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



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

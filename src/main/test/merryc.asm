.data
endl: .asciiz "\n"
fzero: .float 0.0
fone: .float 1.0
ftwo: .float 2.0
log2: .float 0.69314718055994
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
float16: .float 2.0
float17: .float 0.5
float18: .float 0.04
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

lw $t0, float16
lw $t1, float17
move $a0, $t0
move $a1, $t1
addi $sp, $sp, -4
sw $ra, 0($sp)
jal pow
move $t2, $v0
lw $ra, 0($sp)
addi $sp, $sp, 4
lw $t3, float18
mtc1 $t2, $f0
mtc1 $t3, $f2
add.s $f0, $f0, $f2
mfc1 $t4, $f0
mtc1 $t4, $f12
li $v0, 2
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


log:
    # calcula log(a) en $f0, para a > 0 usando la serie de Taylor
    # a en $f12
    # log(a) = n*log(2) + log(1+x)
    # a = 2^n * (1+x)

    # calcular n
    li $t0, 0 # n
    mov.s $f1, $f12 # a

    # caso especial de a < 1
    lwc1 $f2, fone
    c.lt.s $f1, $f2 # a < 1?
    bc1t casoInverso
    
    logwhile:
        # dividir a por 2 si no está en el rango ]1,2]
        # 1. cargar 2 a un registro de punto flotante
        lwc1 $f2, ftwo
        # 2. comparar a con 2
        c.lt.s $f2, $f1 # 2 < a?
        bc1t logif
        j logwhile_end

    logif:
        # dividir a por 2
        lwc1 $f2, ftwo
        div.s $f1, $f1, $f2 # a/2
        # incrementar n
        addi $t0, $t0, 1
        # repetir
        j logwhile
    
    logwhile_end:
        # guardar n en $f0
        mtc1 $t0, $f0
        cvt.s.w $f0, $f0
        # cargar a en $f12
        mov.s $f12, $f1
        # calcular n*log(2)
        lwc1 $f1, log2
        mul.s $f0, $f0, $f1 # n*log(2)
        mov.s $f4, $f0 # n*log(2)
        # calcular log(1+x)
        # guardar $ra en $s0 
        move $s0, $ra
        # limpiar $f0
        lwc1 $f0, fzero
        # restarle 1 a x
        lwc1 $f1, fone
        sub.s $f12, $f12, $f1 # x-1
        jal log1p
        nop
        # restaurar $ra
        move $ra, $s0
        # sumar n*log(2) + log(1+x)
        add.s $f0, $f0, $f4

    jr $ra

    casoInverso:
        # multiplicar a por 2 si no está en el rango ]1,2]
        # 1. cargar 1 a un registro de punto flotante
        lwc1 $f2, fone
        # 2. comparar a con 1
        c.le.s $f1, $f2 # a <= 1?
        bc1t logif2
        j logwhile_end2
    
    logif2:
        # multiplicar a por 2
        lwc1 $f2, ftwo
        mul.s $f1, $f1, $f2 # a*2
        # incrementar n
        addi $t0, $t0, 1
        # repetir
        j casoInverso

    logwhile_end2:
        # guardar n en $f0
        mtc1 $t0, $f0
        cvt.s.w $f0, $f0
        # cargar a en $f12
        mov.s $f12, $f1
        # calcular n*log(2)
        lwc1 $f1, log2
        mul.s $f0, $f0, $f1 # n*log(2)
        mov.s $f4, $f0 # n*log(2)
        # calcular log(1+x)
        # guardar $ra en $s0
        move $s0, $ra
        # limpiar $f0
        lwc1 $f0, fzero
        # restarle 1 a x
        lwc1 $f1, fone
        sub.s $f12, $f12, $f1 # x-1
        jal log1p
        nop
        # restaurar $ra
        move $ra, $s0
        # restar n*log(2) + log(1+x)
        sub.s $f0, $f0, $f4

    jr $ra

log1p:
    # calcula log(1+x) en $f0, para -1 < x <= 1 usando la serie de Taylor
    # x en $f12
    # log(1+x) = x - x^2/2 + x^3/3 - x^4/4 + ...
    
    li $t0, 1 # n. de término
    mov.s $f1, $f12 # x
    neg.s $f2, $f12 # -x

    series_loop:
        # cargar $t0 (entero) a un registro de punto flotante
        mtc1 $t0, $f3
        cvt.s.w $f3, $f3
        # dividir f1 por f3
        div.s $f1, $f1, $f3 # x^n/n
        # acumular en f0
        add.s $f0, $f0, $f1
        # preparar para el siguiente término
        addi $t0, $t0, 1
        mul.s $f1, $f1, $f2 # x^n/n * (-x)
        li $t1, 30
        blt $t0, $t1, series_loop

    jr $ra

exp:
    # calcula e^x en $f4, para x real usando la serie de Taylor
    # x en $f0
    # e^x = 1 + x + x^2/2! + x^3/3! + x^4/4! + ...

    li $t0, 2 # n. de término
    lwc1 $f1, fone # 1.0
    mov.s $f3, $f0 # x
    mov.s $f4, $f1 # resultado

    exp_loop: 
        add.s $f4, $f4, $f3 # acumular en f4
        # preparar para el siguiente término
        mul.s $f3, $f3, $f0 # x^n * x
        
        mtc1 $t0, $f2
        cvt.s.w $f2, $f2
        div.s $f3, $f3, $f2 # x^n * x / n!
        
        li $t1, 30
        addi $t0, $t0, 1
        blt $t0, $t1, exp_loop
    jr $ra

pow:
    # Guardar espacio para los registros 
    addi $sp, $sp, -28
    # Salvar los registros
    # $f0
    swc1 $f0, 0($sp)
    # $f1
    swc1 $f1, 4($sp)
    # $f2
    swc1 $f2, 8($sp)
    # $f3
    swc1 $f3, 12($sp)
    # $f4
    swc1 $f4, 16($sp)
    # $t0
    sw $t0, 20($sp)
    # $t1
    sw $t1, 24($sp)
    
    # calcula a^b en $f0, para a real y b real
    # a en a0, b en a1
    # a^b = e^(b*log(a))

    # cargar a en $f12
    move $t0, $a0
    mtc1 $t0, $f12

    # caso especial de a = 0
    lwc1 $f1, fzero
    c.eq.s $f12, $f1 # a == 0?
    bc1t pow0

    # salvar mi ra
    move $s1, $ra
    # calcular log(a)
    jal log
    # ahora $f0 tiene log(a)
    # cargar b en $f1 
    move $t0, $a1
    mtc1 $t0, $f1
    # multiplicar b*log(a)
    mul.s $f0, $f0, $f1
    # calcular e^(b*log(a))
    jal exp
    # restaurar mi ra
    move $ra, $s1
    # restaurar $f0
    mov.s $f0, $f4

    j powexit

pow0:
    # retornar 0
    lwc1 $f0, fzero

powexit:
    # mover $f0 a $v0 para retornar
    mfc1 $v0, $f0
    # Restaurar los registros
    # $f0
    lwc1 $f0, 0($sp)
    # $f1
    lwc1 $f1, 4($sp)
    # $f2
    lwc1 $f2, 8($sp)
    # $f3
    lwc1 $f3, 12($sp)
    # $f4
    lwc1 $f4, 16($sp)
    # $t0
    lw $t0, 20($sp)
    # $t1
    lw $t1, 24($sp)
    # Restaurar el espacio del stack
    addi $sp, $sp, 28
    jr $ra

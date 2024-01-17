.data
endl: .asciiz "\n"
fzero: .float 0.0
fone: .float 1.0
ftwo: .float 2.0
log2: .float 0.69314718055994
str0: .asciiz "fizz"
str1: .asciiz "buzz"
str2: .asciiz "A"
str3: .asciiz "B"
str4: .asciiz "C"
str5: .asciiz "b es true"
str6: .asciiz "b es false"
str7: .asciiz "Mi entrada es cero."
str8: .asciiz "Mi entrada es uno."
str9: .asciiz "Mi entrada es dos, o cuatro."
str10: .asciiz "Lo siento, no puedo leer tu entrada."
str11: .asciiz "Mi entrada es menor o igual a cuatro."
str12: .asciiz "mi entrada es uno."
str13: .asciiz "mi entrada es dos."
str14: .asciiz "mi entrada es tres."
str15: .asciiz "mi entrada es cuatro."
str16: .asciiz "mi entrada es menor a uno."
str17: .asciiz "Mi entrada es mayor a cuatro."
.text
main:
li $t0, 3
sw $t0, 0($sp)

if0:
lw $t0, 0($sp)
li $t1, 3
li $t2, 0
div $t0, $t1
mfhi $t2
li $t3, 0
sub $t4, $t2, $t3
sltiu $t4, $t4, 1
beq $t4, $zero, if0_false
la $t5, str0
move $a0, $t5
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if0_fin
if0_false:
if0_fin:

if1:
lw $t0, 0($sp)
li $t1, 5
li $t2, 0
div $t0, $t1
mfhi $t2
li $t3, 0
sub $t4, $t2, $t3
sltiu $t4, $t4, 1
beq $t4, $zero, if1_false
la $t5, str1
move $a0, $t5
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if1_fin
if1_false:
if1_fin:

li $t0, 4
move $t1, $t0
sw $t1, 0($sp)

if2:
lw $t0, 0($sp)
li $t1, 3
li $t2, 0
div $t0, $t1
mfhi $t2
li $t3, 0
sub $t4, $t2, $t3
sltiu $t4, $t4, 1
beq $t4, $zero, if2_false
la $t5, str2
move $a0, $t5
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if2_fin
if2_false:
lw $t0, 0($sp)
li $t1, 3
slt $t2, $t1, $t0
beq $t2, $zero, if2_elif3_fin
la $t3, str3
move $a0, $t3
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if2_fin
if2_elif3_fin:
lw $t0, 0($sp)
li $t1, 4
sub $t2, $t0, $t1
sltiu $t2, $t2, 1
beq $t2, $zero, if2_elif4_fin
la $t3, str4
move $a0, $t3
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if2_fin
if2_elif4_fin:
if2_fin:

li $t0, 0
sw $t0, 4($sp)

if5:
lw $t0, 4($sp)
beq $t0, $zero, if5_false
la $t1, str5
move $a0, $t1
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if5_fin
if5_false:
la $t0, str6
move $a0, $t0
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

if5_fin:

li $t0, -1
sw $t0, 8($sp)

if6:
lw $t0, 8($sp)
li $t1, 0
sub $t2, $t0, $t1
sltiu $t2, $t2, 1
beq $t2, $zero, if6_false
la $t3, str7
move $a0, $t3
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if6_fin
if6_false:
lw $t0, 8($sp)
li $t1, 1
sub $t2, $t0, $t1
sltiu $t2, $t2, 1
beq $t2, $zero, if6_elif7_fin
la $t3, str8
move $a0, $t3
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if6_fin
if6_elif7_fin:
lw $t0, 8($sp)
li $t1, 2
sub $t2, $t0, $t1
sltiu $t2, $t2, 1
lw $t3, 8($sp)
li $t4, 4
sub $t5, $t3, $t4
sltiu $t5, $t5, 1
or $t6, $t2, $t5
beq $t6, $zero, if6_elif8_fin
la $t7, str9
move $a0, $t7
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if6_fin
if6_elif8_fin:
la $t0, str10
move $a0, $t0
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

if6_fin:

if9:
lw $t0, 8($sp)
li $t1, 4
slt $t2, $t1, $t0
xori $t3, $t2, 1
beq $t3, $zero, if9_false
la $t4, str11
move $a0, $t4
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

if10:
lw $t0, 8($sp)
li $t1, 1
sub $t2, $t0, $t1
sltiu $t2, $t2, 1
beq $t2, $zero, if10_false
la $t3, str12
move $a0, $t3
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if10_fin
if10_false:
lw $t0, 8($sp)
li $t1, 2
sub $t2, $t0, $t1
sltiu $t2, $t2, 1
beq $t2, $zero, if10_elif11_fin
la $t3, str13
move $a0, $t3
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if10_fin
if10_elif11_fin:
lw $t0, 8($sp)
li $t1, 3
sub $t2, $t0, $t1
sltiu $t2, $t2, 1
beq $t2, $zero, if10_elif12_fin
la $t3, str14
move $a0, $t3
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if10_fin
if10_elif12_fin:
lw $t0, 8($sp)
li $t1, 4
sub $t2, $t0, $t1
sltiu $t2, $t2, 1
beq $t2, $zero, if10_elif13_fin
la $t3, str15
move $a0, $t3
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

j if10_fin
if10_elif13_fin:
la $t0, str16
move $a0, $t0
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

if10_fin:

j if9_fin
if9_false:
la $t0, str17
move $a0, $t0
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall

if9_fin:

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

eqFloat: 
    # v0 := 1 si a0 == a1, 0 si a0 != a1
    # guardar $f0, $f1
    addi $sp, $sp, -8
    swc1 $f0, 0($sp)
    swc1 $f1, 4($sp)

    # cargar $a0 y $a1 en $f0 y $f1
    mtc1 $a0, $f0
    mtc1 $a1, $f1

    # comparar $f0 y $f1
    c.eq.s $f0, $f1
    # si son iguales, $v0 = 1
    li $v0, 1
    # si no, $v0 = 0
    bc1f eqFloat_end
    li $v0, 0

    eqFloat_end:
        # restaurar $f0, $f1
        lwc1 $f0, 0($sp)
        lwc1 $f1, 4($sp)
        addi $sp, $sp, 8

    jr $ra # retorna

ltFloat:
    # v0 := 1 si a0 < a1, 0 si a0 >= a1
    # guardar $f0, $f1
    addi $sp, $sp, -8
    swc1 $f0, 0($sp)
    swc1 $f1, 4($sp)
    
    # cargar $a0 y $a1 en $f0 y $f1
    mtc1 $a0, $f0
    mtc1 $a1, $f1

    # comparar $f0 y $f1
    c.lt.s $f0, $f1
    # si $f0 < $f1, $v0 = 1
    li $v0, 1
    # si no, $v0 = 0
    bc1t ltFloat_end
    li $v0, 0

    ltFloat_end:
        # restaurar $f0, $f1
        lwc1 $f0, 0($sp)
        lwc1 $f1, 4($sp)
        addi $sp, $sp, 8

    jr $ra # retorna

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

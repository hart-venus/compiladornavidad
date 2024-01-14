.data
endl: .asciiz "\n"
str0: .asciiz "ho ho ho"
float1: .float 2.718281828459045
float2: .float 3.14
float3: .float 3.14
float4: .float 2.5
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
sw $t0, 8($sp)

lw $t0, 4($sp)
lw $t1, 8($sp)
mtc1 $t0, $f12
li $v0, 2
syscall
mtc1 $t1, $f12
li $v0, 2
syscall
la $a0, endl
li $v0, 4
syscall

lw $t0, 0($sp)
move $a0, $t0
li $v0, 4
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

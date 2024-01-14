.data
    prompt1: .asciiz "Ingrese el primer número (punto flotante): "
    prompt2: .asciiz "Ingrese el segundo número (punto flotante): "
    resultMsg: .asciiz "El módulo es: "

.text
main:
    # Solicitar el primer número
    li $v0, 4
    la $a0, prompt1
    syscall

    # Leer el primer número
    li $v0, 6
    syscall
    mov.s $f12, $f0

    # Solicitar el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall

    # Leer el segundo número
    li $v0, 6
    syscall
    mov.s $f13, $f0

    # Calcular el módulo
    # $f12: dividendo, $f13: divisor, $f14: resultado
    div.s $f0, $f12, $f13
    cvt.w.s $f0, $f0
    mfc1 $t0, $f0
    mtc1 $t0, $f0
    cvt.s.w $f0, $f0
    mul.s $f0, $f0, $f13
    sub.s $f14, $f12, $f0

    # Imprimir el mensaje del resultado
    li $v0, 4
    la $a0, resultMsg
    syscall

    # Imprimir el resultado
    mov.s $f12, $f14
    li $v0, 2
    syscall

    # Salir del programa
    li $v0, 10
    syscall

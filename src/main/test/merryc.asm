.data
endl: .asciiz "\n"
str0: .asciiz "Hello World y "
str1: .asciiz "hola"
str2: .asciiz "Adios mundo"
.text
main:
la $a0, str0
jal printString
la $a0, str1
jal printString
la $a0, endl
jal printString
la $a0, str2
jal printString
la $a0, endl
jal printString
la $a0, endl
jal printString
li $v0, 10
syscall
add:

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

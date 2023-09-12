.data
prompt1:    .asciiz "Ingresa el primer número: "
prompt2:    .asciiz "Ingresa el segundo número: "
prompt3:    .asciiz "Ingresa el tercer número: "
result:     .asciiz "El número menor es: "

.text
main:
    # Imprimir el primer prompt y leer el primer número
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Almacena el primer número en $t0

    # Imprimir el segundo prompt y leer el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  # Almacena el segundo número en $t1

    # Imprimir el tercer prompt y leer el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0  # Almacena el tercer número en $t2

    # Comparar los números para encontrar el mayor
    move $t3, $t0  # Suponemos que el primer número es el mayor inicialmente

    # Compara $t1 con $t3 y almacena el máximo en $t3 si $t1 > $t3
    bgt $t1, $t3, check_t1
    move $t3, $t1
check_t1:

    # Compara $t2 con $t3 y almacena el máximo en $t3 si $t2 > $t3
    bgt $t2, $t3, check_t2
    move $t3, $t2
check_t2:

    # Imprimir el resultado
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $t3
    syscall

    # Terminar el programa
    li $v0, 10
    syscall








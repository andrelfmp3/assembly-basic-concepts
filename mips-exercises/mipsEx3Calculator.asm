.data
    boasvindas:       .asciiz "\nPrograma para as quatro operacoes basicas da matematica" # Inicia com um boas-vindas ao usuario
    valor1:           .asciiz "\nValor1: " # Entrada do usuario para o primeiro numero inteiro
    valor2:           .asciiz "\nValor2: " # Entrada do usuario para o segundo numero inteiro
    operacao:         .asciiz "\nEscolha a operacao:\n1 - Adicao \n2 - Subtracao \n3 - Multiplicacao\n4 - Divisao:\n "
    resultado_da_operacao: .asciiz "\nO resultado da operacao e: "

.text
main:
    li $v0, 4
    la $a0, boasvindas
    syscall

    li $v0, 4
    la $a0, valor1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, valor2
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, operacao
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    # Operacao escolhida
    beq $t2, 1, adicao
    beq $t2, 2, subtracao
    beq $t2, 3, multiplicacao
    beq $t2, 4, divisao

adicao:
    add $t3, $t0, $t1
    j resultado_done

subtracao:
    sub $t3, $t0, $t1
    j resultado_done

multiplicacao:
    mul $t3, $t0, $t1
    j resultado_done

divisao:
    div $t0, $t1
    mflo $t3

resultado_done:
    li $v0, 4
    la $a0, resultado_da_operacao
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall

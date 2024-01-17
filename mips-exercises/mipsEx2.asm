.data 
	array1: .space 40
.text	
	main:
		li $t0, 0 
		li $t1, 0
		la $t2,array1 #cria o e armazenando seu endereço
	loop:
		bgt $t0,9,exit #se t0 for maior que 9, pula pro exit
		addi $t1,$t1,2 
		addi $t0,$t0,1 
		sw $t1,($t2) 
		addi $t2,$t2,4 
		j loop # renicia loop
	exit:
		li $v0,10 ar
		syscall 		

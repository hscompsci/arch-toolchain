	.globl _start
_start:
	.option norelax
	la		gp, __global_pointer$
	.option relax
	call	main
	mv		a0, zero
	j		exit

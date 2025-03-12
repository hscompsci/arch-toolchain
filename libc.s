	.globl exit
exit:
	.word 0

	.globl fgets
fgets:
	mv		t0, a0
	add		t1, a0, a1
	addi	t1, t1, -1
	li		t2, '\n'
	mv		t3, a0
.Lfgets_loop:
	beq		t0, t1, .Lfgets_end
	ebreak
	sb		a0, (t0)
	addi	t0, t0, 1
	bne		a0, t2, .Lfgets_loop
.Lfgets_end:
	sb		zero, (t0)
	mv		a0, t3
	ret

	.globl fputs
fputs:
	mv		t0, a0
	j		.Lfputs_condition
.Lfputs_loop:
	ecall
	addi	t0, t0, 1
.Lfputs_condition:
	lb		a0, (t0)
	bne		a0, zero, .Lfputs_loop
	ret

	.globl getchar
getchar:
	ebreak
	ret

	.globl putchar
putchar:
	ecall
	ret

	.globl puts
puts:
	addi	sp, sp, -16
	sw		ra, (sp)

	call	fputs
	li		a0, '\n'
	call	putchar

	lw		ra, (sp)
	addi	sp, sp, 16
	ret

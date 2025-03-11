	.globl exit
exit:
	.word 0

	.globl fputs
fputs:
	mv		t0, a0
	j		.Lcondition
.Lloop:
	ecall
	addi	t0, t0, 1
.Lcondition:
	lb		a0, (t0)
	bne		a0, zero, .Lloop
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

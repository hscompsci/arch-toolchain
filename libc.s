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

	.globl putchar
putchar:
	ecall
	ret

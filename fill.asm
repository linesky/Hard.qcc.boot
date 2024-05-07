
	.section .mdebug.abi32
	.previous
	.nan	legacy

	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	cfill
	.set	nomips16
	.set	nomicromips
	.ent	cfill
	.type	cfill, @function
cfill:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,48($fp)
	move	$2,$5
	sw	$6,56($fp)
	sb	$2,52($fp)
	sw	$0,24($fp)
	lw	$4,48($fp)
	lw	$2,%call16(strlen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	srl	$2,$2,1
	sw	$2,28($fp)
	lw	$2,56($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	sw	$2,32($fp)
	sw	$0,24($fp)
	b	$L2
	nop

$L3:
	lw	$3,28($fp)
	lw	$2,32($fp)
	subu	$3,$3,$2
	lw	$2,24($fp)
	addu	$2,$3,$2
	move	$3,$2
	lw	$2,48($fp)
	addu	$2,$2,$3
	lbu	$3,52($fp)
	sb	$3,0($2)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L2:
	lw	$3,24($fp)
	lw	$2,56($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L3
	nop

	nop
	nop
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	cfill
	.size	cfill, .-cfill
	.rdata
	.align	2
$LC1:
	.ascii	"\033[43;37m%s \012\000"
	.align	2
$LC0:
	.ascii	"hello world\012\000"
	.space	67
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,112,$31		# vars= 80, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-112
	sw	$31,108($sp)
	sw	$fp,104($sp)
	move	$fp,$sp
	.cprestore	16
	lw	$2,%got($LC0)($28)
	lw	$5,%lo($LC0)($2)
	addiu	$3,$2,%lo($LC0)
	lw	$4,4($3)
	addiu	$3,$2,%lo($LC0)
	lw	$3,8($3)
	sw	$5,24($fp)
	sw	$4,28($fp)
	sw	$3,32($fp)
	addiu	$2,$2,%lo($LC0)
	lbu	$2,12($2)
	sb	$2,36($fp)
	addiu	$3,$fp,37
	li	$2,67			# 0x43
	move	$6,$2
	move	$5,$0
	move	$4,$3
	lw	$2,%call16(memset)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memset
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$6,3			# 0x3
	li	$5,46			# 0x2e
	addiu	$2,$fp,24
	move	$4,$2
	lw	$2,%got(cfill)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,cfill
1:	jalr	$25
	nop

	lw	$28,16($fp)
	addiu	$2,$fp,24
	move	$5,$2
	lw	$2,%got($LC1)($28)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,108($sp)
	lw	$fp,104($sp)
	addiu	$sp,$sp,112
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main


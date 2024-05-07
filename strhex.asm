
	.section .mdebug.abi32
	.previous
	.nan	legacy

	.module	nooddspreg
	.abicalls
	.text
	.rdata
	.align	2
$LC0:
	.ascii	"0123456789ABCDEF0123456789ABCDEF\000"
	.text
	.align	2
	.globl	strshex
	.set	nomips16
	.set	nomicromips
	.ent	strshex
	.type	strshex, @function
strshex:
	.frame	$fp,40,$31		# vars= 24, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$fp,36($sp)
	move	$fp,$sp
	.cprestore	0
	sw	$4,40($fp)
	sw	$5,44($fp)
	lw	$2,44($fp)
	sw	$2,8($fp)
	li	$2,8			# 0x8
	sw	$2,12($fp)
	sw	$0,16($fp)
	li	$2,16			# 0x10
	sw	$2,20($fp)
	li	$2,15			# 0xf
	sw	$2,24($fp)
	lw	$2,%got($LC0)($28)
	addiu	$2,$2,%lo($LC0)
	sw	$2,28($fp)
	lw	$2,12($fp)
	lw	$3,40($fp)
	addu	$2,$3,$2
	sb	$0,0($2)
	li	$2,7			# 0x7
	sw	$2,12($fp)
	b	$L2
	nop

$L3:
	lw	$3,8($fp)
	lw	$2,24($fp)
	and	$2,$3,$2
	sw	$2,16($fp)
	lw	$2,16($fp)
	lw	$3,28($fp)
	addu	$3,$3,$2
	lw	$2,12($fp)
	lw	$4,40($fp)
	addu	$2,$4,$2
	lb	$3,0($3)
	sb	$3,0($2)
	lw	$3,8($fp)
	lw	$2,20($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	mflo	$2
	sw	$2,8($fp)
	lw	$2,12($fp)
	addiu	$2,$2,-1
	sw	$2,12($fp)
$L2:
	lw	$2,12($fp)
	bgez	$2,$L3
	nop

	nop
	nop
	move	$sp,$fp
	lw	$fp,36($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	strshex
	.size	strshex, .-strshex
	.rdata
	.align	2
$LC1:
	.ascii	"\033[43;37m%s  \012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,88,$31		# vars= 56, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-88
	sw	$31,84($sp)
	sw	$fp,80($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$0,24($fp)
	addiu	$3,$fp,28
	li	$2,305397760			# 0x12340000
	ori	$5,$2,0x5678
	move	$4,$3
	lw	$2,%got(strshex)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strshex
1:	jalr	$25
	nop

	lw	$28,16($fp)
	addiu	$2,$fp,28
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
	lw	$31,84($sp)
	lw	$fp,80($sp)
	addiu	$sp,$sp,88
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main


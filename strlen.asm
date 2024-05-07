
	.section .mdebug.abi32
	.previous
	.nan	legacy

	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	strslen
	.set	nomips16
	.set	nomicromips
	.ent	strslen
	.type	strslen, @function
strslen:
	.frame	$fp,24,$31		# vars= 8, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$fp,20($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	sw	$0,8($fp)
	b	$L2
	nop

$L3:
	lw	$2,8($fp)
	addiu	$2,$2,1
	sw	$2,8($fp)
$L2:
	lw	$2,8($fp)
	lw	$3,24($fp)
	addu	$2,$3,$2
	lb	$2,0($2)
	bne	$2,$0,$L3
	nop

	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	strslen
	.size	strslen, .-strslen
	.rdata
	.align	2
$LC0:
	.ascii	"hello world\012\000"
	.align	2
$LC1:
	.ascii	"\033[43;37m%s  %d\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	lw	$2,%got($LC0)($28)
	addiu	$2,$2,%lo($LC0)
	sw	$2,24($fp)
	lw	$4,24($fp)
	lw	$2,%got(strslen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strslen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$6,$2
	lw	$5,24($fp)
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
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main



	.section .mdebug.abi32
	.previous
	.nan	legacy
	
	.module	nooddspreg
	.abicalls
	.text
	.rdata
	.align	2
$LC0:
	.ascii	"hello world\000"
	.text
	.align	2
	.globl	hello
	.set	nomips16
	.set	nomicromips
	.ent	hello
	.type	hello, @function
hello:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	lw	$2,%got($LC0)($28)
	addiu	$2,$2,%lo($LC0)
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	hello
	.size	hello, .-hello
	.rdata
	.align	2
$LC1:
	.ascii	"\033[43;37m%s....\012\000"
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
	lw	$2,%got($LC1)($28)
	addiu	$2,$2,%lo($LC1)
	sw	$2,24($fp)
	lw	$2,%got(hello)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,hello
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$5,$2
	lw	$4,24($fp)
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


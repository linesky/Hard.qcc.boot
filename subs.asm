
	.section .mdebug.abi32
	.previous
	.nan	legacy

	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	subs
	.set	nomips16
	.set	nomicromips
	.ent	subs
	.type	subs, @function
subs:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	sw	$5,12($fp)
	lw	$3,8($fp)
	lw	$2,12($fp)
	subu	$2,$3,$2
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	subs
	.size	subs, .-subs
	.rdata
	.align	2
$LC0:
	.ascii	"\033[43;37m%d....\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
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
	li	$2,10			# 0xa
	sw	$2,24($fp)
	li	$2,5			# 0x5
	sw	$2,28($fp)
	lw	$2,%got($LC0)($28)
	addiu	$2,$2,%lo($LC0)
	sw	$2,32($fp)
	lw	$5,28($fp)
	lw	$4,24($fp)
	lw	$2,%got(subs)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,subs
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$5,$2
	lw	$4,32($fp)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main


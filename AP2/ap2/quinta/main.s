	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC2:
	.string	"Classifica\303\247\303\243o: Barato"
.LC4:
	.string	"Classifica\303\247\303\243o: Normal"
.LC6:
	.string	"Classifica\303\247\303\243o: Caro"
.LC7:
	.string	"Classifica\303\247\303\243o: Muito Caro"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	lea	ecx, 4[esp]
	.cfi_def_cfa 1, 0
	and	esp, -16
	push	DWORD PTR -4[ecx]
	push	ebp
	mov	ebp, esp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	push	ebx
	push	ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	fld	DWORD PTR .LC0@GOTOFF[eax]
	fstp	DWORD PTR -12[ebp]
	fld	DWORD PTR -12[ebp]
	fld	DWORD PTR .LC1@GOTOFF[eax]
	fcomip	st, st(1)
	fstp	st(0)
	jb	.L13
	sub	esp, 12
	lea	edx, .LC2@GOTOFF[eax]
	push	edx
	mov	ebx, eax
	call	puts@PLT
	add	esp, 16
	jmp	.L4
.L13:
	fld	DWORD PTR -12[ebp]
	fld	DWORD PTR .LC3@GOTOFF[eax]
	fcomip	st, st(1)
	fstp	st(0)
	jb	.L14
	sub	esp, 12
	lea	edx, .LC4@GOTOFF[eax]
	push	edx
	mov	ebx, eax
	call	puts@PLT
	add	esp, 16
	jmp	.L4
.L14:
	fld	DWORD PTR -12[ebp]
	fld	DWORD PTR .LC5@GOTOFF[eax]
	fcomip	st, st(1)
	fstp	st(0)
	jb	.L15
	sub	esp, 12
	lea	edx, .LC6@GOTOFF[eax]
	push	edx
	mov	ebx, eax
	call	puts@PLT
	add	esp, 16
	jmp	.L4
.L15:
	sub	esp, 12
	lea	edx, .LC7@GOTOFF[eax]
	push	edx
	mov	ebx, eax
	call	puts@PLT
	add	esp, 16
.L4:
	mov	eax, 0
	lea	esp, -8[ebp]
	pop	ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	pop	ebx
	.cfi_restore 3
	pop	ebp
	.cfi_restore 5
	lea	esp, -4[ecx]
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1118437376
	.align 4
.LC1:
	.long	1117782016
	.align 4
.LC3:
	.long	1123024896
	.align 4
.LC5:
	.long	1128792064
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB1:
	.cfi_startproc
	mov	eax, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE1:
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits

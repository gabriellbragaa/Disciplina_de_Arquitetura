global main
extern printf
extern calculo_shl
extern calculo_shr
extern calculo_sar
extern calculo_rol
extern calculo_ror
extern calculo_rcl
extern calculo_rcr
extern calculo_shld
extern calculo_shrd
extern multiplicacao_binaria
extern multiplicacao_mul
extern multiplicacao_imul



section .bss
	
section .data
	
	
section .text
main:
	;===========================
	call calculo_shl
	;===========================
	call calculo_shr
	;===========================
	call calculo_sar
	;===========================
	call calculo_rol
	;===========================
	call calculo_ror
	;===========================
	call calculo_rcl
	;===========================
	call calculo_rcr
	;===========================
	call calculo_shld
	;===========================
	call calculo_shrd
	;===========================
	call multiplicacao_binaria
	;===========================
	call multiplicacao_mul
	;===========================
	call multiplicacao_imul
	
	fim:
	mov eax, 1
	mov ebx, 0
	int 0x80	
	
	
	ret

	;===========================
	
	





	

	



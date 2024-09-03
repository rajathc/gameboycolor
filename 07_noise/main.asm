;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (Mac OS X ppc)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _wait_vbl_done
	.globl _joypad
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:4: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:6: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;main.c:7: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;main.c:8: NR51_REG =  0xff;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;main.c:10: while(1) {
00104$:
;main.c:11: UBYTE joypad_state = joypad();
	call	_joypad
;main.c:13: if(joypad_state){
	or	a, a
	jr	Z, 00104$
;main.c:14: NR42_REG = 0x1F;
	ld	a, #0x1f
	ldh	(_NR42_REG + 0), a
;main.c:15: NR42_REG = 0xF1;
	ld	a, #0xf1
	ldh	(_NR42_REG + 0), a
;main.c:16: NR43_REG = 0x30;
	ld	a, #0x30
	ldh	(_NR43_REG + 0), a
;main.c:17: NR44_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR44_REG + 0), a
;main.c:19: wait_vbl_done();
	call	_wait_vbl_done
;main.c:22: }
	jr	00104$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

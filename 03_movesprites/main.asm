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
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _Smiler
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
_Smiler::
	.ds 32
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
;main.c:5: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;main.c:8: set_sprite_data(0, 2, Smiler);
	ld	de, #_Smiler
	push	de
	ld	hl, #0x200
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/Users/rajath/gbdk/include/gb/gb.h:1875: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;/Users/rajath/gbdk/include/gb/gb.h:1961: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/Users/rajath/gbdk/include/gb/gb.h:1962: itm->y=y, itm->x=x;
	ld	a, #0x4e
	ld	(hl+), a
	ld	(hl), #0x58
;main.c:11: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:13: while (1){
00107$:
;main.c:14: switch(joypad()){
	call	_joypad
	ldhl	sp,#0
	ld	(hl), a
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00101$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00103$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00104$
	jr	00105$
;main.c:15: case J_LEFT:
00101$:
;/Users/rajath/gbdk/include/gb/gb.h:1977: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
;/Users/rajath/gbdk/include/gb/gb.h:1978: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	add	a, #0xfe
	ld	(bc), a
;main.c:17: break;
	jr	00105$
;main.c:18: case J_RIGHT:
00102$:
;/Users/rajath/gbdk/include/gb/gb.h:1977: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;/Users/rajath/gbdk/include/gb/gb.h:1978: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
;main.c:20: break;
	jr	00105$
;main.c:21: case J_UP:
00103$:
;/Users/rajath/gbdk/include/gb/gb.h:1977: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;/Users/rajath/gbdk/include/gb/gb.h:1978: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0xfe
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;main.c:23: break;
	jr	00105$
;main.c:24: case J_DOWN:
00104$:
;/Users/rajath/gbdk/include/gb/gb.h:1977: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;/Users/rajath/gbdk/include/gb/gb.h:1978: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;main.c:27: }
00105$:
;main.c:28: wait_vbl_done();
	call	_wait_vbl_done
	jr	00107$
;main.c:30: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__Smiler:
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x7e	; 126
	.area _CABS (ABS)

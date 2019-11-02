;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Sat Nov  2 19:19:48 2019
;--------------------------------------------------------
	.module Title_screen
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _select_mode
	.globl _mode_screen
	.globl _title_screen
	.globl _game2
	.globl _game
	.globl _computer_play
	.globl _player2_play
	.globl _player_play
	.globl _draw_cursor
	.globl _update
	.globl _draw_board
	.globl _init
	.globl _coord_2d_to_1d
	.globl _clear_screen
	.globl _setchar
	.globl _gotoxy
	.globl _waitpadup
	.globl _waitpad
	.globl _printf
	.globl _GAME_CURSOR_Y
	.globl _GAME_CURSOR_X
	.globl _GAME_BOARD
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_GAME_BOARD::
	.ds 9
_GAME_CURSOR_X::
	.ds 1
_GAME_CURSOR_Y::
	.ds 1
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
;Title_screen.c:25: void	clear_screen(void)
;	---------------------------------
; Function clear_screen
; ---------------------------------
_clear_screen::
;Title_screen.c:29: while (y)
	ld	b,#0x12
00104$:
	ld	a,b
	or	a, a
	ret	Z
;Title_screen.c:31: y -= 1;
	dec	b
;Title_screen.c:33: while (x)
	ld	c,#0x14
00101$:
	ld	a,c
	or	a, a
	jr	Z,00104$
;Title_screen.c:35: x -= 1;
	dec	c
;Title_screen.c:36: gotoxy(x, y);
	push	bc
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_gotoxy
	add	sp, #2
	pop	bc
;Title_screen.c:37: setchar(' ');
	push	bc
	ld	a,#0x20
	push	af
	inc	sp
	call	_setchar
	inc	sp
	pop	bc
	jr	00101$
	ret
;Title_screen.c:42: UINT8	coord_2d_to_1d(UINT8 x, UINT8 y)
;	---------------------------------
; Function coord_2d_to_1d
; ---------------------------------
_coord_2d_to_1d::
;Title_screen.c:44: return y * 3 + x;
	ldhl	sp,#3
	ld	a,(hl)
	ld	c,a
	add	a, a
	add	a, c
	ld	b,a
	ldhl	sp,#2
	add	a, (hl)
	ld	e,a
	ret
;Title_screen.c:47: void	init(void)
;	---------------------------------
; Function init
; ---------------------------------
_init::
	dec	sp
;Title_screen.c:51: for (i = 0 ; i < 9 ; i++)
	ldhl	sp,#0
	ld	(hl),#0x00
00102$:
;Title_screen.c:53: GAME_BOARD[i] = EMPTY;
	ld	de,#_GAME_BOARD
	ldhl	sp,#0
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x20
	ld	(bc),a
;Title_screen.c:51: for (i = 0 ; i < 9 ; i++)
	ldhl	sp,#0
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x09
	jr	C,00102$
;Title_screen.c:56: GAME_CURSOR_X = 1;
	ld	hl,#_GAME_CURSOR_X
	ld	(hl),#0x01
;Title_screen.c:57: GAME_CURSOR_Y = 1;
	ld	hl,#_GAME_CURSOR_Y
	ld	(hl),#0x01
	inc	sp
	ret
;Title_screen.c:60: void	draw_board(void)
;	---------------------------------
; Function draw_board
; ---------------------------------
_draw_board::
;Title_screen.c:62: clear_screen();
	call	_clear_screen
;Title_screen.c:63: gotoxy(4, 1);
	ld	hl,#0x0104
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:64: printf("Tic Tac Toe");
	ld	de,#___str_0
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:65: gotoxy(1, 17);
	ld	hl,#0x1101
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:66: printf("X you - O Computer");
	ld	de,#___str_1
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:67: gotoxy(0, 4);
	ld	hl,#0x0400
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:68: printf("       |   |   \n");
	ld	de,#___str_2
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:69: printf("       |   |   \n");
	ld	de,#___str_2
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:70: printf("       |   |   \n");
	ld	de,#___str_2
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:71: printf("    ---+---+---\n");
	ld	de,#___str_3
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:72: printf("       |   |   \n");
	ld	de,#___str_2
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:73: printf("       |   |   \n");
	ld	de,#___str_2
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:74: printf("       |   |   \n");
	ld	de,#___str_2
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:75: printf("    ---+---+---\n");
	ld	de,#___str_3
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:76: printf("       |   |   \n");
	ld	de,#___str_2
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:77: printf("       |   |   \n");
	ld	de,#___str_2
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:78: printf("       |   |   \n");
	ld	de,#___str_2
	push	de
	call	_printf
	add	sp, #2
	ret
___str_0:
	.ascii "Tic Tac Toe"
	.db 0x00
___str_1:
	.ascii "X you - O Computer"
	.db 0x00
___str_2:
	.ascii "       |   |   "
	.db 0x0A
	.db 0x00
___str_3:
	.ascii "    ---+---+---"
	.db 0x0A
	.db 0x00
;Title_screen.c:81: void	update(void)
;	---------------------------------
; Function update
; ---------------------------------
_update::
	add	sp, #-4
;Title_screen.c:89: for (y = 0 ; y < 3 ; y++)
	ld	b,#0x00
;Title_screen.c:91: for (x = 0 ; x < 3 ; x++)
00109$:
	ld	a,b
	add	a, a
	add	a, a
	add	a, #0x05
	ldhl	sp,#1
	ld	(hl),a
	ld	c,#0x00
00103$:
;Title_screen.c:93: i = coord_2d_to_1d(x, y);
	push	bc
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_coord_2d_to_1d
	add	sp, #2
	pop	bc
	ldhl	sp,#0
	ld	(hl),e
;Title_screen.c:94: graph_x = 4 + x * 4 + 1;
	ld	a,c
	add	a, a
	add	a, a
	add	a, #0x05
	ld	d,a
;Title_screen.c:96: gotoxy(graph_x, graph_y);
	push	bc
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_gotoxy
	add	sp, #2
	pop	bc
;Title_screen.c:97: setchar(GAME_BOARD[i]);
	ld	de,#_GAME_BOARD
	ldhl	sp,#0
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	push	bc
	push	af
	inc	sp
	call	_setchar
	inc	sp
	pop	bc
;Title_screen.c:91: for (x = 0 ; x < 3 ; x++)
	inc	c
	ld	a,c
	sub	a, #0x03
	jp	C,00103$
;Title_screen.c:89: for (y = 0 ; y < 3 ; y++)
	inc	b
	ld	a,b
	sub	a, #0x03
	jp	C,00109$
	add	sp, #4
	ret
;Title_screen.c:102: void	draw_cursor(UINT8 cursor_char)
;	---------------------------------
; Function draw_cursor
; ---------------------------------
_draw_cursor::
	add	sp, #-9
;Title_screen.c:104: UINT8 graph_x = GAME_CURSOR_X * 4 + 5;
	ld	hl,#_GAME_CURSOR_X
	ld	a,(hl)
	add	a, a
	add	a, a
	add	a, #0x05
	ldhl	sp,#0
	ld	(hl),a
;Title_screen.c:105: UINT8 graph_y = GAME_CURSOR_Y * 4 + 5;
	ld	hl,#_GAME_CURSOR_Y
	ld	a,(hl)
	add	a, a
	add	a, a
	add	a, #0x05
	ldhl	sp,#2
	ld	(hl),a
;Title_screen.c:109: for (cy = graph_y - 1 ; cy <= graph_y + 1 ; cy ++)
	ld	a,(hl)
	add	a,#0xFF
	ldhl	sp,#7
	ld	(hl),a
	ldhl	sp,#0
	ld	a,(hl)
	add	a,#0xFF
	inc	hl
	ld	(hl),a
00110$:
	ldhl	sp,#2
	ld	c,(hl)
	ld	b,#0x00
	inc	bc
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ldhl	sp,#7
	ld	b,(hl)
	ld	c,#0x00
	ldhl	sp,#3
	ld	a, (hl)
	sub	a, b
	inc	hl
	ld	a, (hl)
	sbc	a, c
	ld	d, (hl)
	ld	a,c
	ld	e, a
	bit	7, e
	jr	Z,00136$
	bit	7, d
	jr	NZ,00137$
	cp	a, a
	jr	00137$
00136$:
	bit	7, d
	jr	Z,00137$
	scf
00137$:
	jp	C,00112$
;Title_screen.c:111: for (cx = graph_x - 1 ; cx <= graph_x + 1 ; cx++)
	push	hl
	ldhl	sp,#3
	ld	a,(hl+)
	inc	hl
	ld	(hl),a
	pop	hl
	ldhl	sp,#2
	ld	a,(hl)
	ldhl	sp,#7
	sub	a, (hl)
	jr	NZ,00138$
	ld	a,#0x01
	jr	00139$
00138$:
	xor	a,a
00139$:
	ldhl	sp,#8
	ld	(hl),a
00108$:
	ldhl	sp,#0
	ld	c,(hl)
	ld	b,#0x00
	inc	bc
	ldhl	sp,#3
	ld	a,(hl+)
	inc	hl
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	a,c
	sub	a, (hl)
	inc	hl
	ld	a,b
	sbc	a, (hl)
	ld	a,b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00140$
	bit	7, d
	jr	NZ,00141$
	cp	a, a
	jr	00141$
00140$:
	bit	7, d
	jr	Z,00141$
	scf
00141$:
	jr	C,00111$
;Title_screen.c:113: if (cx == graph_x && cy == graph_y)
	ldhl	sp,#0
	ld	a,(hl)
	ldhl	sp,#3
	sub	a, (hl)
	jr	NZ,00102$
	ldhl	sp,#8
	ld	a,(hl)
	or	a, a
	jr	NZ,00104$
;Title_screen.c:114: continue ;
00102$:
;Title_screen.c:115: gotoxy(cx, cy);
	ldhl	sp,#7
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#4
	ld	a,(hl)
	push	af
	inc	sp
	call	_gotoxy
	add	sp, #2
;Title_screen.c:116: setchar(cursor_char);
	ldhl	sp,#11
	ld	a,(hl)
	push	af
	inc	sp
	call	_setchar
	inc	sp
00104$:
;Title_screen.c:111: for (cx = graph_x - 1 ; cx <= graph_x + 1 ; cx++)
	ldhl	sp,#3
	inc	(hl)
	jp	00108$
00111$:
;Title_screen.c:109: for (cy = graph_y - 1 ; cy <= graph_y + 1 ; cy ++)
	ldhl	sp,#7
	inc	(hl)
	jp	00110$
00112$:
	add	sp, #9
	ret
;Title_screen.c:122: void	player_play(void)
;	---------------------------------
; Function player_play
; ---------------------------------
_player_play::
;Title_screen.c:127: while (1)
00118$:
;Title_screen.c:129: draw_cursor('/');
	ld	a,#0x2F
	push	af
	inc	sp
	call	_draw_cursor
	inc	sp
;Title_screen.c:130: key = waitpad(J_UP | J_DOWN | J_LEFT | J_RIGHT | J_A);
	ld	a,#0x1F
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;Title_screen.c:131: draw_cursor(' ');
	push	de
	ld	a,#0x20
	push	af
	inc	sp
	call	_draw_cursor
	inc	sp
	pop	de
;Title_screen.c:133: if (key == J_UP && GAME_CURSOR_Y != 0)
	ld	b,e
	ld	c,#0x00
	ld	a,b
	sub	a, #0x04
	jr	NZ,00102$
	ld	a,c
	or	a, a
	jr	NZ,00102$
	ld	hl,#_GAME_CURSOR_Y
	ld	a,(hl)
	or	a, a
	jr	Z,00102$
;Title_screen.c:134: GAME_CURSOR_Y--;
	dec	(hl)
00102$:
;Title_screen.c:135: if (key == J_DOWN && GAME_CURSOR_Y != 2)
	ld	a,b
	sub	a, #0x08
	jr	NZ,00105$
	ld	a,c
	or	a, a
	jr	NZ,00105$
	ld	hl,#_GAME_CURSOR_Y
	ld	a,(hl)
	sub	a, #0x02
	jr	Z,00105$
;Title_screen.c:136: GAME_CURSOR_Y++;
	ld	hl,#_GAME_CURSOR_Y
	inc	(hl)
00105$:
;Title_screen.c:137: if (key == J_LEFT && GAME_CURSOR_X != 0)
	ld	a,b
	sub	a, #0x02
	jr	NZ,00108$
	ld	a,c
	or	a, a
	jr	NZ,00108$
	ld	hl,#_GAME_CURSOR_X
	ld	a,(hl)
	or	a, a
	jr	Z,00108$
;Title_screen.c:138: GAME_CURSOR_X--;
	dec	(hl)
00108$:
;Title_screen.c:139: if (key == J_RIGHT && GAME_CURSOR_X != 2)
	ld	a,b
	dec	a
	jr	NZ,00111$
	ld	a,c
	or	a, a
	jr	NZ,00111$
	ld	hl,#_GAME_CURSOR_X
	ld	a,(hl)
	sub	a, #0x02
	jr	Z,00111$
;Title_screen.c:140: GAME_CURSOR_X++;
	ld	hl,#_GAME_CURSOR_X
	inc	(hl)
00111$:
;Title_screen.c:141: if (key == J_A)
	ld	a,b
	sub	a, #0x10
	jr	NZ,00116$
	ld	a,c
	or	a, a
	jr	NZ,00116$
;Title_screen.c:143: i = coord_2d_to_1d(GAME_CURSOR_X, GAME_CURSOR_Y);
	ld	hl,#_GAME_CURSOR_Y
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#_GAME_CURSOR_X
	ld	a,(hl)
	push	af
	inc	sp
	call	_coord_2d_to_1d
	add	sp, #2
	ld	b,e
;Title_screen.c:144: if (GAME_BOARD[i] == EMPTY)
	ld	a,#<(_GAME_BOARD)
	add	a, b
	ld	c,a
	ld	a,#>(_GAME_BOARD)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	sub	a, #0x20
	jr	NZ,00116$
;Title_screen.c:146: GAME_BOARD[i] = PLAYER;
	ld	a,#0x78
	ld	(bc),a
;Title_screen.c:147: break ;
	ret
00116$:
;Title_screen.c:150: waitpadup();
	call	_waitpadup
	jp	00118$
	ret
;Title_screen.c:154: void	player2_play(void)
;	---------------------------------
; Function player2_play
; ---------------------------------
_player2_play::
;Title_screen.c:159: while (1)
00118$:
;Title_screen.c:161: draw_cursor('/');
	ld	a,#0x2F
	push	af
	inc	sp
	call	_draw_cursor
	inc	sp
;Title_screen.c:162: key = waitpad(J_UP | J_DOWN | J_LEFT | J_RIGHT | J_A);
	ld	a,#0x1F
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;Title_screen.c:163: draw_cursor(' ');
	push	de
	ld	a,#0x20
	push	af
	inc	sp
	call	_draw_cursor
	inc	sp
	pop	de
;Title_screen.c:165: if (key == J_UP && GAME_CURSOR_Y != 0)
	ld	b,e
	ld	c,#0x00
	ld	a,b
	sub	a, #0x04
	jr	NZ,00102$
	ld	a,c
	or	a, a
	jr	NZ,00102$
	ld	hl,#_GAME_CURSOR_Y
	ld	a,(hl)
	or	a, a
	jr	Z,00102$
;Title_screen.c:166: GAME_CURSOR_Y--;
	dec	(hl)
00102$:
;Title_screen.c:167: if (key == J_DOWN && GAME_CURSOR_Y != 2)
	ld	a,b
	sub	a, #0x08
	jr	NZ,00105$
	ld	a,c
	or	a, a
	jr	NZ,00105$
	ld	hl,#_GAME_CURSOR_Y
	ld	a,(hl)
	sub	a, #0x02
	jr	Z,00105$
;Title_screen.c:168: GAME_CURSOR_Y++;
	ld	hl,#_GAME_CURSOR_Y
	inc	(hl)
00105$:
;Title_screen.c:169: if (key == J_LEFT && GAME_CURSOR_X != 0)
	ld	a,b
	sub	a, #0x02
	jr	NZ,00108$
	ld	a,c
	or	a, a
	jr	NZ,00108$
	ld	hl,#_GAME_CURSOR_X
	ld	a,(hl)
	or	a, a
	jr	Z,00108$
;Title_screen.c:170: GAME_CURSOR_X--;
	dec	(hl)
00108$:
;Title_screen.c:171: if (key == J_RIGHT && GAME_CURSOR_X != 2)
	ld	a,b
	dec	a
	jr	NZ,00111$
	ld	a,c
	or	a, a
	jr	NZ,00111$
	ld	hl,#_GAME_CURSOR_X
	ld	a,(hl)
	sub	a, #0x02
	jr	Z,00111$
;Title_screen.c:172: GAME_CURSOR_X++;
	ld	hl,#_GAME_CURSOR_X
	inc	(hl)
00111$:
;Title_screen.c:173: if (key == J_A)
	ld	a,b
	sub	a, #0x10
	jr	NZ,00116$
	ld	a,c
	or	a, a
	jr	NZ,00116$
;Title_screen.c:175: i = coord_2d_to_1d(GAME_CURSOR_X, GAME_CURSOR_Y);
	ld	hl,#_GAME_CURSOR_Y
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#_GAME_CURSOR_X
	ld	a,(hl)
	push	af
	inc	sp
	call	_coord_2d_to_1d
	add	sp, #2
	ld	b,e
;Title_screen.c:176: if (GAME_BOARD[i] == EMPTY)
	ld	a,#<(_GAME_BOARD)
	add	a, b
	ld	c,a
	ld	a,#>(_GAME_BOARD)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	sub	a, #0x20
	jr	NZ,00116$
;Title_screen.c:178: GAME_BOARD[i] = PLAYER2;
	ld	a,#0x6F
	ld	(bc),a
;Title_screen.c:179: break ;
	ret
00116$:
;Title_screen.c:182: waitpadup();
	call	_waitpadup
	jp	00118$
	ret
;Title_screen.c:186: void computer_play(void)
;	---------------------------------
; Function computer_play
; ---------------------------------
_computer_play::
	add	sp, #-11
;Title_screen.c:194: INT8 loose_cell = -1;
	ldhl	sp,#2
	ld	(hl),#0xFF
;Title_screen.c:196: for (y = 0 ; y < 3 ; y += 1) {
	ldhl	sp,#5
	ld	(hl),#0x00
;Title_screen.c:199: for (x = 0 ; x < 3 ; x += 1) {
00124$:
	ldhl	sp,#3
	ld	(hl),#0x00
	ldhl	sp,#6
	ld	(hl),#0x00
	dec	hl
	dec	hl
	ld	(hl),#0x00
00115$:
;Title_screen.c:200: i = coord_2d_to_1d(x, y);
	push	bc
	ldhl	sp,#7
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	call	_coord_2d_to_1d
	add	sp, #2
	pop	bc
	ldhl	sp,#0
	ld	(hl),e
;Title_screen.c:201: switch (GAME_BOARD[i]) {
	ld	de,#_GAME_BOARD
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	d,a
	sub	a, #0x20
	jr	Z,00101$
	ld	a,d
	cp	a,#0x6F
	jr	Z,00103$
	sub	a, #0x78
	jr	Z,00102$
	jr	00116$
;Title_screen.c:202: case EMPTY:
00101$:
;Title_screen.c:203: last_empty_cell = i;
	ldhl	sp,#0
	ld	c,(hl)
;Title_screen.c:204: break;
	jr	00116$
;Title_screen.c:205: case PLAYER:
00102$:
;Title_screen.c:206: player_score += 1;
	ldhl	sp,#6
	inc	(hl)
;Title_screen.c:207: break;
	jr	00116$
;Title_screen.c:208: case PLAYER2:
00103$:
;Title_screen.c:209: computer_score += 1;
	ldhl	sp,#3
	inc	(hl)
;Title_screen.c:211: }
00116$:
;Title_screen.c:199: for (x = 0 ; x < 3 ; x += 1) {
	ldhl	sp,#4
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x03
	jp	C,00115$
;Title_screen.c:213: if (computer_score == 2 && player_score == 0) {
	push	hl
	dec	hl
	ld	a,(hl)
	ldhl	sp,#9
	ld	(hl),a
	pop	hl
	ldhl	sp,#6
	ld	b,(hl)
;Title_screen.c:214: GAME_BOARD[last_empty_cell] = PLAYER2;
	ld	de,#_GAME_BOARD
	ld	l,c
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#9
	ld	(hl+),a
	ld	(hl),d
;Title_screen.c:213: if (computer_score == 2 && player_score == 0) {
	ldhl	sp,#3
	ld	a,(hl)
	sub	a, #0x02
	jr	NZ,00107$
	ldhl	sp,#6
	ld	a,(hl)
	or	a, a
	jr	NZ,00107$
;Title_screen.c:214: GAME_BOARD[last_empty_cell] = PLAYER2;
	ldhl	sp,#9
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x6F
;Title_screen.c:215: return;
	jp	00119$
00107$:
;Title_screen.c:217: if (player_score == 2 && computer_score == 0) {
	ld	a,b
	sub	a, #0x02
	jr	NZ,00118$
	ldhl	sp,#7
	ld	a,(hl)
	or	a, a
	jr	NZ,00118$
;Title_screen.c:218: loose_cell = last_empty_cell;
	ldhl	sp,#2
	ld	(hl),c
00118$:
;Title_screen.c:196: for (y = 0 ; y < 3 ; y += 1) {
	ldhl	sp,#5
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x03
	jp	C,00124$
;Title_screen.c:222: if (loose_cell != -1) {
	ldhl	sp,#2
	ld	a,(hl)
	inc	a
	jr	Z,00114$
;Title_screen.c:223: GAME_BOARD[loose_cell] = PLAYER2;
	ld	de,#_GAME_BOARD
	ldhl	sp,#2
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,#0x6F
	ld	(bc),a
;Title_screen.c:224: return;
	jr	00119$
00114$:
;Title_screen.c:227: GAME_BOARD[last_empty_cell] = PLAYER2;
	ldhl	sp,#9
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x6F
00119$:
	add	sp, #11
	ret
;Title_screen.c:230: void	game(void)
;	---------------------------------
; Function game
; ---------------------------------
_game::
;Title_screen.c:232: init();
	call	_init
;Title_screen.c:233: draw_board();
	call	_draw_board
;Title_screen.c:234: while(1)
00102$:
;Title_screen.c:236: player_play();
	call	_player_play
;Title_screen.c:237: update();
	call	_update
;Title_screen.c:238: computer_play();
	call	_computer_play
;Title_screen.c:239: update();
	call	_update
	jr	00102$
	ret
;Title_screen.c:243: void	game2(void)
;	---------------------------------
; Function game2
; ---------------------------------
_game2::
;Title_screen.c:245: init();
	call	_init
;Title_screen.c:246: draw_board();
	call	_draw_board
;Title_screen.c:247: while(1)
00102$:
;Title_screen.c:249: player_play();
	call	_player_play
;Title_screen.c:250: update();
	call	_update
;Title_screen.c:251: player2_play();
	call	_player2_play
;Title_screen.c:252: update();
	call	_update
	jr	00102$
	ret
;Title_screen.c:256: void	title_screen()
;	---------------------------------
; Function title_screen
; ---------------------------------
_title_screen::
;Title_screen.c:258: clear_screen();
	call	_clear_screen
;Title_screen.c:259: gotoxy(4, 5);
	ld	hl,#0x0504
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:260: printf("Tic Tac Toe !");
	ld	de,#___str_4
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:261: gotoxy(3, 15);
	ld	hl,#0x0F03
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:262: printf("- PRESS START -");
	ld	de,#___str_5
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:263: waitpad(J_START);
	ld	a,#0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;Title_screen.c:264: waitpadup();
	jp	_waitpadup
___str_4:
	.ascii "Tic Tac Toe !"
	.db 0x00
___str_5:
	.ascii "- PRESS START -"
	.db 0x00
;Title_screen.c:267: void	mode_screen(UINT8 y)
;	---------------------------------
; Function mode_screen
; ---------------------------------
_mode_screen::
;Title_screen.c:269: gotoxy(3, 7);
	ld	hl,#0x0703
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:270: setchar(' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_setchar
	inc	sp
;Title_screen.c:271: gotoxy(3, 8);
	ld	hl,#0x0803
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:272: setchar(' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_setchar
	inc	sp
;Title_screen.c:273: gotoxy(3, 9);
	ld	hl,#0x0903
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:274: setchar(' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_setchar
	inc	sp
;Title_screen.c:275: gotoxy(3, 7 + y);
	ldhl	sp,#2
	ld	a,(hl)
	add	a, #0x07
	push	af
	inc	sp
	ld	a,#0x03
	push	af
	inc	sp
	call	_gotoxy
	add	sp, #2
;Title_screen.c:276: setchar('>');
	ld	a,#0x3E
	push	af
	inc	sp
	call	_setchar
	inc	sp
	ret
;Title_screen.c:279: void	select_mode()
;	---------------------------------
; Function select_mode
; ---------------------------------
_select_mode::
	add	sp, #-2
;Title_screen.c:284: clear_screen();
	call	_clear_screen
;Title_screen.c:285: gotoxy(3, 5);
	ld	hl,#0x0503
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:286: printf("Select a mode :");
	ld	de,#___str_6
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:287: gotoxy(4, 7);
	ld	hl,#0x0704
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:288: printf("1 Player");
	ld	de,#___str_7
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:289: gotoxy(4, 8);
	ld	hl,#0x0804
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:290: printf("2 Players");
	ld	de,#___str_8
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:291: gotoxy(4, 9);
	ld	hl,#0x0904
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:292: printf("Return");
	ld	de,#___str_9
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:294: mode = 0;
	ld	b,#0x00
;Title_screen.c:295: while (1)
00117$:
;Title_screen.c:297: mode_screen(mode);
	push	bc
	push	bc
	inc	sp
	call	_mode_screen
	inc	sp
	pop	bc
;Title_screen.c:298: key = waitpad(J_A | J_B | J_START | J_UP | J_DOWN);
	push	bc
	ld	a,#0xBC
	push	af
	inc	sp
	call	_waitpad
	inc	sp
	pop	bc
;Title_screen.c:299: if (key == J_B)
	ldhl	sp,#0
	ld	(hl),e
	inc	hl
	ld	(hl),#0x00
	dec	hl
	ld	a,(hl)
	sub	a, #0x20
	jr	NZ,00102$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00102$
;Title_screen.c:301: title_screen();
	call	_title_screen
;Title_screen.c:302: return ;
	jp	00119$
00102$:
;Title_screen.c:304: if (key == J_DOWN && mode != 2)
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x08
	jr	NZ,00104$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00104$
	ld	a,b
	sub	a, #0x02
	jr	Z,00104$
;Title_screen.c:306: mode++;
	inc	b
;Title_screen.c:307: mode_screen(mode);
	push	bc
	push	bc
	inc	sp
	call	_mode_screen
	inc	sp
	pop	bc
00104$:
;Title_screen.c:309: if (key == J_UP && mode != 0)
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x04
	jr	NZ,00107$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00107$
	ld	a,b
	or	a, a
	jr	Z,00107$
;Title_screen.c:311: mode--;
	dec	b
;Title_screen.c:312: mode_screen(mode);
	push	bc
	push	bc
	inc	sp
	call	_mode_screen
	inc	sp
	pop	bc
00107$:
;Title_screen.c:314: if (key == J_A || key == J_START)
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x10
	jr	NZ,00160$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00113$
00160$:
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x80
	jr	NZ,00114$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00114$
00113$:
;Title_screen.c:316: switch (mode)
	ld	a,#0x02
	sub	a, b
	jr	C,00114$
	ld	e,b
	ld	d,#0x00
	ld	hl,#00163$
	add	hl,de
	add	hl,de
;Title_screen.c:318: case 0:
	jp	(hl)
00163$:
	jr	00109$
	jr	00110$
	jr	00119$
00109$:
;Title_screen.c:319: game();
	call	_game
;Title_screen.c:320: case 1:
00110$:
;Title_screen.c:321: game2();
	call	_game2
;Title_screen.c:322: case 2:
;Title_screen.c:323: return ;
	jr	00119$
;Title_screen.c:324: }
00114$:
;Title_screen.c:326: waitpadup();
	push	bc
	call	_waitpadup
	pop	bc
	jp	00117$
00119$:
	add	sp, #2
	ret
___str_6:
	.ascii "Select a mode :"
	.db 0x00
___str_7:
	.ascii "1 Player"
	.db 0x00
___str_8:
	.ascii "2 Players"
	.db 0x00
___str_9:
	.ascii "Return"
	.db 0x00
;Title_screen.c:330: void	main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;Title_screen.c:332: while (1)
00102$:
;Title_screen.c:334: title_screen();
	call	_title_screen
;Title_screen.c:335: select_mode();
	call	_select_mode
	jr	00102$
	ret
	.area _CODE
	.area _CABS (ABS)

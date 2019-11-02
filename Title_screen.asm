;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Sat Nov  2 18:58:13 2019
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
	.globl _game
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
;Title_screen.c:186: void	game(void)
;	---------------------------------
; Function game
; ---------------------------------
_game::
;Title_screen.c:188: init();
	call	_init
;Title_screen.c:189: draw_board();
	call	_draw_board
;Title_screen.c:190: while(1)
00102$:
;Title_screen.c:192: player_play();
	call	_player_play
;Title_screen.c:193: update();
	call	_update
;Title_screen.c:194: player2_play();
	call	_player2_play
;Title_screen.c:195: update();
	call	_update
	jr	00102$
	ret
;Title_screen.c:199: void	title_screen()
;	---------------------------------
; Function title_screen
; ---------------------------------
_title_screen::
;Title_screen.c:201: clear_screen();
	call	_clear_screen
;Title_screen.c:202: gotoxy(4, 5);
	ld	hl,#0x0504
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:203: printf("Tic Tac Toe !");
	ld	de,#___str_4
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:204: gotoxy(3, 15);
	ld	hl,#0x0F03
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:205: printf("- PRESS START -");
	ld	de,#___str_5
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:206: waitpad(J_START);
	ld	a,#0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;Title_screen.c:207: waitpadup();
	jp	_waitpadup
___str_4:
	.ascii "Tic Tac Toe !"
	.db 0x00
___str_5:
	.ascii "- PRESS START -"
	.db 0x00
;Title_screen.c:210: void	mode_screen(UINT8 y)
;	---------------------------------
; Function mode_screen
; ---------------------------------
_mode_screen::
;Title_screen.c:212: gotoxy(3, 7);
	ld	hl,#0x0703
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:213: setchar(' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_setchar
	inc	sp
;Title_screen.c:214: gotoxy(3, 8);
	ld	hl,#0x0803
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:215: setchar(' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_setchar
	inc	sp
;Title_screen.c:216: gotoxy(3, 9);
	ld	hl,#0x0903
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:217: setchar(' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_setchar
	inc	sp
;Title_screen.c:218: gotoxy(3, 7 + y);
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
;Title_screen.c:219: setchar('>');
	ld	a,#0x3E
	push	af
	inc	sp
	call	_setchar
	inc	sp
	ret
;Title_screen.c:222: void	select_mode()
;	---------------------------------
; Function select_mode
; ---------------------------------
_select_mode::
	add	sp, #-2
;Title_screen.c:227: clear_screen();
	call	_clear_screen
;Title_screen.c:228: gotoxy(3, 5);
	ld	hl,#0x0503
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:229: printf("Select a mode :");
	ld	de,#___str_6
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:230: gotoxy(4, 7);
	ld	hl,#0x0704
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:231: printf("1 Player");
	ld	de,#___str_7
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:232: gotoxy(4, 8);
	ld	hl,#0x0804
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:233: printf("2 Players");
	ld	de,#___str_8
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:234: gotoxy(4, 9);
	ld	hl,#0x0904
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:235: printf("Return");
	ld	de,#___str_9
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:237: mode = 0;
	ld	b,#0x00
;Title_screen.c:238: while (1)
00116$:
;Title_screen.c:240: mode_screen(mode);
	push	bc
	push	bc
	inc	sp
	call	_mode_screen
	inc	sp
	pop	bc
;Title_screen.c:241: key = waitpad(J_A | J_B | J_UP | J_DOWN);
	push	bc
	ld	a,#0x3C
	push	af
	inc	sp
	call	_waitpad
	inc	sp
	pop	bc
;Title_screen.c:242: if (key == J_B)
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
;Title_screen.c:244: title_screen();
	call	_title_screen
;Title_screen.c:245: return ;
	jp	00118$
00102$:
;Title_screen.c:247: if (key == J_DOWN && mode != 2)
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
;Title_screen.c:249: mode++;
	inc	b
;Title_screen.c:250: mode_screen(mode);
	push	bc
	push	bc
	inc	sp
	call	_mode_screen
	inc	sp
	pop	bc
00104$:
;Title_screen.c:252: if (key == J_UP && mode != 0)
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
;Title_screen.c:254: mode--;
	dec	b
;Title_screen.c:255: mode_screen(mode);
	push	bc
	push	bc
	inc	sp
	call	_mode_screen
	inc	sp
	pop	bc
00107$:
;Title_screen.c:257: if (key == J_A)
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x10
	jr	NZ,00114$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00114$
;Title_screen.c:259: switch (mode)
	ld	a,#0x02
	sub	a, b
	jr	C,00114$
	ld	e,b
	ld	d,#0x00
	ld	hl,#00161$
	add	hl,de
	add	hl,de
;Title_screen.c:261: case 0:
	jp	(hl)
00161$:
	jr	00109$
	jr	00110$
	jr	00118$
00109$:
;Title_screen.c:262: game();
	call	_game
;Title_screen.c:263: case 1:
00110$:
;Title_screen.c:264: game();
	call	_game
;Title_screen.c:265: case 2:
;Title_screen.c:266: return ;
	jr	00118$
;Title_screen.c:267: }
00114$:
;Title_screen.c:269: waitpadup();
	push	bc
	call	_waitpadup
	pop	bc
	jp	00116$
00118$:
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
;Title_screen.c:273: void	main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;Title_screen.c:275: while (1)
00102$:
;Title_screen.c:277: title_screen();
	call	_title_screen
;Title_screen.c:278: select_mode();
	call	_select_mode
	jr	00102$
	ret
	.area _CODE
	.area _CABS (ABS)

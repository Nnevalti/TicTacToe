;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Sat Nov  2 15:06:52 2019
;--------------------------------------------------------
	.module Title_screen
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _update
	.globl _draw_cursor
	.globl _init
	.globl _coord_2d_to_1d
	.globl _draw_board
	.globl _title_screen
	.globl _clear_screen
	.globl _setchar
	.globl _gotoxy
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
;Title_screen.c:24: void	clear_screen()
;	---------------------------------
; Function clear_screen
; ---------------------------------
_clear_screen::
;Title_screen.c:28: while (y)
	ld	b,#0x12
00104$:
	ld	a,b
	or	a, a
	ret	Z
;Title_screen.c:30: y -= 1;
	dec	b
;Title_screen.c:32: while (x)
	ld	c,#0x14
00101$:
	ld	a,c
	or	a, a
	jr	Z,00104$
;Title_screen.c:34: x -= 1;
	dec	c
;Title_screen.c:35: gotoxy(x, y);
	push	bc
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_gotoxy
	add	sp, #2
	pop	bc
;Title_screen.c:36: setchar(' ');
	push	bc
	ld	a,#0x20
	push	af
	inc	sp
	call	_setchar
	inc	sp
	pop	bc
	jr	00101$
	ret
;Title_screen.c:41: void	title_screen()
;	---------------------------------
; Function title_screen
; ---------------------------------
_title_screen::
;Title_screen.c:43: clear_screen();
	call	_clear_screen
;Title_screen.c:44: gotoxy(4, 5);
	ld	hl,#0x0504
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:45: printf("Tic Tac Toe !");
	ld	de,#___str_0
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:46: gotoxy(3, 15);
	ld	hl,#0x0F03
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:47: printf("- PRESS START -");
	ld	de,#___str_1
	push	de
	call	_printf
	add	sp, #2
	ret
___str_0:
	.ascii "Tic Tac Toe !"
	.db 0x00
___str_1:
	.ascii "- PRESS START -"
	.db 0x00
;Title_screen.c:50: void	draw_board(void)
;	---------------------------------
; Function draw_board
; ---------------------------------
_draw_board::
;Title_screen.c:52: gotoxy(4, 1);
	ld	hl,#0x0104
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:53: printf("Tic Tac Toe");
	ld	de,#___str_2
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:54: gotoxy(1, 17);
	ld	hl,#0x1101
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:55: printf("X you - O Computer");
	ld	de,#___str_3
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:56: gotoxy(0, 4);
	ld	hl,#0x0400
	push	hl
	call	_gotoxy
	add	sp, #2
;Title_screen.c:57: printf("       |   |   \n");
	ld	de,#___str_4
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:58: printf("       |   |   \n");
	ld	de,#___str_4
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:59: printf("       |   |   \n");
	ld	de,#___str_4
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:60: printf("    ---+---+---\n");
	ld	de,#___str_5
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:61: printf("       |   |   \n");
	ld	de,#___str_4
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:62: printf("       |   |   \n");
	ld	de,#___str_4
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:63: printf("       |   |   \n");
	ld	de,#___str_4
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:64: printf("    ---+---+---\n");
	ld	de,#___str_5
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:65: printf("       |   |   \n");
	ld	de,#___str_4
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:66: printf("       |   |   \n");
	ld	de,#___str_4
	push	de
	call	_printf
	add	sp, #2
;Title_screen.c:67: printf("       |   |   \n");
	ld	de,#___str_4
	push	de
	call	_printf
	add	sp, #2
	ret
___str_2:
	.ascii "Tic Tac Toe"
	.db 0x00
___str_3:
	.ascii "X you - O Computer"
	.db 0x00
___str_4:
	.ascii "       |   |   "
	.db 0x0A
	.db 0x00
___str_5:
	.ascii "    ---+---+---"
	.db 0x0A
	.db 0x00
;Title_screen.c:70: UINT8	coord_2d_to_1d(UINT8 x, UINT8 y)
;	---------------------------------
; Function coord_2d_to_1d
; ---------------------------------
_coord_2d_to_1d::
;Title_screen.c:72: return y * 3 + x;
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
;Title_screen.c:75: void	init(void)
;	---------------------------------
; Function init
; ---------------------------------
_init::
	dec	sp
;Title_screen.c:79: while(i < 9)
	ldhl	sp,#0
	ld	(hl),#0x00
00101$:
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, #0x09
	jr	NC,00103$
;Title_screen.c:81: GAME_BOARD[i++] = EMPTY;
	ld	b,(hl)
	inc	(hl)
	ld	a,#<(_GAME_BOARD)
	add	a, b
	ld	c,a
	ld	a,#>(_GAME_BOARD)
	adc	a, #0x00
	ld	b,a
	ld	a,#0x20
	ld	(bc),a
	jr	00101$
00103$:
;Title_screen.c:84: GAME_CURSOR_X = 1;
	ld	hl,#_GAME_CURSOR_X
	ld	(hl),#0x01
;Title_screen.c:85: GAME_CURSOR_Y = 1;
	ld	hl,#_GAME_CURSOR_Y
	ld	(hl),#0x01
	inc	sp
	ret
;Title_screen.c:88: void	draw_cursor(UINT8 cursor_char)
;	---------------------------------
; Function draw_cursor
; ---------------------------------
_draw_cursor::
	add	sp, #-9
;Title_screen.c:90: UINT8 graph_x = GAME_CURSOR_X * 4 + 5;
	ld	hl,#_GAME_CURSOR_X
	ld	a,(hl)
	add	a, a
	add	a, a
	add	a, #0x05
	ldhl	sp,#1
	ld	(hl),a
;Title_screen.c:91: UINT8 graph_y = GAME_CURSOR_Y * 4 + 5;
	ld	hl,#_GAME_CURSOR_Y
	ld	a,(hl)
	add	a, a
	add	a, a
	add	a, #0x05
	ldhl	sp,#0
	ld	(hl),a
;Title_screen.c:95: for (cy = graph_y - 1 ; cy <= graph_y + 1 ; cy ++)
	ld	a,(hl)
	add	a,#0xFF
	ldhl	sp,#5
	ld	(hl),a
	ldhl	sp,#1
	ld	a,(hl)
	add	a,#0xFF
	inc	hl
	ld	(hl),a
00110$:
	ldhl	sp,#0
	ld	c,(hl)
	ld	b,#0x00
	inc	bc
	ldhl	sp,#3
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	b,(hl)
	ld	c,#0x00
	dec	hl
	dec	hl
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
;Title_screen.c:97: for (cx = graph_x - 1 ; cx <= graph_x + 1 ; cx++)
	push	hl
	ldhl	sp,#4
	ld	a,(hl+)
	ld	(hl),a
	pop	hl
	ldhl	sp,#0
	ld	a,(hl)
	ldhl	sp,#5
	sub	a, (hl)
	jr	NZ,00138$
	ld	a,#0x01
	jr	00139$
00138$:
	xor	a,a
00139$:
	ldhl	sp,#6
	ld	(hl),a
00108$:
	ldhl	sp,#1
	ld	c,(hl)
	ld	b,#0x00
	inc	bc
	inc	hl
	inc	hl
	ld	a,(hl)
	ldhl	sp,#7
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
;Title_screen.c:99: if (cx == graph_x && cy == graph_y)
	ldhl	sp,#1
	ld	a,(hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ,00102$
	ldhl	sp,#6
	ld	a,(hl)
	or	a, a
	jr	NZ,00104$
;Title_screen.c:100: continue ;
00102$:
;Title_screen.c:101: gotoxy(cx, cy);
	ldhl	sp,#5
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	call	_gotoxy
	add	sp, #2
;Title_screen.c:102: setchar(cursor_char);
	ldhl	sp,#11
	ld	a,(hl)
	push	af
	inc	sp
	call	_setchar
	inc	sp
00104$:
;Title_screen.c:97: for (cx = graph_x - 1 ; cx <= graph_x + 1 ; cx++)
	ldhl	sp,#3
	inc	(hl)
	jp	00108$
00111$:
;Title_screen.c:95: for (cy = graph_y - 1 ; cy <= graph_y + 1 ; cy ++)
	ldhl	sp,#5
	inc	(hl)
	jp	00110$
00112$:
	add	sp, #9
	ret
;Title_screen.c:108: void	update(void)
;	---------------------------------
; Function update
; ---------------------------------
_update::
	add	sp, #-4
;Title_screen.c:111: UINT8	x = 0;
	ld	b,#0x00
;Title_screen.c:116: while (y < 3)
	ld	c,#0x00
00104$:
;Title_screen.c:118: while (x < 3)
	ld	a,c
	cp	a,#0x03
	jp	NC,00107$
	add	a, a
	add	a, a
	add	a, #0x05
	ldhl	sp,#3
	ld	(hl),a
00101$:
	ld	a,b
	sub	a, #0x03
	jp	NC,00112$
;Title_screen.c:120: i = coord_2d_to_1d(x, y);
	push	bc
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_coord_2d_to_1d
	add	sp, #2
	pop	bc
	ldhl	sp,#0
	ld	(hl),e
;Title_screen.c:121: graph_x = x * 4 + 5;
	ld	a,b
	add	a, a
	add	a, a
	add	a, #0x05
	ld	d,a
;Title_screen.c:123: gotoxy(graph_x, graph_y);
	push	bc
	ldhl	sp,#5
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_gotoxy
	add	sp, #2
	pop	bc
;Title_screen.c:124: setchar(GAME_BOARD[i]);
	ld	de,#_GAME_BOARD
	ldhl	sp,#0
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#1
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
;Title_screen.c:125: x++;
	inc	b
	jp	00101$
00112$:
;Title_screen.c:127: y++;
	inc	c
	jp	00104$
00107$:
	add	sp, #4
	ret
;Title_screen.c:132: void	main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;Title_screen.c:134: title_screen(); // Title screen
	call	_title_screen
;Title_screen.c:135: waitpad(J_START); // Wait for start to be pressed
	ld	a,#0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;Title_screen.c:136: clear_screen(); // clear tiles
	call	_clear_screen
;Title_screen.c:137: init(); // Init varaiables for the game
	call	_init
;Title_screen.c:138: draw_board(); // Draw the game board
	call	_draw_board
;Title_screen.c:139: draw_cursor('!');
	ld	a,#0x21
	push	af
	inc	sp
	call	_draw_cursor
	inc	sp
;Title_screen.c:140: GAME_BOARD[0] = PLAYER;
	ld	hl,#_GAME_BOARD
	ld	(hl),#0x78
;Title_screen.c:141: GAME_BOARD[1] = COMPUTER;
	ld	hl,#(_GAME_BOARD + 0x0001)
	ld	(hl),#0x6F
;Title_screen.c:142: update();
	call	_update
;Title_screen.c:143: waitpad(J_START);
	ld	a,#0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;Title_screen.c:144: GAME_BOARD[1] = EMPTY;
	ld	hl,#(_GAME_BOARD + 0x0001)
	ld	(hl),#0x20
;Title_screen.c:145: update();
	jp	_update
	.area _CODE
	.area _CABS (ABS)

/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   Title_screen.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vdescham <vdescham@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/02 13:58:21 by vdescham          #+#    #+#             */
/*   Updated: 2019/11/02 18:49:55 by vdescham         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <gb/gb.h>
#include <gb/console.h>

#define EMPTY		' '
#define PLAYER		'x'
#define PLAYER2		'o'

UINT8 GAME_BOARD[9];
UINT8 GAME_CURSOR_X;
UINT8 GAME_CURSOR_Y;

void	clear_screen(void)
{
	UINT8	x;
	UINT8	y = 18;
	while (y)
	{
		y -= 1;
		x = 20;
		while (x)
		{
			x -= 1;
			gotoxy(x, y);
			setchar(' ');
		}
	}
}

UINT8	coord_2d_to_1d(UINT8 x, UINT8 y)
{
	return y * 3 + x;
}

void	init(void)
{
	UINT8 i;

	for (i = 0 ; i < 9 ; i++)
	{
		GAME_BOARD[i] = EMPTY;
	}

	GAME_CURSOR_X = 1;
	GAME_CURSOR_Y = 1;
}

void	draw_board(void)
{
	clear_screen();
	gotoxy(4, 1);
	printf("Tic Tac Toe");
	gotoxy(1, 17);
	printf("X you - O Computer");
	gotoxy(0, 4);
	printf("       |   |   \n");
	printf("       |   |   \n");
	printf("       |   |   \n");
	printf("    ---+---+---\n");
	printf("       |   |   \n");
	printf("       |   |   \n");
	printf("       |   |   \n");
	printf("    ---+---+---\n");
	printf("       |   |   \n");
	printf("       |   |   \n");
	printf("       |   |   \n");
}

void	update(void)
{
	UINT8	i;
	UINT8	x;
	UINT8	y;
	UINT8	graph_x;
	UINT8	graph_y;

	for (y = 0 ; y < 3 ; y++)
	{
		for (x = 0 ; x < 3 ; x++)
		{
			i = coord_2d_to_1d(x, y);
			graph_x = 4 + x * 4 + 1;
			graph_y = 4 + y * 4 + 1;
			gotoxy(graph_x, graph_y);
			setchar(GAME_BOARD[i]);
		}
	}
}

void	draw_cursor(UINT8 cursor_char)
{
	UINT8 graph_x = GAME_CURSOR_X * 4 + 5;
	UINT8 graph_y = GAME_CURSOR_Y * 4 + 5;

	UINT8 cx;
	UINT8 cy;
	for (cy = graph_y - 1 ; cy <= graph_y + 1 ; cy ++)
	{
		for (cx = graph_x - 1 ; cx <= graph_x + 1 ; cx++)
		{
			if (cx == graph_x && cy == graph_y)
				continue ;
			gotoxy(cx, cy);
			setchar(cursor_char);
		}
	}

}

void	player_play(void)
{
	UINT8 key;
	UINT8 i;

	while (1)
	{
		draw_cursor('/');
		key = waitpad(J_UP | J_DOWN | J_LEFT | J_RIGHT | J_A);
		draw_cursor(' ');

		if (key == J_UP && GAME_CURSOR_Y != 0)
			GAME_CURSOR_Y--;
		if (key == J_DOWN && GAME_CURSOR_Y != 2)
			GAME_CURSOR_Y++;
		if (key == J_LEFT && GAME_CURSOR_X != 0)
			GAME_CURSOR_X--;
		if (key == J_RIGHT && GAME_CURSOR_X != 2)
			GAME_CURSOR_X++;
		if (key == J_A)
		{
			i = coord_2d_to_1d(GAME_CURSOR_X, GAME_CURSOR_Y);
			if (GAME_BOARD[i] == EMPTY)
			{
				GAME_BOARD[i] = PLAYER;
				break ;
			}
		}
		waitpadup();
	}
}

void	player2_play(void)
{
	UINT8 key;
	UINT8 i;

	while (1)
	{
		draw_cursor('/');
		key = waitpad(J_UP | J_DOWN | J_LEFT | J_RIGHT | J_A);
		draw_cursor(' ');

		if (key == J_UP && GAME_CURSOR_Y != 0)
			GAME_CURSOR_Y--;
		if (key == J_DOWN && GAME_CURSOR_Y != 2)
			GAME_CURSOR_Y++;
		if (key == J_LEFT && GAME_CURSOR_X != 0)
			GAME_CURSOR_X--;
		if (key == J_RIGHT && GAME_CURSOR_X != 2)
			GAME_CURSOR_X++;
		if (key == J_A)
		{
			i = coord_2d_to_1d(GAME_CURSOR_X, GAME_CURSOR_Y);
			if (GAME_BOARD[i] == EMPTY)
			{
				GAME_BOARD[i] = PLAYER2;
				break ;
			}
		}
		waitpadup();
	}
}

void	game(void)
{
	init();
	draw_board();
	while(1)
	{
		player_play();
		update();
		player2_play();
		update();
	}
}

void	title_screen()
{
	clear_screen();
	gotoxy(4, 5);
	printf("Tic Tac Toe !");
	gotoxy(3, 15);
	printf("- PRESS START -");
	waitpad(J_START);
	waitpadup();
}

void	mode_screen(UINT8 y)
{
	clear_screen();
	gotoxy(3, 5 + y);
	setchar('>');
	gotoxy(4, 5);
	printf("1 Player");
	gotoxy(4, 6);
	printf("2 Players");
	gotoxy(4, 7);
	printf("Return");
}

void	select_mode()
{
	UINT8 key;
	UINT8 mode;

	mode = 0;
	while (1)
	{
		mode_screen(mode);
		key = waitpad(J_A | J_B | J_UP | J_DOWN);
		if (key == J_B)
		{
			title_screen();
			return ;
		}
		if (key == J_DOWN && mode != 2)
		{
			mode++;
			mode_screen(mode);
		}
		if (key == J_UP && mode != 0)
		{
			mode--;
			mode_screen(mode);
		}
		if (key == J_A)
		{
			switch (mode)
			{
				case 0:
					game();
				case 1:
					game();
				case 2:
					return ;
			}
		}
	}
}

void	main(void)
{
	while (1)
	{
		title_screen();
		select_mode();
	}
}

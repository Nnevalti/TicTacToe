/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   hello.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vdescham <vdescham@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/02 12:01:08 by vdescham          #+#    #+#             */
/*   Updated: 2019/11/02 13:28:32 by vdescham         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <gb/gb.h>

void	main()
{
	UINT8 keys;
	UINT8 prev_keys = 0;

	printf("Press START :\n");
	waitpad(J_START);
	waitpadup();
	printf("Press SELECT :\n");
	waitpad(J_SELECT);
	printf("Press A(s) :\n");
	waitpad(J_A);
	printf("Press B(a) :\n");
	waitpad(J_B);
	printf("Press UP :\n");
	waitpad(J_UP);
	printf("Press DOWN :\n");
	waitpad(J_DOWN);
	printf("Press LEFT :\n");
	waitpad(J_LEFT);
	printf("Press RIGHT :\n");
	waitpad(J_RIGHT);
	printf("Press f\n");
	while (1)
	{
		keys = joypad();
		if (keys == J_A && prev_keys != J_A)
		{
			printf("You pressed A\n");
		}
		if (keys == J_B && prev_keys != J_B)
		{
			printf("You pressed B\n");
		}
		if (keys == J_UP)
		{
			printf("You pressed UP (walk forward)\n");
		}
		prev_keys = keys;

		wait_vbl_done();
	}
}

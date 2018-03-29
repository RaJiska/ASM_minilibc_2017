/*
** EPITECH PROJECT, 2018
** Test
** File description:
** Test
*/

#include "tests.h"

Test(libasm, strlen, .init = setup)
{
	cr_assert_eq(fncs.my_strlen("Hello World"), 11);
	cr_assert_eq(fncs.my_strlen("How are you today ?"), 19);
	cr_assert_eq(fncs.my_strlen(""), 0);
}
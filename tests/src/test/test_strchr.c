/*
** EPITECH PROJECT, 2018
** Test
** File description:
** Test
*/

#include "tests.h"

Test(libasm, strchr, .init = setup)
{
	const char *str = "Hello World";

	cr_assert_eq(fncs.my_strchr(str, 'H'), str);
	cr_assert_eq(fncs.my_strchr(str, 'W'), str + 6);
	cr_assert_eq(fncs.my_strchr(str, 0), str + strlen(str));
	cr_assert_eq(fncs.my_strchr(str, 'X'), NULL);
}
/*
** EPITECH PROJECT, 2018
** Test
** File description:
** Test
*/

#include "tests.h"

Test(libasm, rindex, .init = setup)
{
	const char *str = "Hello World";
	const char *stupid_str = "";

	cr_assert_eq(fncs.my_rindex(str, 'W'), str + 6);
	cr_assert_eq(fncs.my_rindex(str, 'o'), str + 7);
	cr_assert_eq(fncs.my_rindex(str, 'l'), str + 9);
	cr_assert_eq(fncs.my_rindex(str, 0), str + 11);
	cr_assert_eq(fncs.my_rindex(str, 'A'), NULL);
	cr_assert_eq(fncs.my_rindex(str, 'a'), NULL);
	cr_assert_eq(fncs.my_rindex(stupid_str, 0), stupid_str);
	cr_assert_eq(fncs.my_rindex(stupid_str, 10), NULL);
}
/*
** EPITECH PROJECT, 2018
** Test
** File description:
** Test
*/

#include "tests.h"

Test(libasm, strcspn, .init = setup)
{
	const char *str = "Hello World";
	const char *stupid_str = "";

	cr_assert_eq(fncs.my_strcspn(str, "Wa"), 6);
	cr_assert_eq(fncs.my_strcspn(str, "ooooosssss"), 4);
	cr_assert_eq(fncs.my_strcspn(str, "lllfc"), 2);
	cr_assert_eq(fncs.my_strcspn(str, "An,;564"), 11);
	cr_assert_eq(fncs.my_strcspn(str, "dlH"), 0);
	cr_assert_eq(fncs.my_strcspn(str, ""), 11);
	cr_assert_eq(fncs.my_strcspn(stupid_str, ""), 0);
	cr_assert_eq(fncs.my_strcspn(stupid_str, "Petou"), 0);
}
/*
** EPITECH PROJECT, 2018
** test
** File description:
** test
*/

#include "tests.h"

Test(libasm, strpbrk, .init = setup)
{
	const char *str = "Hello World";

	cr_assert_eq(fncs.my_strpbrk(str, "hELLO"), NULL);
	cr_assert_eq(fncs.my_strpbrk(str, "rello"), str + 1);
	cr_assert_eq(fncs.my_strpbrk(str, "vcxo"), str + 4);
	cr_assert_eq(fncs.my_strpbrk(str, ""), NULL);
	cr_assert_eq(fncs.my_strpbrk("", ""), NULL);
	cr_assert_eq(fncs.my_strpbrk("", "dazkdjzldj"), NULL);
	cr_assert_eq(fncs.my_strpbrk(str, "vvvvvxxxxxdddddd"), str + 10);
	cr_assert_eq(fncs.my_strpbrk(str, "\0"), NULL);
}
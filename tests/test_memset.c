/*
** EPITECH PROJECT, 2018
** test
** File description:
** test
*/

#include "tests.h"

static int check_memset(const char *s, unsigned char val, size_t len)
{
	for (size_t it = 0; it < len; ++it)
	{
		if (s[it] != val)
			return (0);
	}
	return (1);
}

Test(libasm, memset, .init = setup)
{
	char str[] = "Hello World";
	const size_t len = sizeof(str);
	char *result;

	result = fncs.my_memset(str, 0, len);
	cr_assert_eq(check_memset(&str[0], 0, len) && result == &str[0], 1);
	result = fncs.my_memset(str, 1, len - len);
	cr_assert_eq(check_memset(&str[0], 0, len) && result == &str[0], 1);
	result = fncs.my_memset(str, 2, len - 1);
	cr_assert_neq(check_memset(&str[0], 0, len) && result == &str[0], 1);
}
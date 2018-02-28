/*
** EPITECH PROJECT, 2018
** test
** File description:
** test
*/

#include "tests.h"

Test(libasm, strcmp, .init = setup)
{
	cr_assert_eq(fncs.my_strcmp("Hello World", "Hello World"), 0);
	cr_assert_lt(fncs.my_strcmp("Hello World", "Hello WorldA"), 0);
	cr_assert_lt(fncs.my_strcmp("Hello World", "Hello WorldB"), 0);
	cr_assert_gt(fncs.my_strcmp("Hello WorldA", "Hello World"), 0);
	cr_assert_gt(fncs.my_strcmp("Hello WorldB", "Hello World"), 0);
	cr_assert_lt(fncs.my_strcmp("Hello WorldA", "Hello WorldB"), 0);
	cr_assert_lt(fncs.my_strcmp("Hello WorldB", "Hello WorldC"), 0);
	cr_assert_gt(fncs.my_strcmp("Hello WorldB", "Hello WorldA"), 0);
	cr_assert_gt(fncs.my_strcmp("Hello WorldC", "Hello WorldB"), 0);
}
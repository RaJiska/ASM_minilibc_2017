/*
** EPITECH PROJECT, 2018
** test
** File description:
** test
*/

#include "tests.h"

Test(libasm, strcmp)
{
	cr_assert_eq(strcmp("Hello World", "Hello World"), 0);
	cr_assert_lt(strcmp("Hello World", "Hello WorldA"), 0);
	cr_assert_lt(strcmp("Hello World", "Hello WorldB"), 0);
	cr_assert_gt(strcmp("Hello WorldA", "Hello World"), 0);
	cr_assert_gt(strcmp("Hello WorldB", "Hello World"), 0);
	cr_assert_lt(strcmp("Hello WorldA", "Hello WorldB"), 0);
	cr_assert_lt(strcmp("Hello WorldB", "Hello WorldC"), 0);
	cr_assert_gt(strcmp("Hello WorldB", "Hello WorldA"), 0);
	cr_assert_gt(strcmp("Hello WorldC", "Hello WorldB"), 0);
}
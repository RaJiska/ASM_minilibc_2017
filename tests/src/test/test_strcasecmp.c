/*
** EPITECH PROJECT, 2018
** test
** File description:
** test
*/

#include "tests.h"

Test(libasm, strcasecmp, .init = setup)
{
	cr_assert_eq(fncs.my_strcasecmp("Hello World", "hello World"), 0);
	cr_assert_eq(fncs.my_strcasecmp("Hello WoRld", "hello world"), 0);
	cr_assert_lt(fncs.my_strcasecmp("Hello World", "Hello Worlda"), 0);
	cr_assert_lt(fncs.my_strcasecmp("Hello World", "Hello WorldB"), 0);
	cr_assert_gt(fncs.my_strcasecmp("Hello WorldA", "Hello WorlD"), 0);
	cr_assert_gt(fncs.my_strcasecmp("Hello WorldB", "Hello World"), 0);
	cr_assert_lt(fncs.my_strcasecmp("Hello WorldA", "Hello WorldB"), 0);
	cr_assert_lt(fncs.my_strcasecmp("Hello WorldB", "Hello WorldC"), 0);
	cr_assert_gt(fncs.my_strcasecmp("Hello WorldB", "Hello WorldA"), 0);
	cr_assert_gt(fncs.my_strcasecmp("Hello WorldC", "Hello WorldB"), 0);
}
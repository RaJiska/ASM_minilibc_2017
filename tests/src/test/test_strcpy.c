/*
** EPITECH PROJECT, 2018
** test
** File description:
** test
*/

#include "tests.h"

Test(libasm, strcpy, .init = setup)
{
	char buffer[1024] = { 0 };
	char *ret;

	buffer[32] = 1;
	ret = fncs.my_strcpy(&buffer[0], "Hello World, How are you today ?");
	cr_assert_eq(ret[32], 0);
	cr_assert_eq(ret, &buffer[0]);
	cr_assert_eq(utils_strcmp("Hello World, How are you today ?", ret), 1);
	buffer[19] = 1;
	ret = fncs.my_strcpy(&buffer[0], "I am fine and you ?");
	cr_assert_eq(ret[19], 0);
	cr_assert_eq(ret, &buffer[0]);
	cr_assert_eq(utils_strcmp("I am fine and you ?", ret), 1);

}
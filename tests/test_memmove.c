/*
** EPITECH PROJECT, 2018
** test
** File description:
** test
*/

#include "tests.h"

Test(libasm, memmove, .init = setup)
{
	char buffer[100] = { 1 };
	void *ret = fncs.my_memmove(&buffer[0], "abc", 4);

	cr_assert_eq(!strcmp(&buffer[0], "abc") && ret == &buffer[0], 1);
	strcpy(&buffer[0], "abcdefgh");
	ret = fncs.my_memmove(&buffer[1], "xyz", 2);
	cr_assert_eq(!strcmp(&buffer[0], "axydefgh") && ret == &buffer[1], 1);
	strcpy(&buffer[0], "abc");
	ret = fncs.my_memmove(&buffer[0], "xyz", 0);
	cr_assert_eq(!strcmp(&buffer[0], "abc") && ret == &buffer[0], 1);
	strcpy(&buffer[0], "abcdefgh");
	ret = fncs.my_memmove(&buffer[1], &buffer[0], 9);
	cr_assert_eq(!strcmp(&buffer[0], "aabcdefgh") && ret == &buffer[1], 1);
	strcpy(&buffer[0], "abcdefgh");
	ret = fncs.my_memmove(&buffer[1], &buffer[2], 7);
	cr_assert_eq(!strcmp(&buffer[0], "acdefgh") && ret == &buffer[1], 1);
	strcpy(&buffer[0], "abcdefgh");
	ret = fncs.my_memmove(&buffer[0], &buffer[0], 9);
	cr_assert_eq(!strcmp(&buffer[0], "abcdefgh") && ret == &buffer[0], 1);
}
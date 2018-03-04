/*
** EPITECH PROJECT, 2018
** Test
** File description:
** Test
*/

#include "tests.h"

Test(libasm, strstr, .init = setup)
{
	char buffer[100] = { 1 };

	cr_assert_eq(fncs.my_strstr("abcd", "z"), NULL);
	cr_assert_eq(fncs.my_strstr("abcd", "abx"), NULL);
	strcpy(&buffer[0], "abcd");
	cr_assert_eq(fncs.my_strstr(&buffer[0], "c"), &buffer[2]);
	cr_assert_eq(fncs.my_strstr(&buffer[0], "bc"), &buffer[1]);
	cr_assert_eq(fncs.my_strstr(&buffer[0], "d"), &buffer[3]);
	cr_assert_eq(fncs.my_strstr(&buffer[0], "cd"), &buffer[2]);
	cr_assert_eq(fncs.my_strstr(&buffer[0], "abc"), &buffer[0]);
	cr_assert_eq(fncs.my_strstr(&buffer[0], "abcd"), &buffer[0]);
	cr_assert_eq(fncs.my_strstr(&buffer[0], "abcde"), NULL);
	cr_assert_eq(fncs.my_strstr(&buffer[0], "de"), NULL);
	cr_assert_eq(fncs.my_strstr(&buffer[0], ""), &buffer[0]);
	strcpy(&buffer[0], "ababa");
	cr_assert_eq(fncs.my_strstr(&buffer[0], "ba"), &buffer[1]);
	strcpy(&buffer[0], "");
	cr_assert_eq(fncs.my_strstr(&buffer[0], ""), &buffer[0]);
	cr_assert_eq(fncs.my_strstr(&buffer[0], "b"), NULL);
	strcpy(&buffer[0], "bcbca");
	cr_assert_eq(fncs.my_strstr(&buffer[0], "bca"), &buffer[2]);
	strcpy(&buffer[0], "bbbcabbca");
	cr_assert_eq(fncs.my_strstr(&buffer[0], "bbca"), &buffer[1]);
}
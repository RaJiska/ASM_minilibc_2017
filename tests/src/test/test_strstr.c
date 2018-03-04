/*
** EPITECH PROJECT, 2018
** Test
** File description:
** Test
*/

#include "tests.h"

static void test_initial(char *buffer)
{
	strcpy(buffer, "abcd");
	cr_assert_eq(fncs.my_strstr(buffer, "c"), buffer + 2);
	cr_assert_eq(fncs.my_strstr(buffer, "bc"), buffer + 1);
	cr_assert_eq(fncs.my_strstr(buffer, "d"), buffer + 3);
	cr_assert_eq(fncs.my_strstr(buffer, "cd"), buffer + 2);
	cr_assert_eq(fncs.my_strstr(buffer, "abc"), buffer);
	cr_assert_eq(fncs.my_strstr(buffer, "abcd"), buffer);
	cr_assert_eq(fncs.my_strstr(buffer, "abcde"), NULL);
	cr_assert_eq(fncs.my_strstr(buffer, "de"), NULL);
	cr_assert_eq(fncs.my_strstr(buffer, ""), buffer);
}

Test(libasm, strstr, .init = setup)
{
	char buffer[100] = { 1 };

	cr_assert_eq(fncs.my_strstr("abcd", "z"), NULL);
	cr_assert_eq(fncs.my_strstr("abcd", "abx"), NULL);
	test_initial(&buffer[0]);
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
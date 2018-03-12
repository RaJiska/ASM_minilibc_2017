/*
** EPITECH PROJECT, 2018
** Test
** File description:
** Test
*/

#include "tests.h"

Test(libasm, strncmp, .init = setup)
{
	cr_assert_eq(fncs.my_strncmp("", "", 99), 0);
  	cr_assert_eq(fncs.my_strncmp("a", "a", 99), 0);
  	cr_assert_eq(fncs.my_strncmp("abc", "abc", 99), 0);
  	cr_assert_lt(fncs.my_strncmp("abc", "abcd", 99), 0);
  	cr_assert_gt(fncs.my_strncmp("abcd", "abc", 99), 0);
  	cr_assert_lt(fncs.my_strncmp("abcd", "abce", 99), 0);
  	cr_assert_gt(fncs.my_strncmp("abce", "abcd", 99), 0);
  	cr_assert_gt(fncs.my_strncmp("a\203", "a", 2), 0);
  	cr_assert_gt(fncs.my_strncmp("a\203", "a\003", 2), 0);
  	cr_assert_eq(fncs.my_strncmp("abce", "abcd", 3), 0);
  	cr_assert_eq(fncs.my_strncmp("abce", "abc", 3), 0);
  	cr_assert_lt(fncs.my_strncmp("abcd", "abce", 4), 0);
  	cr_assert_eq(fncs.my_strncmp("abc", "def", 0), 0);
  	cr_assert_gt(fncs.my_strncmp("abc", "", (size_t) -1), 0);
	cr_assert_eq(fncs.my_strncmp("abc", "abc", (size_t) -2), 0);
}
/*
** EPITECH PROJECT, 2018
** Test
** File description:
** Test
*/

#include "tests.h"

Test(libasm, strlen)
{
	cr_assert_eq(strlen("Hello World"), 11);
	cr_assert_eq(strlen("How are you today ?"), 19);
	cr_assert_eq(strlen(""), 0);
}
/*
** EPITECH PROJECT, 2018
** test
** File description:
** test
*/

#include "tests.h"

Test(libasm, memcpy, .init = setup)
{
	char mem[] = { 0x68, 0x00, 0x01, 0x7f, 0x32, 0x00, 0x11 };
	const size_t len = sizeof(mem);
	char cpy[100] = { 0 };
	char *result;

	result = fncs.my_memcpy(&cpy[0], &mem[0], len);
	cr_assert_eq(!memcmp(&cpy[0], &mem[0], len) && result == &cpy[0], 1);
	memset(&cpy[0], 0, 100);
	result = fncs.my_memcpy(&cpy[0], &mem[0], 3);
	cr_assert_eq(!memcmp(&cpy[0], &mem[0], 3) && result == &cpy[0], 1);

}
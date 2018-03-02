/*
** EPITECH PROJECT, 2018
** tests
** File description:
** tests
*/

#include "tests.h"

void setup(void)
{
	void *handle = dlopen("libasm.so", RTLD_GLOBAL);

	fncs.my_strlen = dlsym(handle, "strlen");
	fncs.my_strcpy = dlsym(handle, "strcpy");
	fncs.my_strcmp = dlsym(handle, "strcmp");
	fncs.my_strchr = dlsym(handle, "strchr");
	fncs.my_memset = dlsym(handle, "memset");
	fncs.my_memcpy = dlsym(handle, "memcpy");
	fncs.my_rindex = dlsym(handle, "rindex");
	fncs.my_strcspn = dlsym(handle, "strcspn");
}
/*
** EPITECH PROJECT, 2018
** tests
** File description:
** tests
*/

#include "tests.h"

void setup(void)
{
	void *handle = dlopen("./libasm.so", RTLD_LAZY);

	if (!handle)
		printf("Could not find library. Falling back to LibC.\n");
	fncs.my_strlen = dlsym(handle, "strlen");
	fncs.my_strcpy = dlsym(handle, "strcpy");
	fncs.my_strcmp = dlsym(handle, "strcmp");
	fncs.my_strncmp = dlsym(handle, "strncmp");
	fncs.my_strcasecmp = dlsym(handle, "strcasecmp");
	fncs.my_strchr = dlsym(handle, "strchr");
	fncs.my_memset = dlsym(handle, "memset");
	fncs.my_memcpy = dlsym(handle, "memcpy");
	fncs.my_memmove = dlsym(handle, "memmove");
	fncs.my_rindex = dlsym(handle, "rindex");
	fncs.my_strcspn = dlsym(handle, "strcspn");
	fncs.my_strstr = dlsym(handle, "strstr");
	fncs.my_strpbrk = dlsym(handle, "strpbrk");
}
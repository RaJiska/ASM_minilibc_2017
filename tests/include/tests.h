/*
** EPITECH PROJECT, 2018
** Tests
** File description:
** Tests
*/

#ifndef TESTS_H_
	#define TESTS_H_

#include <dlfcn.h>
#include <criterion/criterion.h>

typedef struct functions_s
{
	size_t (*my_strlen)(const char *);
	char *(*my_strcpy)(char *, const char *);
	int (*my_strcmp)(const char *, const char *);
	char *(*my_strchr)(const char *, int);
	void *(*my_memset)(void *, int, size_t);
	void *(*my_memcpy)(void *, void *, size_t);

} functions_t;

functions_t fncs;

void setup(void);
void teardown(void);
int utils_strcmp(const char *s1, const char *s2);

#endif
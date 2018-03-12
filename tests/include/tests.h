/*
** EPITECH PROJECT, 2018
** Tests
** File description:
** Tests
*/

#ifndef TESTS_H_
	#define TESTS_H_

#include <stdio.h>
#include <dlfcn.h>
#include <criterion/criterion.h>

typedef struct functions_s
{
	size_t (*my_strlen)(const char *);
	char *(*my_strcpy)(char *, const char *);
	int (*my_strcmp)(const char *, const char *);
	int (*my_strncmp)(const char *, const char *, size_t);
	int (*my_strcasecmp)(const char *, const char *);
	char *(*my_strchr)(const char *, int);
	void *(*my_memset)(void *, int, size_t);
	void *(*my_memcpy)(void *, void *, size_t);
	void *(*my_memmove)(void *, const void *, size_t);
	char *(*my_rindex)(const char *, int);
	size_t *(*my_strcspn)(const char *, const char *);
	char *(*my_strstr)(const char *, const char *);
	char *(*my_strpbrk)(const char *, const char *);
} functions_t;

functions_t fncs;

void setup(void);
void teardown(void);
int utils_strcmp(const char *s1, const char *s2);

#endif
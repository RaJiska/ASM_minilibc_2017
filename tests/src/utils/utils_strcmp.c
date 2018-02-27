/*
** EPITECH PROJECT, 2018
** test
** File description:
** test
*/

int utils_strcmp(const char *s1, const char *s2)
{
	unsigned int it = 0;

	for (; s1[it] && s2[it]; ++it)
	{
		if (s1[it] != s2[it])
			return (0);
	}
	return (s1[it] == s2[it]);
}
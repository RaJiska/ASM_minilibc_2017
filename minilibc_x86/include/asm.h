#ifndef ASM_H_
# define ASM_H_

int	asm_strlen(const char *str);
void	asm_puts(const char *s);
int	asm_strcmp(const char *s1, const char *s2);
char	*asm_strcpy(char *dest, const char *src);
char	*asm_strcat(char *dest, const char *src);
void	asm_memset(char *s, int c, size_t n);
char	*asm_strchr(const char *s, int c);
char	*asm_strrchr(const char *s, int c);
char	*asm_memchr(const char *s, int c, size_t n);

#endif /* ASM_H_ */

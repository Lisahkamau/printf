#include <stdio.h>
#include <stdarg.h>

/**
 * _printf - Custom printf function
 * @format: Format string with conversion specifiers
 *
 * Return: Number of characters printed (excluding the null byte)
 */
int _printf(const char *format, ...)
{
	va_list args;
	int count = 0;

	va_start(args, format);

	while (*format != '\0')
	{
		if (*format == '%' && *(format + 1) != '\0')
		{
			switch (*(format + 1))
			{
			case 'c':
				count += putchar(va_arg(args, int));
				break;
			case 's':
				count += printf("%s", va_arg(args, char *));
				break;
			case '%':
				count += putchar('%');
				break;
			default:
				count += putchar('%');
				count += putchar(*(format + 1));
				break;
			}
			format += 2;
		}
		else
		{
			count += putchar(*format);
			format++;
		}
	}

	va_end(args);

	return (count);
}

/**
 * main - Entry point of the program
 *
 * Return: Always 0
 */

int main(void)
{
	int characters = _printf("Hello %s! The answer is %d%c\n", "world", 42, '!');

	printf("Number of characters printed: %d\n", characters);

	return (0);
}


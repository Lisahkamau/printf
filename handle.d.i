#include <stdarg.h>
#include <stdio.h>

/**
 * print_char - Print a character
 * @args: The va_list containing the character to print
 * Return: Number of characters printed
 */
int print_char(va_list args)
{
    return putchar(va_arg(args, int));
}

/**
 * print_string - Print a string
 * @args: The va_list containing the string to print
 * Return: Number of characters printed
 */
int print_string(va_list args)
{
    return printf("%s", va_arg(args, char *));
}

/**
 * print_percent - Print a percent sign
 * @args: The va_list (unused)
 * Return: Number of characters printed
 */
int print_percent(va_list args)
{
    (void)args; /* Unused parameter */
    return putchar('%');
}

/**
 * print_decimal - Print a decimal or integer
 * @args: The va_list containing the integer to print
 * Return: Number of characters printed
 */
int print_decimal(va_list args)
{
    return printf("%d", va_arg(args, int));
}

/**
 * _printf - Custom printf function
 * @format: The format string
 * Return: Number of characters printed
 */
int _printf(const char *format, ...)
{
    va_list args;
    int count = 0;
    const char *ptr = format;

    va_start(args, format);

    while (*ptr != '\0')
    {
        if (*ptr == '%')
        {
            ptr++;
            switch (*ptr)
            {
            case 'c':
                count += print_char(args);
                break;
            case 's':
                count += print_string(args);
                break;
            case '%':
                count += print_percent(args);
                break;
            case 'd':
            case 'i':
                count += print_decimal(args);
                break;
            default:
                putchar('%');
                putchar(*ptr);
                count += 2;
            }
        }
        else
        {
            putchar(*ptr);
            count++;
        }

        ptr++;
    }

    va_end(args);

    return count;
}


/**
 * main - Entry point of the program
 * Return: Always 0
 */

int main(void)
{
    int num = 42;
    int chars_printed = _printf("The answer is %d or %i\n", num, num);
    printf("Total characters printed: %d\n", chars_printed);

    return 0;
}


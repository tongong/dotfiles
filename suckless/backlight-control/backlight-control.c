#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * A program to control the backlight brightness.
 *
 * @author: Hendrik Werner
 * modified by tongong
 */

#define MIN_BRIGHTNESS 1

#define MAX(a, b) ((a > b) ? a : b)
#define MIN(a, b) ((a < b) ? a : b)

void print_usage(char *name) {
	printf(
		"Usage: %1$s [+|-]<value>\n"
		"\n"
		"Examples:\n"
		"\t%1$s +10\n"
		"\t%1$s -10\n"
		"\t%1$s 50\n"
		"\t%1$s get\n",
		name
	);
}

FILE *open_file(char *name) {
	FILE *file;
	if (!(file = fopen(name, "r+"))) {
		fprintf(stderr, "failed to open %s\n", name);
		exit(EXIT_FAILURE);
	}
	return file;
}

unsigned int round_closest(unsigned int dividend, unsigned int divisor)
{
    return (dividend + (divisor / 2)) / divisor;
}

int main(int argc, char **argv) {
	if (argc != 2) {
		print_usage(argv[0]);
		return EXIT_FAILURE;
	}

    if (!strcmp(argv[1], "get")) {
        int brightness_value;
        FILE *brightness = open_file(BRIGHTNESS_FILE);
        fscanf(brightness, "%d", &brightness_value);
        fclose(brightness);

        printf("%d\n", round_closest(brightness_value * 100, MAX_BRIGHTNESS));
        return EXIT_SUCCESS;
    }

	int value = strtol(argv[1], NULL, 10);
	FILE *brightness = open_file(BRIGHTNESS_FILE);
	int brightness_value = MIN_BRIGHTNESS;
	switch (argv[1][0]) {
		case '+':
		case '-':
			fscanf(brightness, "%d", &brightness_value);
			brightness_value += MAX_BRIGHTNESS * value / 100;
			break;
		default:
			brightness_value = MAX_BRIGHTNESS * value / 100;
	}
	brightness_value = MIN(brightness_value, MAX_BRIGHTNESS);
	brightness_value = MAX(brightness_value, MIN_BRIGHTNESS);
	fprintf(brightness, "%d", brightness_value);
	fclose(brightness);
	return EXIT_SUCCESS;
}

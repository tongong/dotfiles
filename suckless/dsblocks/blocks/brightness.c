#include <stdio.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#include "../util.h"
#include "brightness.h"

#define ICON " "
#define OUTPUTLEN 5

size_t brightnessu(char *str, int sigval)
{
    char output[OUTPUTLEN];
    char output_prefixed[OUTPUTLEN] = "000";

    getcmdout((char *[]){"backlight-control", "get", NULL}, output, OUTPUTLEN);
    /* replace newline with \0 */
    for (int i = 0; i < OUTPUTLEN; i++) {
        if (output[i] == '\n') {
            output[i] = '\0';
            break;
        }
    }

    /* prefix string with zeros */
    strcpy(output_prefixed + 3 - strlen(output), output);


    return SPRINTF(str, ICON "%s%%", output_prefixed);
}

void brightnessc(int button) {
    if (button == 1) {
        execvp("backlight-control",(char *[]){"backlight-control", "-20", NULL});
    }

    if (button == 3) {
        execvp("backlight-control",(char *[]){"backlight-control", "+20", NULL});
    }
}

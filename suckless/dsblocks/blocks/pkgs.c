#include <stdio.h>
#include <stdlib.h>

#include "../util.h"
#include "pkgs.h"

#define ICON " "
#define MAX_CHARS_PER_LINE  5

size_t pkgsu(char *str, int sigval)
{
    char output[MAX_CHARS_PER_LINE];

    getcmdout((char *[]){"sh", "-c", "pacman -Qu | wc -l", NULL},
              output, MAX_CHARS_PER_LINE);

    return SPRINTF(str, ICON "%d", atoi(output));
}

void pkgsc(int button)
{
    TERMCMD("bash", "-c", "pacman -Qu && read");
}

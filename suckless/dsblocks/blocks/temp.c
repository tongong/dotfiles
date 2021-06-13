#include <stdio.h>
#include <stdlib.h>

#include "../util.h"
#include "temp.h"

#define ICON    " "
#define DEGREES "°C"

#define TEMPFILE "/sys/class/hwmon/hwmon0/temp1_input"
#define MAX_CHARS_PER_LINE  10

size_t tempu(char *str, int sigval)
{
    FILE *tempfile;
    char tempstring[MAX_CHARS_PER_LINE];
    unsigned int tempnum;

    tempfile = fopen(TEMPFILE, "r");
    fgets(tempstring, MAX_CHARS_PER_LINE, tempfile);
    fclose(tempfile);
    tempnum = atoi(tempstring);
    tempnum /= 1000;

    return SPRINTF(str, ICON "%02d" DEGREES, tempnum);
}

void tempc(int button)
{
    TERMCMD("s-tui");
}

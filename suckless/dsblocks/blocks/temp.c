#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../util.h"
#include "temp.h"

#define ICON    " "
#define DEGREES "°C"

#define TEMPDIR "/sys/bus/platform/devices/coretemp.0/hwmon"
#define MAX_CHARS_PER_LINE  10

size_t tempu(char *str, int sigval)
{
    // get correct hwmon device
    DIR *d;
    d = opendir(TEMPDIR);
    char fullpath[100] = TEMPDIR; /* 100 is randomly chosen */

    struct dirent *dir;
    // i'm too lazy for error handling
    while (dir = readdir(d)) {
        if (!strncmp(dir->d_name, "hwmon", 5)) {
            strcat(fullpath, "/");
            strcat(fullpath, dir->d_name);
            strcat(fullpath, "/temp1_input");
        }
    }
    closedir(d);

    FILE *tempfile;
    char tempstring[MAX_CHARS_PER_LINE];
    unsigned int tempnum;

    tempfile = fopen(fullpath, "r");
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

#include <stdio.h>
#include <time.h>

#include "../util.h"
#include "time.h"

#define ICON " "

size_t timeu(char *str, int sigval)
{
    time_t rawtime;
    struct tm *ltime;

    time(&rawtime);
    ltime = localtime(&rawtime);


    return SPRINTF(str, ICON "%02d:%02d:%02d", ltime->tm_hour, ltime->tm_min,
                   ltime->tm_sec);
}

void timec(int button)
{
    TERMCMD("tty-clock", "-c");
}

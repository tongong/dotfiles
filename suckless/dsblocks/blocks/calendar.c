#include <stdio.h>
#include <time.h>
#include <string.h>

#include "../util.h"
#include "calendar.h"

#define ICON " "

const char days[7][4] = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
const char months[12][4] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun",
                            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

size_t calendaru(char *str, int sigval)
{
    time_t rawtime;
    struct tm *ltime;

    time(&rawtime);
    ltime = localtime(&rawtime);

    return SPRINTF(str, ICON "%s,%02d.%s", days[ltime->tm_wday],
                   ltime->tm_mday, months[ltime->tm_mon]);
}

void calendarc(int button)
{
    TERMCMD("bash", "-c", "cal && read");
}

#include <stdio.h>

#include "../util.h"
#include "mem.h"

#define ICON " "

#define MEMFILE             "/proc/meminfo"
#define MAX_CHARS_PER_LINE  40

/* https://stackoverflow.com/a/4771386 */
_Bool starts_with(const char *restrict string, const char *restrict prefix)
{
    while(*prefix)
    {
        if(*prefix++ != *string++)
            return 0;
    }
    return 1;
}

size_t memu(char *str, int sigval)
{
    /* usage = (memtotal - memavailable) / memtotal */
    unsigned int memavail = 0;
    unsigned int memtotal = 0;
    FILE *meminfo;
    char currline[MAX_CHARS_PER_LINE];

    /* read file line by line until MemAvailable and MemTotal are found or the
     * end is reached */
    meminfo = fopen(MEMFILE, "r");
    do {
        fgets(currline, MAX_CHARS_PER_LINE, meminfo);

        if (starts_with(currline, "MemTotal")) {
            sscanf(currline, "%*s %d %*s", &memtotal);
        }

        if (starts_with(currline, "MemAvailable")) {
            sscanf(currline, "%*s %d %*s", &memavail);
        }

    } while (!(feof(meminfo) || (memavail && memtotal)));
    fclose(meminfo);

    return SPRINTF(str, ICON "%03d%%", ((memtotal - memavail) * 100) / memtotal);
}

void memc(int button)
{
    TERMCMD("htop", "-s", "PERCENT_MEM");
}

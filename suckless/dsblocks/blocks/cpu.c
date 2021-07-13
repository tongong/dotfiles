#include <stdio.h>
#include <string.h>

#include "../util.h"
#include "cpu.h"

#define ICON " "

/* with /proc/stat one could watch every single core */
#define STATFILE            "/proc/uptime"
#define MAX_CHARS_PER_LINE  40
#define CPUINFOFILE         "/proc/cpuinfo"
/* IMPORTANT: idle is the sum of the cores, but uptime real time */

int get_core_number() {
    static int corenum = 0;

    // core number only has to be read once
    if (!corenum) {
        FILE *cpufile;
        char tmpstring[MAX_CHARS_PER_LINE];

        cpufile = fopen(CPUINFOFILE, "r");
        while (fgets(tmpstring, MAX_CHARS_PER_LINE, cpufile)) {
            if (!strncmp(tmpstring, "processor", 9)) corenum++;
        }
        fclose(cpufile);
    }

    return corenum;
}

size_t cpuu(char *str, int sigval)
{
    float uptime;
    float idle;

    static float last_uptime = 0;
    static float last_idle = 0;

    char tmpstring[MAX_CHARS_PER_LINE];

    float usage; /* needed as temporary var */

    FILE *statfile;


    statfile = fopen(STATFILE, "r");
    fgets(tmpstring, MAX_CHARS_PER_LINE, statfile);
    fclose(statfile);

    sscanf(tmpstring, "%f %f", &uptime, &idle);

    usage = 100 * (1 - ((idle - last_idle) / get_core_number() / (uptime - last_uptime)));

    last_uptime = uptime;
    last_idle = idle;

    /* sometimes usage is negative, which is really weird... */
    if (usage < 0) usage = 0;

    return SPRINTF(str, ICON "%03d%%", (int) usage);
}

void cpuc(int button)
{
    TERMCMD("htop", "-s", "PERCENT_CPU");
}

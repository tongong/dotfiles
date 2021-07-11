#include <stdio.h>
#include <string.h>

#include "../util.h"
#include "battery.h"

#define ICON         " "
#define ICON_CHARGE  " "
#define ICON_WARNING " "

#define CAPACITYFILE        "/sys/class/power_supply/BAT0/capacity"
#define STATUSFILE          "/sys/class/power_supply/BAT0/status"
#define MAX_CHARS_PER_LINE  20

size_t batteryu(char *str, int sigval)
{
    int capacity;
    _Bool charging;

    char tmpstring[MAX_CHARS_PER_LINE];

    FILE *statfile;

    statfile = fopen(CAPACITYFILE, "r");
    fgets(tmpstring, MAX_CHARS_PER_LINE, statfile);
    fclose(statfile);
    sscanf(tmpstring, "%i", &capacity);

    statfile = fopen(STATUSFILE, "r");
    fgets(tmpstring, MAX_CHARS_PER_LINE, statfile);
    fclose(statfile);
    charging = !strcmp(tmpstring, "Charging\n");

    if (charging) {
        return SPRINTF(str, ICON_CHARGE "%03d%%", capacity);
    } else {
        char *warn = ICON_WARNING "LOW BATTERY ";
        if (capacity > 10) warn = "";
        return SPRINTF(str, "%s" ICON "%03d%%", warn, capacity);
    }
}

void batteryc(int button)
{
    cspawn((char *[]){ "sh", "-c", "notify-send \"$(acpi -b)\"", NULL});
}

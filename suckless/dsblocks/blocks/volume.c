#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "../util.h"
#include "volume.h"

#define ICON      "墳 "
#define ICON_MUTE "婢 "

/* one test was 243, but could also be higher... */
#define MAX_CHARS_PER_CMD  300

size_t volumeu(char *str, int sigval)
{
    int volume = 0;
    char mutesymbol[] = ICON;

    char output[MAX_CHARS_PER_CMD];
    char *line;
    char wordbuffer[20];

    getcmdout((char *[]){"amixer", "-D", "pulse", "get", "Master", NULL},
            output, MAX_CHARS_PER_CMD);

    /* remove \n from the end of the string */
    output[strlen(output) - 2] = '\0';

    /* iterate over lines of output */
    line = strtok(output, "\n");
    while(line) {
        /* printf("%s\n", line); */
        sscanf(line, "%s", wordbuffer);

        /* printf("%s\n", wordbuffer); */

        /* this parsing is really crappy */
        if(!strcmp(wordbuffer, "Front")) {
            /* we are at a line with something like this:
             * Front Left: Playback 45821 [70%] [off] */

            /* volume */
            sscanf(line, "%*s %*s %*s %*s %s", wordbuffer);
            /* remove first and last two characters */
            wordbuffer[strlen(wordbuffer) - 2] = '\0';
            volume = atoi(wordbuffer + 1);

            /* mute status */
            sscanf(line, "%*s %*s %*s %*s %*s %s", wordbuffer);
            if (strcmp(wordbuffer, "[on]")) strcpy(mutesymbol, ICON_MUTE);

            break;
        }

        line = strtok(NULL, "\n");
    }

    return SPRINTF(str, "%s%03d%%", mutesymbol, volume);
}

void volumec(int button)
{
    cspawn((char *[]) {"pavucontrol", NULL});
}

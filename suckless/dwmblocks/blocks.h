/* time interval in seconds to sleep before looking for updates in the main loop */
#define SLEEPINTERVAL                   1

/* If interval of a block is set to 0, the block will only be updated once at startup.
 * If interval is set to a negative value, the block will never be updated in the main loop.
 * Set pathc to NULL if clickability is not required for the block.
 * Set signal to 0 if both clickability and signaling are not required for the block.
 * Signal must be less than 10 for clickable blocks.
 * If multiple signals are pending, then the lowest numbered one will be delivered first. */

/* pathu - path of the program whose output is to be used for status text
 *         output of the program should have a null or newline character at the end
 * pathc - path of the program to be executed on clicks */
static Block blocks[] = {
/*      pathu                           pathc                                   interval        signal */
     /* { "syncthing.sh",         "syncthing-button.sh",               600,            7}, */
        { "pkgs.sh",              "pkgs-button.sh",                    600,            9},
        { "temp.sh",              "temp-button.sh",                    5,              6},
        { "mem.sh",               "mem-button.sh",                     5,              4},
        { "cpu.sh",               "cpu-button.sh",                     5,              3},
        { "volume.sh",            "volume-button.sh",                  600,            5},
     /* { "battery.sh",           "battery-button.sh",                 5,              8}, */
        { "calendar.sh",          "calendar-button.sh",                600,            2},
        { "time.sh",              "time-button.sh",                    1,              1},

        { NULL } /* just to mark the end of the array */
};

static const char *delim =  " | ";

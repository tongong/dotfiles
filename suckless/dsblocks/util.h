#include "shared.h"

#define TERMCMD(...)                    cspawn((char *[]){ "st", "-e", __VA_ARGS__, NULL })

#define SPRINTF(str, ...)               ({ \
                                                int len = snprintf(str, BLOCKLENGTH, __VA_ARGS__); \
                                                len < BLOCKLENGTH ? len + 1 : BLOCKLENGTH; \
                                        })

void cspawn(char *const *arg);
void csigself(int sig, int sigval);
size_t getcmdout(char *const *arg, char *cmdout, size_t cmdoutlen);
int readint(const char *path, int *var);
void uspawn(char *const *arg);

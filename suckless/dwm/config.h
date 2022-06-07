/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const unsigned int gappih    = 12;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 12;       /* vert inner gap between windows */
static const unsigned int gappoh    = 12;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 12;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "FiraCode Nerd Font:size=10" };
static const char col_gray[]        = "#242424";
static const char col_white[]       = "#FFFFFF";
static const char col_green[]       = "#4CAF50";
static const char col1[]            = "#ffffff";
static const char col2[]            = "#ffffff";
static const char col3[]            = "#ffffff";
static const char col4[]            = "#ffffff";
static const char col5[]            = "#ffffff";
static const char col6[]            = "#ffffff";
static const char col7[]            = "#ffffff";
static const char col8[]            = "#ffffff";
static const char col9[]            = "#ffffff";
static const char col10[]           = "#ffffff";
static const char col11[]           = "#ffffff";
static const char col12[]           = "#ffffff";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_white, col_gray, col_gray },
	[SchemeSel]  = { col_gray, col_green,  col_green  },
	[SchemeBar]  = { col_green, col_green,  col_green  }, // Dirty workaround lol
	[SchemeCol1]  = { col1,      col_gray, col_gray },
	[SchemeCol2]  = { col2,      col_gray, col_gray },
	[SchemeCol3]  = { col3,      col_gray, col_gray },
	[SchemeCol4]  = { col4,      col_gray, col_gray },
	[SchemeCol5]  = { col5,      col_gray, col_gray },
	[SchemeCol6]  = { col6,      col_gray, col_gray },
	[SchemeCol7]  = { col7,      col_gray, col_gray },
	[SchemeCol8]  = { col8,      col_gray, col_gray },
	[SchemeCol9]  = { col8,      col_gray, col_gray },
	[SchemeCol10] = { col10,     col_gray, col_gray },
	[SchemeCol11] = { col11,     col_gray, col_gray },
	[SchemeCol12] = { col12,     col_gray, col_gray },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class     instance   title   tags mask  isfloating  isterminal  noswallow  monitor */
    { "Dragon-drag-and-drop", NULL, NULL, -1,  1,          0,          0,         -1 },
	{ "st-256color", NULL,  NULL,   0,         0,          1,          0,         -1 },
	{ NULL,      NULL,     "Event Tester", 0,  0,          0,          1,         -1 }, /* xev */
};

/* layouts */
static const float mfact     = 0.5;  /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    // master-and-stack
	{ "><>",      NULL },    // floating
	{ "[M]",      monocle }, // monocle
};

/* key definitions */
#define MODKEY Mod4Mask // Super-Key
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} },
// first:  Change active tag
// second: Send window to tag

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *samedirtermcmd[]  = { "samedir", NULL };
static const char *clipmenucmd[]  = { "clipmenu", NULL };
static const char *browsercmd[]  = { "firefox", NULL };
static const char *editorcmd[]  = { "st", "-e", "nvim", NULL };
static const char *filescmd[]  = { "st", "-e", "ranger", NULL };
static const char *calculatorcmd[]  = { "st", "-e", "calc", NULL };
static const char *screenshotwindowcmd[]  = { "screenshot-current", NULL };
static const char *screenshotselectcmd[]  = { "screenshot-select", NULL };
static const char *screenshotviewcmd[]  = { "sh", "-c", "sxiv ~/screenshots/*", NULL };
static const char *volumeupcmd[]  = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%", NULL };
static const char *volumedowncmd[]  = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%", NULL };
static const char *volumemutecmd[]  = { "pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle", NULL };
static const char *lockcmd[]  = { "slock", NULL };
static const char *passmenucmd[]  = { "passmenu-plus", "--type", "-l", "10", NULL };
static const char *settingscmd[]  = { "dmenu-settings", NULL };
static const char *notificationcmd[]  = { "st", "-e", "less", "/tmp/notification-list", NULL };
static const char *pausemusiccmd[]  = { "playerctl", "play-pause", NULL };
static const char *notescmd[]  = { "st", "-e", "notes", NULL };
static const char *newnotecmd[]  = { "dnote", NULL };
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x34", "notes", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	// commands
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = samedirtermcmd } },
	{ MODKEY,                       XK_r,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_v,      spawn,          {.v = clipmenucmd } },
	{ MODKEY,                       XK_b,      spawn,          {.v = browsercmd } },
	{ MODKEY,                       XK_e,      spawn,          {.v = editorcmd } },
	{ MODKEY,                       XK_n,      spawn,          {.v = filescmd } },
	{ MODKEY,                       XK_c,      spawn,          {.v = calculatorcmd } },
	{ MODKEY,                       XK_p,      spawn,          {.v = screenshotwindowcmd } },
	{ MODKEY|ShiftMask,             XK_p,      spawn,          {.v = screenshotselectcmd } },
	{ MODKEY|ControlMask,           XK_p,      spawn,          {.v = screenshotviewcmd } },
	{ MODKEY,                       XK_plus,   spawn,          {.v = volumeupcmd } },
	{ MODKEY,                       XK_minus,  spawn,          {.v = volumedowncmd } },
	{ MODKEY,                       XK_period, spawn,          {.v = volumemutecmd } },
	{ MODKEY|ShiftMask,             XK_l,      spawn,          {.v = lockcmd } },
	{ MODKEY|ShiftMask,             XK_d,      spawn,          {.v = passmenucmd } },
	{ MODKEY,                       XK_s,      spawn,          {.v = settingscmd } },
	{ MODKEY,                       XK_m,      spawn,          {.v = pausemusiccmd } },
	{ MODKEY,                       XK_g,      togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY|ShiftMask,             XK_g,      spawn,          {.v = newnotecmd } },
	// Rotate focus through windows
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	// Rotate windows
	{ MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },
	// Change width of master window
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	// Makes current window master (or first other if current window is master)
    //{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_space,  zoom,           {0} },
	// Go to last active tag at the screen
	{ MODKEY,                       XK_Tab,    view,           {0} },
	// Set layouts
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	// { MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	// Toggle last two layouts
	// { MODKEY,                       XK_space,  setlayout,      {0} },
	// Toggle floating/fullscreen of individual window
	// { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY|ShiftMask,             XK_f,      togglefullscr,  {0} },
	// show all windows of all tags
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	// Focus other screen
	{ MODKEY,                       XK_u,      focusmon,       {.i = +1 } },
	// Send current window to other screen (focus remains at the first screen)
	{ MODKEY,                       XK_o,      tagmon,         {.i = +1 } },
	// Close window
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	// see above
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	// Restart dwm
	{ MODKEY|ShiftMask,             XK_q,      quit,           {1} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} }, // Toggle Layout
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} }, // Move window
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} }, // Toggle window floating
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} }, // Resize window
	{ ClkTagBar,            0,              Button1,        view,           {0} }, // Select tag
	{ ClkWinTitle,          0,              Button1,        spawn,          {.v = notificationcmd } }, // open notification history
	// control dwmblocks
	{ ClkStatusText,        0,              Button1,        sigdwmblocks,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigdwmblocks,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigdwmblocks,   {.i = 3} },
};

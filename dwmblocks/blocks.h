//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/	 	/*Update Interval*/	/*Update Signal*/
	{"<\x02 ", "xbps-install -nuM | wc -l", 	120, 				0},

	{"\x03﬙ ",  "awk '{ printf \"%dm\", $0/60; }' /proc/uptime", 		10, 				0},
 
	{"\x04﨎 ",  "curl \"wttr.in/Gothenburg?format=%t\"", 	 1800, 				 0},

	{"\x05 ",  "cat /sys/class/thermal/thermal_zone2/temp | cut -c1-2", 	1, 					0},

	{"\x06 ",  "free -h | awk '/^Mem/ { print $3 }' | sed s/i//g", 		5, 					0},

	{"\x07  ",  "xkb-switch", 	1, 					10},

	{"\x08 ",  "date +\"%d %b %y - %R\"", 		5, 					0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "<";
static unsigned int delimLen = 5;

/*
###	simpelt c-program för att kontrollera om int x > 50	###
###	logghanteringstjänster 					###
###	jgaforsberg gufo0047 gusfor-1 gufr22			###
*/
#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
	int x = atoi(argv[1]);
	openlog("checkint.c", LOG_CONS | LOG_PID, LOG_USER);
	if( x < 50 ) {
		syslog(LOG_INFO, "Checkint.c input < 50");
	} else {
		syslog(LOG_ALERT, "Checkint.c input > 50");
	}
	closelog();
	return 0;
}


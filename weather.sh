#!/bin/bash

###	enkelt skript för att spara dagens väder och tid för 		###
###	skriptets körning till .txt-fil i ~/ 				###
###	samt loggning av skriptexekvering				###
###	logghanteringstjänster 						###
###	jgaforsberg gufo0047 gusfor-1 gufr22				###

curl -s 'wttr.in/Luleå' > ./weather.txt && date +"%T %d-%m-%y" >> ./weather.txt
# tar exitkod från exekvering av ovan kod för att användning som villkor
STATUS=`echo "$?"`

if [ $STATUS -eq 0 ]; then
	# skriptet lyckas, loggning som information - nivå 6 - sker via logger
	logger -p 'user.info' 'weather.sh successfully executed' && echo 'weather.sh info logged successfully'
else
	# skriptet misslyckas, loggning som alert - nivå 3 - sker via logger
	logger -p 'user.alert' 'weather.sh could not execute' && echo 'weather.sh alert logged successfully'
fi


#!/bin/bash
#echo "a" >> temp.txt

# run command to get temperature in Celsius
PR=$(sudo pcsensor -c)

# control echo
echo "temp $PR" >> /home/pi/projekt/OPS/temp.txt

# send email if temperature if lower than 15 or higher than 30
zaokrouhleni=$($PR | rev | cut -c 4- | rev)
vysledek=$(($zaokrouhleni + 0))
if [ "$vysledek" -lt 15 ]; then
echo "Tvoje teplota je pod 15 C°, a to presne: $PR C°" | mail -s "teplota je nizka!" teplota.projekt@gmail.com
elif [ "$vysledek" -gt 30 ]; then
echo "Tvoje teplota je nad 30 C°, a to presne: $PR C°" | mail -s "teplota je vysoka!" teplota.projekt@gmail.com
fi

# run connect.py with temperature as arg
/home/pi/projekt/OPS/connect.py "$PR"

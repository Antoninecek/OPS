#!/bin/bash
tmp=$(sudo pcsensor -c)
zaokrouhleni=$(sudo pcsensor -c | rev | cut -c 4- | rev)
vysledek=$(($zaokrouhleni + 0))

if ["$vysledek" -lt 15 ]; then
echo "Tvoje teplota je pod 15 C°, a to presne: $tmp C°" | mail -s "teplota je nizka!" teplota.projekt@gmail.com
elif ["$vysledek" -gt 30 ]; then
echo "Tvoje teplota je nad 30 C°, a to presne: $tmp C°" | mail -s "teplota je vysoka!" teplota.projekt@gmail.com
fi

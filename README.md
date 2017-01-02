# ZPRACOVANI TEPLOTY S ODEZVOU

> Cilem je donutit pracovat usb teplotni senzor s rasberry pi, vhodne zpracovat teplotu a udaje vracet uzivateli v zatim neurcene podobe.

**Odkaz na diskuzni vlakno na [elearningu](https://elearning.tul.cz/mod/forum/discuss.php?d=944&mode=1).**

**[Odkaz na web s db, kam se ukladaji teploty](http://silenyprojekt.4fan.cz/zpracuj.php).**

```
email:teplota.projekt@gmail.com
heslo:heslo123
```

## TODO list
- [x] Init commit
- [x] Prestat se flakat
- [x] Zpracovani dat z teplotniho senzoru
- [ ] Akce pro uzivatele (email, web)

# PRINCIP FUNGOVANI
```
crontab -e
1/* * * * * /path/to/file/temperature.sh
```

```
Email
ssmtp, mailutils

# Konfigurace ssmtp:
/etc/ssmtp/ssmtp.conf
root=postmaster
mailhub=smtp.gmail.com:587
hostname=raspberrypi
AuthUser=teplota.projekt@gmail.com
AuthPass=heslo123
FromLineOverride=YES
UseSTARTTLS=YES

/etc/ssmtp/revaliases
pi:pi@raspberrypi:smtp.gmail.com:587
```

## SOUBORY
```
kompilovany pcsensor je ulozen v /bin pro spusteni odkudkoliv
```
CRONTAB - run temperature.sh with sudo rights

TEMPERATURE.SH - get temperature from usb sensor, run connect.py with temperature as param

CONNECT.PY - connect to the web, POST temperature into zpracuj.php

ZPRACUJ.PHP - connect to the MySQL db, insert temperature with id and current date

email.sh - Za podmínky že je teplota menší než 15 stupnů nebo nad 30 stupnu posle email s přesnou teplotou, tento skript se spouší každých 30 minut.

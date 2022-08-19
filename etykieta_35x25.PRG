: Skrypt wklajmy w putty po połączeniu z drukarką (115200,8,1,none)
: W drukarce wczesniej nalezy włączyc virtualny port COM
:

IMMEDIATE OFF

100 A$="10"
110 B%=0
120 SETSTDIO 9,0
130 WHILE B%<>47
135 I%=0
140 NASC 8
160 INPUT "Cena: ";A$
170 IF A$<>"" THEN C$=A$

175 T$="ARRAY$"
180 DIM ARRAY$(4)
190 I%=SPLIT(A$,T$,42)
193 IF I%=2 THEN 
194 L%=VAL(ARRAY$(0))
195 C$=ARRAY$(1)
196 ELSE L%=1

200 FONT "Univers",7
210 PRPOS 10,160
220 PRTXT "Dyskont TANIA ODZIEŻ"
230 PRPOS 10,60
240 FONT "Univers Bold",30,0,75
250 PRTXT C$
260 PRTXT "zł"
270 PRPOS 10,35
280 FONT "Univers",7
290 FORMAT DATE$ "YYYY-MM-DD" : 'sets date format
300 FORMAT TIME$ "HH:MM:SS" : 'sets date format
310 PRTXT "Data: "
320 PRTXT DATE$("F") : 'returns formatted date
330 PRTXT " "
340 PRTXT TIME$("F") : 'returns formatted date
350 PRPOS 10,10
360 FONT "Univers",7
370 PRTXT "Stanowisko 1"

510 B%=ASC(A$)
520 IF B%<>47 THEN PRINTFEED L%
550 WEND
600 SETSTDIO 100
IMMEDIATE ON
SAVE "tmp:ETYKIETA.PRG",L

SYSVAR(43)=1
COPY "/tmp/ETYKIETA.PRG","/c/scripts/ETYKIETA.PRG"
COPY "/tmp/ETYKIETA.PRG","/c/ETYKIETA.PRG"
OPEN "AUTOEXEC.BAT" FOR OUTPUT AS 1
PRINT#1,"RUN";CHR$(34);"ETYKIETA.PRG";CHR$(34)
CLOSE1

REBOOT




:## Czyszczenie pliku autostartu
:OPEN "AUTOEXEC.BAT" FOR OUTPUT AS 1
:PRINT#1,""
:CLOSE1













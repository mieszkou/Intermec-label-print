NEW
IMMEDIATE OFF


046 OPEN "console:" FOR OUTPUT AS 1
047 COMSET 9,"","/","","=",1
048 'ON COMSET 9 GOSUB SUBREAD
049 CLIP ON
050 
051 L%=1
065 PRINT #1, CHR$(155) + "2J"
066 
067 ' Wylaczenie domyslnego dzialania klawisza wstecz
068 BREAK 0 OFF
069 ' Obsługa UTF-8
070 NASC 8
071 ' Wlaczenie czujnika dyspensera
072 LTS& ON
126 'PRINT PRSTAT
127 IF (PRSTAT AND 2) THEN 
128 PRINT #1, "Zabierz etyk."
129 ZABIERZETYK: IF (PRSTAT AND 2)<>0 THEN GOTO ZABIERZETYK
130 ENDIF
131 IF (PRSTAT AND 4) OR (PRSTAT AND 128) THEN PRINT #1, "Sprawdz_papier"
132 SPRAWPAPIER: IF (PRSTAT AND 4)<>0 OR (PRSTAT AND 128)<>0 THEN GOTO SPRAWPAPIER
133 PRINT #1, PRSTAT
134 PRPOS 10,160
135 FONT "Univers",7
136 PRTXT "Dyskont TANIA ODZIEŻ"
137 BEEP
138 PRPOS 10,60
139 FONT "Univers Bold",30,0,75
140 PRTXT " zł"
141 BEEP
142 PRPOS 10,35
143 FORMAT DATE$ "YYYY-MM-DD"
144 FORMAT TIME$ "HH:MM:SS" 
145 FONT "Univers",7
146 PRTXT "Data: ";DATE$("F");" ";TIME$("F") 
147 BEEP
148 PRPOS 10,10
149 FONT "Univers",7
150 PRTXT "Stanowisko 1"
151 PRINT #1, "W: ";PRSTAT
152 PRINTFEED L%
153 BEEP

IMMEDIATE ON

SAVE "tmp:ETYKNEW.PRG"

SYSVAR(43)=1
COPY "/tmp/ETYKNEW.PRG","/c/scripts/ETYKNEW.PRG"
COPY "/tmp/ETYKNEW.PRG","/c/ETYKNEW.PRG"
OPEN "AUTOEXEC.BAT" FOR OUTPUT AS 1
PRINT#1,"RUN";CHR$(34);"ETYKNEW.PRG";CHR$(34)
CLOSE1

'RUN
'RUN "ETYKNEW.PRG"
'REBOOT

REM :## Czyszczenie pliku autostartu
REM :OPEN "AUTOEXEC.BAT" FOR OUTPUT AS 1
REM :PRINT#1,""
REM :CLOSE1






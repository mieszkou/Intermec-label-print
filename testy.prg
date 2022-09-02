DELETE1-100000
IMMEDIATE OFF

004 KEY (10) ON
005 KEY (11) ON
006 KEY (12) ON
007 KEY (13) ON
008 KEY (14) ON
009 KEY (16) ON
010 KEY (17) ON
011 KEY (20) ON
012 
013 'COMSET9,"","","",CHR$(10),7
014 'COMSET 9 ON
015 BREAK 0 OFF
016 
017 SYSVAR(18)=-1
018 NASC 8
019 
020 A$=""
021 B%=0
022 LTS& ON
023 SETSTDIO 9,0
024 
025 ON KEY (10) GOSUB SUBHOME
026 ON KEY (12) GOSUB SUBUP
027 ON KEY (14) GOSUB SUBDOWN
028 ON KEY (11) GOSUB SUBLEFT
029 ON KEY (13) GOSUB SUBRIGHT
030 ON KEY (16) GOSUB SUBENTER
031 ON KEY (20) GOSUB SUBBACK
032 ON KEY (17) GOSUB SUBPAPER
033 ON ERROR GOTO SUBERROR
034 'ON COMSET 9 GOSUB SUBREAD
035 
036 OPEN "console:" FOR OUTPUT AS 1
037 'PRINT #1, "Cena: "
038 
039 'PRINT "Program"
040 MAINLOOP: IF A$ <> "149600" THEN GOTO SUBREAD
041 SUBREAD:
042 INPUT "CenaI: ",A$;
043 'A$=COMBUF$(9)
044 'czyszczenie ekranu
045 'PRINT #1, CHR$(155) + "2J"
046 'PRINT #1, "Cena: ";A$;CHR$(10);
047 
048 I%=0
049 L%=1
050 
051 IF A$<>"" THEN C$=A$
052 T$="ARRAY$"
053 DIM ARRAY$(1)
054 I%=SPLIT(A$,T$,42)
055 'PRINT I%
056 'PRINT A$
057 
058 IF I%=2 THEN 
059 L%=VAL(ARRAY$(0))
060 C$=ARRAY$(1)
061 ELSE 
062 L%=1 
063 ENDIF
064 
065 PRPOS 10,160
066 FONT "Univers",7
067 PRTXT "Dyskont TANIA ODZIEŻ"
068 
069 PRPOS 10,60
070 FONT "Univers Bold",30,0,75
071 PRTXT C$;" zł"
072 
073 PRPOS 10,35
074 FORMAT DATE$ "YYYY-MM-DD"
075 FORMAT TIME$ "HH:MM:SS" 
076 FONT "Univers",7
077 PRTXT "Data: ";DATE$("F");" ";TIME$("F") 
078 
079 PRPOS 10,10
080 FONT "Univers",7
081 PRTXT "Stanowisko 1"
082 
083 B%=ASC(A$)
084 IF B%<>47 THEN PRINTFEED L%
085 
086 'COMSET 9 ON
087 GOTO MAINLOOP
088 RETURN
089 
090 SUBHOME: 
091 PRINT "HOME"
092 RETURN
093 
094 
095 SUBUP: 
096 PRINT "UP UP"
097 RETURN
098 
099 SUBDOWN: 
100 PRINT "DOWN"
101 RETURN
102 
103 SUBLEFT: 
104 PRINT "LEFT"
105 RETURN
106 
107 SUBRIGHT: 
108 PRINT "RIGHT"
109 RETURN
110 
111 SUBENTER: 
112 PRINT "ENTER"
113 RETURN
114 
115 SUBBACK: 
116 PRINT "Bye"
117 LTS& OFF
118 CLOSE
119 SETSTDIO 100
120 END
121 SUBPAPER:
122 TESTFEED
123 RETURN
124 
125 SUBERROR:
126 PRINT "Program ERROR ";STR$(ERR);
127 PRINT EFLAG%

128 IF ERR=1022 THEN
129 PRINT #1, "Podniesiona glowica"
130 ERNO9004: IF (PRSTAT AND 1)=0 THEN GOTO ERNO9004
131 PRINT #1, "Podniesiona glowica ..."
132 RESUME
133 ENDIF
134 
135 IF ERR=1005 THEN
136 PRINT #1, "Brak papieru"
137 ERNO9024: IF (PRSTAT AND 1)=0 THEN GOTO ERNO9024
138 EFLAG%=0
139 ERNO9026:
140 IF (PRSTAT AND 1)=0 THEN FORMFEED ELSE GOTO ERNO9026
141 IF EFLAG%=1005 THEN GOTO ERNO9024
142 IF EFLAG%=1031 THEN GOSUB ERNO9200
143 PRINT #1, "Brak papieru..."
144 RESUME
145 ENDIF
146 
147 IF ERR=0 THEN
148 PRINT "OK"
149 RESUME
150 ENDIF
151 
152 IF ERR=1031 THEN
153 ERNO9200:
154 PRINT #1, "Brak kolejn.etyk."
155 ERNO9240:
156 EFLAG%=0
157 FORMFEED
158 IF EFLAG%=1031 THEN GOTO ERNO9240
159 RETURN
160 ENDIF
161 GOTO MAINLOOP
162 RETURN
163 

IMMEDIATE ON
RUN

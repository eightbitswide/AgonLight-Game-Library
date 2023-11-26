    1 REM 3D_Maze
    2 REM by David Johnston
    3 REM (c) Acorn Computing
    4 GOTO 6000
    5 DIM M$(20,20)
    6 REM MINOR EDITS BY EIGHTBITSWIDE 2023
    7 REM KEYBOARD CONTROLS MADE FRIENDLY
    8 REM INTRO INCLUDED IN MAIN PROGRAM
    9 :
   10 MODE 3
   12 REM *FX15
   13 PROCoptions
   15 VDU23;8202;0;0;0;
   20 IF MOV=1 THENGOTO50
   30 FORB=1TO20:FORA=1TO20
   40     READ M$(A,B):NEXT:NEXT
   50 A=2:B=2:D=3
   70 TIME=0: REPEAT UNTIL TIME > 20 : PROCdraw
   75 REM *FX15,1
   80 REM A$=GET$
   90 IF INKEY(-58) THEN PROCforward : GOTO 70
  100 IF INKEY(-26) THEN PROCanti : GOTO 70
  120 IF INKEY(-122) THEN PROCclock : GOTO 70
  125 GOTO 90
  130 DEFPROCanti
  140 IF D=1 THEN D=4:ENDPROC
  150 D=D-1:ENDPROC
  160 DEFPROCclock
  170 IF D=4 THEN D=1:ENDPROC 
  180 D=D+1:ENDPROC
  190 DEFPROCforward
  200 IF D=1 AND M$(A,B-1)="" THEN B=B-1:ENDPROC
  210 IF D=2 AND M$(A+1,B)="" THEN A=A+1:ENDPROC
  220 IF D=3 AND M$(A,B+1)="" THEN B=B+1:ENDPROC
  230 IF D=4 AND M$(A-1,B)="" THEN A=A-1:ENDPROC
  240 IF D=1 AND M$(A,B-1)="E" THEN CLS:PRINT"WELL DONE!":A=GET:RUN
  250 IF D=2 AND M$(A+1,B)="E" THEN CLS:PRINT"WELL DONE!":A=GET:RUN
  260 IF D=3 AND M$(A,B-1)="E" THEN CLS:PRINT"WELL DONE!":A=GET:RUN
  270 IF D=4 AND M$(A-1,B)="E" THEN CLS:PRINT"WELL DONE!":A=GET:RUN
 1000 DEFPROCdraw
 1003 CLS
 1005 M=-512:MS=512:X=A:Y=B
 1007 REPEAT
 1010   PROCmovedraw
 1012   IF M$(X,Y)="O" THEN MOVE M,1000-M:DRAW M,M:DRAW 1000-M,M:DRAW 1000-M,1000-M:DRAW M,1000-M:GOTO1040
 1014   IF M$(X,Y)="E" THEN MOVE M,1000-M:DRAW M,M:PLOT 85,1000-M,1000-M:PLOT 85,1000-M,M:GOTO1040
 1020   IF BL$="O" THEN MOVE M,1000-M:DRAW M,M:DRAW M+MS,M+MS:DRAW M+MS,1000-M-MS:DRAW M,1000-M
 1025   IF BL$="E" THEN MOVE M,1000-M:DRAW M,M:PLOT 85,M+MS,1000-M-MS:PLOT 85,M+MS,M+MS
 1030   IF BR$="O" THEN MOVE 1000-M,1000-M:DRAW 1000-M,M:DRAW 1000-(M+MS),M+MS:DRAW 1000-(M+MS),1000-M-MS:DRAW 1000-M,1000-M
 1035   IF BR$="E" THEN MOVE 1000-M,1000-M:DRAW 1000-M,M:PLOT 85,1000-(M+MS),1000-M-MS:PLOT 85,1000-(M+MS),M+MS
 1040   IF BL$="O" AND POINT(M-4,1004-M)=0 THEN MOVE M,1000-M:DRAW M-(MS*2),1000-M:MOVE M,M:DRAW M-(MS*2),M
 1050   IF BR$="O" AND MS<256 AND POINT(1004-M,1004-M)=0 THEN MOVE 1000-M,1000-M:DRAW 1000-M+(MS*2),1000-M:MOVE 1000-M,M:DRAW 1000-M+(MS*2),M
 1100 UNTIL M$(X,Y)="O" OR M$(X,Y)="E" OR MS=8
 1110 ENDPROC
 2000 DEFPROCmovedraw
 2010 IF D=1 THEN Y=Y-1:BL$=M$(X-1,Y):BR$=M$(X+1,Y)
 2020 IF D=3 THEN Y=Y+1:BL$=M$(X+1,Y):BR$=M$(X-1,Y)
 2030 IF D=2 THEN X=X+1:BL$=M$(X,Y-1):BR$=M$(X,Y+1)
 2040 IF D=4 THEN X=X-1:BL$=M$(X,Y+1):BR$=M$(X,Y-1)
 2043 M=M+MS:MS=MS/2
 2050 ENDPROC
 2060 DEFPROCoptions
 2065 MOV=0
 2070 CLS:PRINT"1.PLAY GAME"
 2080 PRINT"2.MAKE MAZE";
 2090 A$=GET$
 2100 IF A$="1"THEN ENDPROC
 2110 IF A$="2"THENGOTO2130
 2120 GOTO2070
 2130 CLS:PRINT"1.LOAD MAZE"
 2140 PRINT"2.SAVE MAZE"
 2150 PRINT"3.EDIT MAZE"
 2155 PRINT"4.GO TO MAIN MENU";
 2160 A$=GET$: REM *FX200,2
 2170 IF A$="1"THEN MOV=1:PROCload
 2180 IF A$="2" AND MOV=1 THEN PROCsave
 2190 IF A$="3"THEN MOV=1:PROCedit
 2195 IF A$="4"THENGOTO2070
 2200 GOTO2130
 2210 DEFPROCload
 2220 CLS:INPUT"PLEASE ENTER FILE-NAME ";name$
 2230 X=OPENIN(name$)
 2240 FORB=1TO20:FORA=1TO20
 2250     INPUT# X,M$(A,B)
 2260   NEXT:NEXT
 2265 CLOSE# X
 2270 ENDPROC
 2280 DEFPROCsave
 2290 CLS:INPUT"PLEASE ENTER FILE-NAME ";name$
 2300 X=OPENOUT(name$)
 2310 FORB=1TO20:FORA=1TO20
 2320     PRINT# X,M$(A,B)
 2330   NEXT:NEXT
 2335 CLOSE# X
 2340 ENDPROC
 2350 DEFPROCedit
 2355 WALL=1
 2360 CLS:FORB=1TO20:FORA=1TO20
 2370     PRINTTAB(A,B)M$(A,B)
 2380   NEXT:NEXT
 2390 A=1:B=1
 2402 PRINTTAB(1,25);
 2404 IF WALL=1 THENPRINT"O"
 2406 IF WALL=2 THENPRINT" "
 2408 IF WALL=3 THENPRINT"E"
 2409 PRINTTAB(A,B);
 2410 A$=GET$
 2420 IF A$=":"THENPROCplace
 2430 IF A$="/"THEN WALL=WALL+1:IF WALL=4 THEN WALL=1
 2440 IF A$="A" AND A>1 THEN A=A-1
 2450 IF A$="D" AND A<20 THEN A=A+1
 2460 IF A$="S" AND B<20 THEN B=B+1
 2470 IF A$="W" AND B>1 THEN B=B-1
 2480 IF A$="E"THEN ENDPROC
 2490 GOTO2402
 2500 DEFPROCplace
 2510 PRINTTAB(A,B);
 2520 IF WALL=1 THENPRINT"O":M$(A,B)="O"
 2530 IF WALL=2 THEN PRINT" ":M$(A,B)=""
 2540 IF WALL=3 THENPRINT"E":M$(A,B)="E"
 2550 ENDPROC
 5000 DATA O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O
 5010 DATA O, ,O, , , , , , ,O, , , ,O, , , , , ,O
 5020 DATA O, ,O, ,O, ,O,O, ,O, ,O, ,O, ,O,O,O, ,O
 5030 DATA O, , , ,O, , ,O, ,O, ,O,O,O, ,O, ,O, ,O
 5040 DATA O, ,O,O,O,O, , , ,O, ,O, , , , , ,O, ,O
 5050 DATA O, , , , ,O,O,O,O,O, ,O, ,O,O,O, , , ,O
 5060 DATA O,O,O,O, , , , , , , ,O, , , ,O,O,O,O,O
 5070 DATA O, ,O,O, ,O,O,O,O,O, ,O,O,O, ,O, , , ,O
 5080 DATA O, , , , , , , , ,O, , , ,O, ,O, ,O,O,O
 5090 DATA O,O,O,O,O,O, ,O, ,O,O,O,O,O, ,O, , , ,O
 5100 DATA O, , , , ,O, ,O, ,O, , , , , ,O,O,O, ,O
 5110 DATA O,O,O, ,O,O, ,O, , , ,O,O,O,O,O, , , ,O
 5120 DATA O, , , , ,O, ,O, ,O,O,O, , , , , ,O, ,O
 5130 DATA O,O, ,O,O,O, ,O,O,O,O, , ,O, ,O, ,O, ,O
 5140 DATA O, , ,O, , , , , , ,O, ,O,O, ,O,O,O,O,O
 5150 DATA O,O, , , ,O, ,O,O, ,O, ,O, , , , , , ,O
 5160 DATA O, , ,O, ,O, , , , ,O, ,O, ,O,O, ,O,O,O
 5170 DATA O, ,O,O, ,O,O,O,O,O,O, ,O, ,O, , , ,O,O
 5180 DATA O, , ,O, , , , , , , , ,O, ,O, ,O, , ,E
 5190 DATA O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O
 6000 MODE 7
 6010 PROCcntr(1,6,1,"3D_Maze")
 6020 PROCcntr(0,4,2," By David Johnston")
 6030 PROCcntr(0,7,4," (c) 1993 Acorn Computing")
 6040 PRINT : PRINT " There you were sitting at your trusty"
 6050 PRINT " Agon when, when all of the sudden,"
 6060 PRINT " a tremendous walled maze appeared"
 6070 PRINT " around you.  Perplexed by this weird"
 6080 PRINT " phenomenon, you become unable to do"
 6090 PRINT " anything at all other than turn to"
 6100 PRINT " left, or right, or stagger forward in"
 6110 PRINT " hope of finding your passport to"
 6120 PRINT " freedom.  Your only means of escape is"
 6130 PRINT " through the elusive exit which appears"
 6140 PRINT " as a solid white section in the wall."
 6150 PRINT
 6160 PRINT " Arrow keys move left, right, & foward."
 6165 PRINT
 6170 PRINT " Maze Editor Keys:"
 6180 PRINT " A=Left, D=Right, W=Up, S=Down"
 6190 PRINT " /=Select Object, :=Place Object E=End"
 6200 PRINT "          <press any key>";
 6210 A=GET
 6220 GOTO 5
 9999 STOP
10000 DEFPROCcntr(D%,C%,Y%,msg$)
10010 X%=(40-LEN(msg$))/2
10020 msg$=CHR$(128+C%)+msg$
10030 IFD%=1 FOR N%=0TO1:PRINTTAB(X%-2,Y%+N%)CHR$(141)msg$:NEXT:ENDPROC
10040 PRINTTAB(X%-1,Y%+N%)msg$
10050 ENDPROC
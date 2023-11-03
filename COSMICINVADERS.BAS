   10 REM ****  Cosmic Invaders  ****
   20 REM ****        by         ****
   30 REM ****    M.N.Buckwell   ****
   40 REM ****      (C) 1984     ****
   45 TI%=20
   50 DIM Scores%(9),Names$(9),Space%(7,5),Bombs%(10,1),Alien0$(1),Alien1$(1),Alien2$(1), Ch% 3
   60 MODE 7:REM ON ERROR GOTO 3240
   70 VDU23,1,0;0;0;0;
   80 REM ENVELOPE 1,129,0,0,0,100,0,0,127,-2,0,-1,126,120
   90 REM ENVELOPE 2,1,1,0,0,200,1,0,126,-100,0,-126,126,126
  100 REM ENVELOPE 3,1,-16,-8,-4,5,10,20,70,0,0,-63,70,63
  110 REM *** COLOUR CHARACTERS  ***
  120 L$=CHR$(141):R$=CHR$(129):G$=CHR$(130)
  130 Y$=CHR$(131):B$=CHR$(132):M$=CHR$(133)
  140 C$=CHR$(134):FL$=CHR$(136):ST$=CHR$(137)
  150 REM *** SPECIAL CHARACTERS ***
  160 BL$=CHR$(255):REM Block
  170 B$=CHR$(8)   :REM Cursor Back
  180 F$=CHR$(9)   :REM Cursor Forward
  190 D$=CHR$(10)  :REM Cursor Down
  200 U$=CHR$(11)  :REM Cursor Up
  210 REM *** GRAPHIC COLOUR CHAR'S ***
  220 GR$=CHR$(145):GG$=CHR$(146):GY$=CHR$(147):GC$=CHR$(150)
  230 REM *** Space Invader A ***
  240 Alien0$(0)=">"+BL$+"m "+D$+B$+B$+B$+B$+"k/7 "+D$+B$+B$+B$+B$+"! "" "
  250 Alien0$(1)=">"+BL$+"m "+D$+B$+B$+B$+B$+"k/7 "+D$+B$+B$+B$+B$+" £  "
  260 REM *** Space Invader B ***
  270 Alien1$(0)="ypv "+D$+B$+B$+B$+B$+"m"+BL$+"> "+D$+B$+B$+B$+B$+"! "" "
  280 Alien1$(1)="ypv "+D$+B$+B$+B$+B$+"m"+BL$+"> "+D$+B$+B$+B$+B$+" £  "
  290 REM *** Space Invader C ***
  300 Alien2$(0)="ypv "+D$+B$+B$+B$+B$+"m/> "+D$+B$+B$+B$+B$+"! "" "
  310 Alien2$(1)="ypv "+D$+B$+B$+B$+B$+"m/> "+D$+B$+B$+B$+B$+" £  "
  320 REM *** Blank Invader ***
  330 Blank1$="    "+D$+B$+B$+B$+B$+"    "+D$+B$+B$+B$+B$+"    "
  340 Blank2$="     "+D$+B$+B$+B$+B$+B$+"     "+D$+B$+B$+B$+B$+B$+"     "
  350 REM **** Blank Invader Side ****
  360 Blank_Line$=F$+F$+F$+" "+D$+B$+" "+D$+B$+" "
  370 REM *** Your Base ***
  380 Base$=" p^p "
  390 REM *** Sheild ***
  400 Sheild$=BL$+BL$+BL$+D$+B$+B$+B$+BL$+BL$+BL$+D$+B$+B$+B$+BL$+BL$+BL$
  410 REM *** Mystery ***
  420 Mystery$=" ns="
  430 PROC_Initialize
  440 REM Main Program
  450 REPEAT:finish=FALSE
  460   PROC_Title:PROC_Time_key
  470   IF A$=" " GOTO 510
  480   IF A$="Q" OR A$="q" GOTO 540
  490   PROC_Scores:PROC_Time_key
  500   IF A$="Q" OR A$="q" GOTO 540
  510   IF A$=" " THEN PROC_Play
  520   PROC_High_Scores:PROC_Time_key
  530   IF A$=" " GOTO 510
  540 UNTIL A$="Q" OR A$="q"
  550 CALL!-4
  560 DEF PROC_Title:CLS
  570 PRINTL$;Y$"          Cosmic Invaders"
  580 PRINTL$;G$"          Cosmic Invaders"
  590 PRINT'R$"Instructions for use :-"
  600 PRINTC$"     The object of the game is to"
  610 PRINTC$"shoot the cosmic aliens from the sky to";
  620 PRINTC$"save the world."
  630 PRINTM$"Press the following keys for use :-"
  640 PRINT'"     Z  -  To move left"
  650 PRINT'"     X  -  To move right"
  660 PRINT'"     SPACE  - To fire"
  670 PRINT'"     ESCAPE - To exit from game"
  680 PRINT'"     F/U - Freeze/Un-Freeze"
  690 PRINT'Y$"Option :-"
  700 PRINT'"     S/O - Sound on/off"
  710 PRINT'G$"Press"FL$M$"Space"ST$G$"to start or 'Q' to quit"
  715 REM
  720 ENDPROC
  730 DEF PROC_Play
  735 REM
  740 Score%=0:Base%=3
  750 Start%=0
  760 REPEAT:PROC_Setup_game
  770   REPEAT: REM PROC_Key_Test: PROC_Update_Invaders:REM IF NOT finish THEN PROC_Bombs
  771     TIME=0:REPEATUNTILTIME>TI%
  773     PROC_Update_Invaders
  774     PROC_Key_Test
  775     IF NOT finish THEN PROC_Bombs
  780   UNTIL finish=TRUE:Start%=Start%+1
  790 UNTIL P%<>7:Base%=Base%-1
  800 IF Score%>Scores%(9) THEN PROC_Score
  810 ENDPROC
  820 DEF PROC_Bombs
  830 LOCAL D%:IF Bomb%<MBomb% THEN PROC_New_Bomb
  840 IF Bomb%=0 GOTO 910
  850 FOR D%=1 TO MBomb%
  860   IF Bombs%(D%,1)<>0 THEN PROC_Look_Bomb
  870 NEXT
  880 FOR D%=1 TO MBomb%
  890   IF Bombs%(D%,1)=23 THEN PRINTTAB(BBombs%(D%,0),Bombs%(D%,1));" ";:Bombs%(D%,1)=0:Bombs%=Bombs%-1
  900 NEXT
  910 ENDPROC
  920 DEF PROC_Look_Bomb
  930 CD$=GET$(Bombs%(D%,0),Bombs%(D%,1)+1)
  931 CD=ASC(CD$)
  940 IF (CD<>32) AND ((Bombs%(D%,1)+1>Y%+(R%+1)*3) OR (Bombs%(D%,0)<X%) OR (Bombs%(D%,0)>=X%+(P%-O%+1)*4)) THEN PROC_Bomb_Hit ELSE PROC_Move_Bomb
  950 ENDPROC
  960 DEF PROC_Bomb_Hit
  970 Bomb%=Bomb%-1
  980 IF Bombs%(D%,1)+1=23 THEN PROC_Bomb_Hit_Base :GOTO1040
  990 CD$=GET$(Bombs%(D%,0),Bombs%(D%,1)+1):C%=ASC(CD$)
 1000 IF C%=ASC(BL$) THEN PRINT"|";:GOTO 1040
 1010 IF C%=ASC("|") THEN PRINT"p";:GOTO 1040
 1020 IF C%=ASC("p") THEN PRINT" ";:GOTO 1040
 1030 PRINT" ";
 1040 PRINTTAB(Bombs%(D%,0),Bombs%(D%,1));" ";:Bombs%(D%,1)=0
 1050 ENDPROC
 1060 DEF PROC_Bomb_Hit_Base
 1070 SOUND &13,-10,6,10
 1080 PRINTTAB(B%+1,23);"   ";
 1090 B%=1
 1100 Base%=Base%-1
 1110 PRINTTAB(0,24);STRING$(20," ");
 1120 IF Base%=0 THEN finish=TRUE ELSE PROC_Display_Base:PROC_Info_line
 1130 FORI%=1TO10000:NEXT
 1140 ENDPROC
 1150 DEF PROC_Move_Bomb
 1160 PRINTTAB(Bombs%(D%,0),Bombs%(D%,1));" ";
 1170 Bombs%(D%,1)=Bombs%(D%,1)+1
 1180 IF Bombs%(D%,1)=23 THEN Bombs%(D%,1)=0:Bomb%=Bomb%-1:GOTO 1200
 1190 PRINTTAB(Bombs%(D%,0),Bombs%(D%,1));"#";
 1200 ENDPROC
 1210 DEF PROC_New_Bomb
 1220 D%=-1:REPEAT:D%=D%+1:UNTIL Bombs%(D%,1)=0 OR D%=MBomb%
 1230 REPEAT:T%=RND(P%-O%)+O%:UNTIL Space%(T%,5)
 1240 J%=5:REPEAT:J%=J%-1:UNTIL Space%(T%,J%)=TRUE
 1250 Bombs%(D%,0)=X%+(T%-O%)*4+1:Bombs%(D%,1)=Y%+(J%)*3+2:Bomb%=Bomb%+1
 1260 ENDPROC
 1270 DEF PROC_Score
 1280 CLS:S%=10:REPEAT:S%=S%-1:UNTIL Score%<=Scores%(S%) OR S%=0
 1290 IF S%=8 THEN GOTO 1310
 1300 FOR I%=S%+1 TO 8:Scores%(I%+1)=Scores%(I%):Names$(I%+1)=Names$(I%):NEXT
 1310 Scores%(S%+1)=Score%
 1320 PRINT'''G$" You are at number ";S%+2;" in the top 10"''''M$"Enter your name"C$;
 1330 INPUT Names$:IF LEN(Names$)>15 THEN Names$=LEFT$(Names$,15)
 1340 Names$(S%+1)=Names$
 1350 ENDPROC
 1360 DEF PROC_Key_Test
 1370 IF INKEY(-98) AND NOT INKEY(-67) THEN PROC_Move_Left
 1380 IF INKEY(-67) AND NOT INKEY(-98) THEN PROC_Move_Right
 1390 IF INKEY(-99) AND NOT Missile% THEN PROC_Fire : REM -1
 1400 IF INKEY(-68) THEN REPEAT UNTIL INKEY(-54)
 1410 REM
 1420 ENDPROC
 1430 DEF PROC_Start_Mystery
 1440 MystX%=1:Mystery%=TRUE
 1450 PRINTTAB(MystX%,1);Mystery$;
 1460 ENDPROC
 1470 DEF PROC_Move_Mystery
 1480 SOUND &13,3,20,5
 1490 MystX%=MystX%+1
 1500 PRINTTAB(MystX%,1);Mystery$;
 1510 IF MystX% = 35 THEN Mystery%=FALSE:PRINTTAB(MystX%,1);"    ";
 1520 ENDPROC
 1530 DEF PROC_Fire
 1540 SOUND &0012,2,0,10:Missile%=TRUE:MissileX%=B%+2:MissileY%=22:PROC_Move_Missile(L%)
 1550 ENDPROC
 1560 DEF PROC_Move_Missile(L%)
 1580 CD$=GET$(MissileX%,MissileY%):CD=ASC(CD$)
 1590 IF CD <> 32 THEN PROC_Hit:GOTO 1650
 1600 PRINTTAB(MissileX%,MissileY%+1);
 1610 IF MissileY%+1 <> 23 THEN PRINT" "
 1620 PRINTTAB(MissileX%,MissileY%);
 1630 IF MissileY%<>1 THEN PRINT"^"
 1640 IF MissileY%>1 THEN MissileY%=MissileY%-1 ELSE Missile%=FALSE
 1650 ENDPROC
 1660 DEF PROC_Hit
 1670 SOUND &0010,-15,6,5:IF MissileY% < 22 THEN PRINTTAB(MissileX%,MissileY%+1);" "
 1680 CD$=GET$(MissileX%,MissileY%): C%=ASC(CD$)
 1690 IF (MissileY%+1<=Y%+(R%+1)*3) AND (MissileX%>=X%) AND (MissileX%<X%+(P%-O%+1)*4) THEN PROC_Invader_Hit(L%):GOTO1720
 1700 IF MissileY%=1 THEN PROC_Mystery_Hit:GOTO 1740
 1710 PROC_Base_Hit
 1720 I%=7
 1730 IF NOT FN_Is_Line THEN finish=TRUE
 1740 ENDPROC
 1750 DEF PROC_Mystery_Hit
 1760 PRINTTAB(MystX%,1);"     ";
 1770 Score%=Score%+RND(30)*10
 1780 PROC_Info_line
 1790 ENDPROC
 1800 DEF PROC_Base_Hit
 1810 IF C%=ASC(BL$) THEN PRINT"/";:GOTO 1840
 1820 IF C%=ASC("/") THEN PRINT"Â£";:GOTO 1840
 1830 PRINT" ";
 1840 Missile%=FALSE
 1850 ENDPROC
 1860 DEF PROC_Invader_Hit(L%)
 1870 LOCAL I%,K%
 1880 IF Left% THEN G%=-1 ELSE G%=1
 1890 IF MissileX% > X%+(L%-O%+1)*4 THEN I%=(MissileX%-X%+(O%*4)+G%)DIV4 ELSE I%=(MissileX%-X%+O%*4)DIV4
 1900 K%=(MissileY%-Y%) DIV 3:Space%(I%,K%)=FALSE:J%=(I%-O%)*4:PROC_Blank(J%)
 1910 IF NOT FN_Is_Line THEN Space%(I%,5)=FALSE:PROC_Boundary_Update
 1920 K%=(MissileY%-Y%) DIV 3
 1930 IF NOT FN_Is_Row THEN Space%(7,K%)=FALSE:PROC_Boundary_Update
 1940 Missile%=FALSE:Score%=Score%+((3-((MissileY%-Y%)DIV3)DIV2)*20):PROC_Info_line
 1950 ENDPROC
 1960 DEF PROC_Boundary_Update
 1970 S%=O%:PROC_X_Boundary_Update:PROC_Y_Boundary_Update:X%=X%+(O%-S%)*4
 1980 ENDPROC
 1990 DEF PROC_X_Boundary_Update
 2000 IF Space%(O%,5) GOTO 2020
 2010 REPEAT:O%=O%+1:UNTIL Space%(O%,5)
 2020 IF P%=7 GOTO 2060
 2030 IF Space%(P%,5) GOTO 2060
 2040 REPEAT:P%=P%-1:IF P%<0 THEN finish=TRUE:P%=7
 2050 UNTIL Space%(P%,5)
 2060 ENDPROC
 2070 DEF PROC_Y_Boundary_Update
 2080 IF Space%(7,Q%) GOTO 2100
 2090 REPEAT:Q%=Q%+1:UNTIL Space%(7,Q%)
 2100 IF R%=5 GOTO 2140
 2110 IF Space%(7,R%) GOTO 2140
 2120 REPEAT:R%=R%-1:IF R%<0 THEN finish=TRUE:R%=5
 2130 UNTIL Space%(7,R%)
 2140 ENDPROC
 2150 DEF PROC_Move_Left
 2160 IF B%>1 THEN B%=B%-1
 2170 PROC_Display_Base
 2180 ENDPROC
 2190 DEF PROC_Move_Right
 2200 IF B%<34 THEN B%=B%+1
 2210 PROC_Display_Base
 2220 ENDPROC
 2230 DEF PROC_Setup_game
 2240 CLS
 2250 O%=0:P%=6:Q%=0:R%=4:B%=1:Bomb%=0:MBomb%=Start%+6:FOR I%=0 TO 10:Bombs%(I%,1)=0:NEXT
 2260 Mystery%=FALSE:Missile%=FALSE:MissileX%=0:MissileY%=0:finish=FALSE:VDU 23,1,0;0;0;0;
 2270 PROC_Info_line:PROC_Colour_setup:PROC_Invader_setup:PROC_Display_Sheilds:PROC_Display_Invaders:PROC_Display_Base
 2280 ENDPROC
 2290 DEF PROC_Display_Base
 2300 PRINTTAB(B%,23);Base$
 2310 ENDPROC
 2320 DEF PROC_Display_Sheilds
 2330 FOR I%= 0 TO 3:PRINTTAB(5+I%*9,20);Sheild$:NEXT
 2340 ENDPROC
 2350 DEF PROC_Invader_setup
 2360 FOR I%= 0 TO 7:FOR J%= 0 TO 5:Space%(I%,J%)=TRUE:NEXT:NEXT
 2370 X%=10:Y%=Start%MOD4 + 2:Left%=TRUE
 2380 ENDPROC
 2390 DEF PROC_Display_Invaders
 2400 SOUND 1,-15,1,1:I%=O%:M%=ABS((X%+I%*4)MOD 2)
 2410 REPEAT:PROC_Key_Test:J%=(I%-O%)*4
 2420   FOR K%= Q% TO R%:IF Space%(I%,K%) THEN PROC_Invader ELSE PROC_Blank(J%)
 2430   NEXT
 2440   IF Missile% THEN PROC_Move_Missile(I%)
 2450   IF Mystery% THEN PROC_Move_Mystery ELSE IF RND(100)=1 THEN PROC_Start_Mystery
 2460   I%=I%+1:UNTIL I%>P% OR finish=TRUE
 2470 ENDPROC
 2480 DEF PROC_Update_Invaders
 2490 IF Left% THEN X%=X%-1 ELSE X%=X%+1
 2500 IF NOT Left% THEN PRINTTAB(X%-1,Y%+Q%*3);STRING$((R%-Q%+1)*3," "+D$+B$);
 2510 PROC_Display_Invaders
 2520 IF X%<=1 THEN Left%=FALSE:PROC_Move_Down
 2530 IF X%+(P%-O%+1)*4>=39 THEN Left%=TRUE:PROC_Move_Down
 2540 ENDPROC
 2550 DEF PROC_Move_Down
 2560 PRINTTAB(X%,Y%+Q%*3);STRING$((P%-O%+1)*4," ");:Y%=Y%+1:IF Y%-(4-R%)*3=9THEN finish=TRUE
 2570 ENDPROC
 2580 DEF FN_Is_Line
 2590 L%=0:FOR K%=0 TO 4:IF NOT Space%(I%,K%) THEN L%=L%+1
 2600 NEXT:IF L%= 5 THEN =FALSE ELSE =TRUE
 2610 DEF FN_Is_Row
 2620 L%=0:FOR I%=0 TO 6:IF NOT Space%(I%,K%) THEN L%=L%+1
 2630 NEXT:IF L%= 7 THEN =FALSE ELSE =TRUE
 2640 DEF PROC_Invader
 2650 PRINTTAB(X%+J%,Y%+K%*3);
 2660 ON K%+1 GOTO 2670,2670,2680,2680,2690,2700
 2670 PRINT Alien2$(M%):GOTO 2710
 2680 PRINT Alien1$(M%):GOTO 2710
 2690 PRINT Alien0$(M%):GOTO 2710
 2700 finish=TRUE
 2710 ENDPROC
 2720 DEF PROC_Blank(J%)
 2730 IF NOT Left% THEN J%=J%-1
 2740 PRINTTAB(X%+J%,Y%+K%*3);:IF Left% THEN PRINTBlank1$ ELSEPRINTBlank2$
 2750 ENDPROC
 2760 DEF PROC_Colour_setup
 2770 PRINTTAB(0,1);GR$;
 2780 FOR I%= 2 TO 7:PRINTTAB(0,I%);GC$;TAB(0,I%+6);GR$;TAB(0,I%+12);GY$;:NEXT
 2790 FOR I%= 0 TO 2:PRINTTAB(0,I%+20);GG$;:NEXT:PRINT'GR$;
 2800 ENDPROC
 2810 DEF PROC_Info_line
 2820 PRINTTAB(0,0)G$"HS"M$;Scores%(0);
 2830 PRINTTAB(20,0)G$"Score"M$;Score%;
 2840 PRINTTAB(0,24);CHR$(150);
 2850 FOR I%= 1 TO Base%:PRINTBase$;:NEXT
 2860 ENDPROC
 2870 DEF PROC_Scores
 2880 CLS
 2890 PRINTCHR$(141)CHR$(130)"   Scores given :-"
 2900 PRINTCHR$(141)CHR$(130)"   Scores given :-"
 2910 FOR I%= 4 TO 24:PRINT TAB(0,I%);CHR$(150);:NEXT
 2920 PRINTTAB(5,6);Mystery$;TAB(20,6);CHR$(133);"????";
 2930 PRINTTAB(6,10);Alien2$(0);TAB(20,11);CHR$(133);"60"
 2940 PRINTTAB(6,15);Alien1$(0);TAB(20,16);CHR$(133);"40"
 2950 PRINTTAB(6,20);Alien0$(0);TAB(20,21);CHR$(133);"20"
 2960 ENDPROC
 2970 DEF PROC_High_Scores
 2980 CLS
 2990 PRINTCHR$(141)CHR$(130)"          High Scores"
 3000 PRINTCHR$(141)CHR$(130)"          High Scores"
 3010 FOR I%= 0 TO 9
 3020   PRINT'CHR$(134);I%+1;TAB(4);Names$(I%);TAB(30);Scores%(I%)
 3030 NEXT
 3040 ENDPROC
 3050 DEF PROC_Initialize
 3060 REM
 3070 FOR I%= 0 TO 9
 3080   Names$(I%)="Mark beat you !!!"
 3090   Scores%(I%)=10000-(I%*1000)
 3100 NEXT
 3110 ENDPROC
 3120 DEF PROC_Time_key
 3130 TIME=0
 3140 REPEAT
 3150   A$=INKEY$(0)
 3160   IF A$="s" OR A$="S" THEN VOL=1
 3170   IF A$="o" OR A$="O" THEN VOL=0
 3180 UNTIL A$="Q" OR A$="q" OR A$=" " OR TIME = 1000
 3190 ENDPROC
 3200 REM DEF FN_Find_Char
 3240 REM Error Routine
 3250 IF ERR=17GOTO440
 3260 REM REPAIRED VERSION
 

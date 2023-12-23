   10 REM Munch2(Munchman main program)
   20 REM Version 1A
   30 REM
   40 REM FIXED FOR AGON/CONSOLE8
   50 REM BY EIGHTBITSWIDE
   60 REM
   70 TI%=20
   80 MODE 9
   90 REM ENVELOPE 1,1,4,-4,4,10,20,10,127,0,0,-5,126,126
  100 H%=0:DIM maze$(19,24),ghost(2,2)
  110 REPEAT
  120   PRINTTAB(17,2)"MUNCHMAN"TAB(6,9)"CONTROLS:"TAB(6,11)"ARROW KEYS"TAB(6,13)"OR"TAB(6,15)"JOYSTICK"
  130   VDU17,3,31,6,21,238,17,6,32,32,243,32,243,32,243:PROCspace
  140   lives%=3:score%=0:sheet%=0:ghost=0:dir$=" "
  150   PROCsetup_maze:TIME=0:fruit=0:EAT=0
  160   COLOUR7:PRINTTAB(1,0)"Score"TAB(14)"High"
  165   REM
  170   PROCprint_score(0):PRINTTAB(19-LEN(STR$(H%)),1);H%:COLOUR3:PRINTTAB(1,28)STRING$(lives%-1,CHR$237+" ")" "
  180   REPEAT
  185     PROCtime(10)
  190     ghost=ghost+1:IF ghost=3:ghost=0
  200     PROCpacman:PROCcheck
  210     IF EAT=1:SOUND1,-14,150,1
  220     IFTIME>2000ANDfruit=0ANDtot%<150:PROCfruit
  230     IFRND(1)>.9:PROCdoor
  240     IFfruit=1ANDTIME>3000/sheet%:PROCno_fruit
  250     IFTIME>1500/sheet% ANDEAT=1:EAT=0
  260   UNTIL tot%=187 OR KILL=1
  270   IF tot%=187:GOTO 150
  280   PROCkilled:IF lives%>0:GOTO 170
  290   PROCend:UNTIL FALSE
  310 DEFFNcalcX(X)
  320 IF X>19:X=0
  330 IF X<0:X=19
  340 =X
  360 DEFFNcalcY(Y)
  370 IF Y>24:Y=0
  380 IF Y<0:Y=24
  390 =Y
  410 DEFPROCtime(T)
  420 TM=TIME:REPEAT UNTIL TIME>TM+T
  430 ENDPROC
  450 DEFPROCprint_score(S%)
  460 score%=score%+S%
  470 COLOUR7:PRINTTAB(1,1);score%
  480 ENDPROC
  500 DEFPROCpacman
  510 OX%=pacX%:OY%=pacY%:SC=score%:IF pac$<>CHR$246:OP$=pac$
  520 JOY=GET(158)
  530 IF (JOY AND 253)=JOY pac$=CHR$239:pacY%=pacY%-1
  540 IF (JOY AND 247)=JOY pac$=CHR$240:pacY%=pacY%+1
  550 IF (JOY AND 223)=JOY pac$=CHR$238:pacX%=pacX%-1
  560 IF (JOY AND 127)=JOY pac$=CHR$237:pacX%=pacX%+1
  561 :
  562 IF INKEY(-58)<0 THEN pac$=CHR$239:pacY%=pacY%-1
  563 IF INKEY(-42)<0 THEN pac$=CHR$240:pacY%=pacY%+1
  564 IF INKEY(-26)<0 THEN pac$=CHR$238:pacX%=pacX%-1
  565 IF INKEY(-122)<0 THEN pac$=CHR$237:pacX%=pacX%+1
  566 :
  570 pacY%=FNcalcY(pacY%):pacX%=FNcalcX(pacX%)
  580 IF dir$="" AND pac$=CHR$246 THEN  pac$=OP$ ELSE IF dir$="" pac$=CHR$246
  590 A$=maze$(pacX%,pacY%)
  600 IF A$=".":PROCprint_score(2):SOUND1,1,60,1:tot%=tot%+1
  610 IF A$=CHR$244:PROCprint_score(100):PROCno_fruit:SOUND1,1,150,2
  620 IF A$="+":PROCprint_score(50):EAT=1:TIME=0:SOUND1,1,100,2
  630 IF SC=score% AND A$<>" ":pacX%=OX%:pacY%=OY%
  640 VDU17,3,31,OX%,OY%+3,32
  650 PRINTTAB(pacX%,pacY%+3);pac$
  660 maze$(pacX%,pacY%)=" "
  670 ENDPROC
  690 DEFPROCrub_out_ghost(G%):COLOUR4
  700 M$=maze$(ghost(G%,1),ghost(G%,2))
  710 IF M$="." OR M$="+":COLOUR2
  720 IF M$=CHR$244:COLOUR1
  730 IF M$=CHR$245:COLOUR5
  740 PRINTTAB(ghost(G%,1),ghost(G%,2)+3)maze$(ghost(G%,1),ghost(G%,2))
  750 ENDPROC
  770 DEFPROCghost(G%):C=0
  780 PROCrub_out_ghost(G%)
  790 IF EAT=1:COLOUR4 ELSE COLOURghost(G%,0)
  800 IFEAT=0:DX%=1:DY%=1 ELSE DX%=-1:DY%=-1
  810 IFG%=0:PROCvert:IFC=0:PROChoriz
  820 IFG%=1:PROChoriz:IFC=0:PROCvert
  830 IFG%=2:PROChoriz:PROCvert
  840 PRINTTAB(ghost(G%,1),ghost(G%,2)+3)CHR$243
  850 ENDPROC
  870 DEFPROCvert
  880 A=FNcalcY(ghost(G%,2)+DY%)
  890 B=FNcalcY(ghost(G%,2)-DY%)
  900 IFpacY%>ghost(G%,2):ghost(G%,2)=A:C=1
  910 IFpacY%<ghost(G%,2):ghost(G%,2)=B:C=1
  920 ENDPROC
  940 DEFPROChoriz
  950 A=FNcalcX(ghost(G%,1)+DX%)
  960 B=FNcalcX(ghost(G%,1)-DX%)
  970 IFpacX%>ghost(G%,1):ghost(G%,1)=A:C=1
  980 IFpacX%<ghost(G%,1):ghost(G%,1)=B:C=1
  990 ENDPROC
 1010 DEFPROCdoor
 1020 D%=RND(4):RESTORE1850
 1030 FORF%=1 TO D%:READX,Y:NEXT
 1040 IF X=pacX% AND Y=pacY%:GOTO 1020
 1050 IF maze$(X,Y)=" ":maze$(X,Y)=CHR$245 ELSE maze$(X,Y)=" "
 1060 VDU17,5,31,X,Y+3,ASC(maze$(X,Y))
 1070 ENDPROC
 1090 DEFPROCfruit
 1100 VDU17,1,31,9,18,244
 1110 fruit=1:TIME=0
 1120 maze$(9,15)=CHR$244
 1130 ENDPROC
 1150 DEFPROCno_fruit
 1160 VDU31,9,18,32:fruit=0
 1170 maze$(9,15)=" "
 1180 ENDPROC
 1200 DEFPROCcheck:KILL=0
 1210 FOR G%=0 TO 2
 1220   IF G%=ghost:PROCghost(G%)
 1230   IF ghost(G%,1)<>pacX% OR ghost(G%,2)<>pacY%:GOTO 1250
 1240   IF EAT=1:PROCprint_score(250):SOUND1,1,250,1:PROCsetup_ghosts(G%) ELSE KILL=1
 1250 NEXT
 1260 ENDPROC
 1280 DEFPROCkilled:COLOUR3
 1290 FOR C=237 TO 242
 1300   VDU31,pacX%,pacY%+3,C
 1310   SOUND1,1,C/2,1:PROCtime(20)
 1320 NEXT
 1330 VDU31,pacX%,pacY%+3,32
 1340 FOR G%=0 TO 2
 1350   PROCrub_out_ghost(G%)
 1360   PROCsetup_ghosts(G%)
 1370 NEXT
 1380 PROCpac:lives%=lives%-1
 1390 ENDPROC
 1410 DEFPROCend
 1420 IF score%>H%:H%=score%
 1430 COLOUR7:PRINTTAB(19-LEN(STR$(H%)),1);H%
 1440 PROCspace
 1450 ENDPROC
 1470 DEFPROCspace
 1480 VDU17,15,31,1,30:PRINT"SPACE BAR TO START"
 1490 REPEAT UNTIL GET=32:VDU12,17,7
 1500 ENDPROC
 1520 DEFPROCsetup_ghosts(G%)
 1530 RESTORE 1840
 1540 FOR D%=0 TO G%:READ COL,X:NEXT
 1550 ghost(G%,1)=X
 1560 ghost(G%,2)=12
 1570 ghost(G%,0)=COL
 1580 ENDPROC
 1600 DEFPROCpac
 1610 pacX%=9:pacY%=20:pac$=CHR$237
 1620 ENDPROC
 1640 DEFPROCsetup_maze
 1650 FORG%=0TO2:PROCsetup_ghosts(G%):NEXT
 1660 PROCpac:tot%=0:sheet%=sheet%+1
 1670 COLOUR128:RESTORE 1860
 1680 FOR D%=3 TO 27
 1690   READ maze$
 1700   FOR E%=0 TO 19
 1710     A$=MID$(maze$,E%+1,1)
 1720     IF A$>="A" AND A$<="M":M$=CHR$(ASC(A$)+159):COLOUR4 ELSE M$=A$:COLOUR2
 1730     PRINTTAB(E%,D%)M$
 1740     maze$(E%,D%-3)=M$
 1750   NEXT
 1760 NEXT
 1770 VDU19,2,9,0,0,0,19,4,14,0,0,0
 1780 FOR D%=1 TO 21
 1790   SOUND 2,-15,D%*2,1
 1800   SOUND 1,-15,D%*3,1
 1810 NEXT:VDU20
 1820 ENDPROC
 1840 DATA 1,1,5,9,6,18
 1850 DATA 9,1,9,22,2,15,17,15
 1860 DATA"        A A         "
 1870 DATA" CBBBBBBL LBBBBBBBD "
 1880 DATA" A+..............+A "
 1890 DATA" A.CI.JBD.CBI.JBD.A "
 1900 DATA" A.G....A.A.....G.A "
 1910 DATA" A...CI.G.G.JBD...A "
 1920 DATA" A.H.G........A.H.A "
 1930 DATA" A.G...CBD.CD.A.A.A "
 1940 DATA" A...H.EBF.EF.G.A.A "
 1950 DATA" A.JBK..........G.A "
 1960 DATA" A...G.CBBBD.JD...A "
 1970 DATA"BLBI...A   A..MBBBLB"
 1980 DATA"  ...JBK   MI.G...  "
 1990 DATA"BD.H...A   A....H.CB"
 2000 DATA" A.MBI.EBBBF.CI.A.A "
 2010 DATA" M K..... ...A..M K "
 2020 DATA" A.EI.JBI.H.CK.JF.A "
 2030 DATA" A........A.EF....A "
 2040 DATA" MBBI.H.H.A....JBBK "
 2050 DATA" A....A.G.EBBI....A "
 2060 DATA" A.CD.A.. .....CD.A "
 2070 DATA" A.EF.G.H.H.JBBLF.A "
 2080 DATA" A+.....M K......+A "
 2090 DATA" EBBBBBBK MBBBBBBBF "
 2100 DATA"        A A         "
 2120 ON ERROR OFF
 2130 MODE7
 2135 REM
 2140 REM
 2145 REPORT:PRINT" at line ";ERL
 2150 END

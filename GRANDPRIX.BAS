   10 REM Grand Prix
   20 REM By S.Merrigan
   30 REM (c) Electron User Volume 3, Issue 6, in March 1986
   32 REM Sourced from: https://bbcmicro.co.uk/game.php?id=799
   35 REM Fixed to run on the Agon/Console8
   36 REM By Eightbitswide
   40 GOSUB 1200 : REM REMOVE EXT CHARS
   45 REM ENVELOPE1,1,-4,-2,-1,1,5,-1,126,0,0,-126,126,126
   50 MODE13:VDU23,1,0;0;0;0;:CLS:PROCins
   60 MODE11:DIMA%(2,8):DIMG%(4):DIMB%(39,31):VDU23,1,0;0;0;0;:PROCread
   70 PROCvar:ti%=10:X%=5:Z%=5:PROCdraw
   80 PROCstarter
   90 REPEAT:PROCcar1:PROCcar2:PROCcar3:PROCmove_man
  100   TIME=0:REPEATUNTILTIME>ti%:IF Q%=q% AND W%=w% OR Q%=a% AND W%=s% OR Q%=d% AND W%=f% PROCdelay
  110 UNTIL G%(1)=X% OR G%(4)=X%
  120 TIME=0:REPEATUNTILTIME>200
  130 MODE4:PROCrace_pos
  140 IF G%(1)>G%(4) MODE4:PROCbeaten:GOTO70
  150 MODE4:PROCraceover
  160 GOTO80
  170 DEFPROCrace_pos:VDU23,1,0;0;0;0;19,0,1;0;
  180 MOVE0,0:DRAW1279,0:DRAW1279,1023:DRAW0,1023:DRAW0,0
  190 MOVE476,916:DRAW796,916
  200 VDU5:MOVE480,950:PRINT;"GRAND PRIX":MOVE474,946:GCOL0,0:PRINT;"GRAND PRIX":VDU4
  210 PRINTTAB(8,5);"1st";TAB(8,10);"2nd"
  220 IF G%(1)>G%(4) PRINTTAB(16,5);"CAR 4";TAB(16,10);"BETWEEN CAR 1,2 & YOU"ELSE PRINTTAB(16,5);"YOU";TAB(16,10);"CAR 4"
  225 REM *FX21,0
  230 PRINTTAB(13,VPOS+5);"PRESS SPACE":REPEATUNTILINKEY0=32
  240 ENDPROC
  250 DEFPROCdelay:FORL%=1TO5:TIME=0:REPEATUNTILTIME>5:SOUND0,-15,5,2:SOUND1,-15,L%*5,2:PROCcar1:PROCcar2:PROCcar3:VDU31,Q%,W%,(229+DIR%):NEXT:ENDPROC
  260 DEFPROCvar
  270 VDU23,1,0;:PRINT''':CLS
  280 RESTORE520:FORJ%=1TO8:READA,B:A%(1,J%)=A:A%(2,J%)=B:NEXT
  290 VDU23,225,255,255,255,255,255,255,255,255
  300 FORI%=220TO255:VDU23,I%,0,0,0,0,0,0,0,0:NEXT
  310 VDU23,226,255,127,63,31,15,7,3,1;23,227,255,254,252,248,240,224,192,128
  320 VDU23,228,1,3,7,15,31,63,127,255;23,229,128,192,224,240,248,252,254,255
  330 VDU23,230,0,119,34,126,126,34,119,0;23,231,10,31,14,95,248,112,248,80
  340 VDU23,232,66,126,90,24,90,126,90,0;23,233,80,248,112,250,95,14,31,10
  350 VDU23,234,0,238,68,126,126,68,238,0;23,235,10,31,14,95,250,112,248,80
  360 VDU23,236,0,90,126,90,24,90,126,66;23,237,80,248,112,250,95,14,31,10
  370 VDU23,238,0,90,126,90,24,90,126,90;23,225,255,255,255,255,255,255,255,255
  390 Q%=22:W%=8:DIR%=5
  400 q%=22:w%=9:a%=22:s%=7:d%=22:f%=6
  410 v%=1
  420 FORI=1TO4:G%(I)=0:NEXT
  430 ENDPROC
  440 DEFPROCread:RESTORE570:FORr%=0TO26:FORt%=0TO39:READy%:B%(t%,r%)=y%:NEXT,:ENDPROC
  450   DEFPROCmove_man:DIR%=DIR%-INKEY(-103):IF DIR%>=9 DIR%=1
  460   DIR%=DIR%+INKEY(-104):IF DIR%<=0 DIR%=8
  470   IF Q%=22 AND W%<15:IF v%=1 G%(4)=G%(4)+1:PRINTTAB(22,15);G%(4):v%=0
  480   IF Q%=22 AND W%>15:v%=1
  490   VDU31,Q%,W%,32
  500   IF B%(Q%+A%(2,DIR%),W%+A%(1,DIR%))>0W%=W%+A%(1,DIR%):Q%=Q%+A%(2,DIR%):ELSE SOUND1,-15,50,2
  510   VDU31,Q%,W%,(229+DIR%):ENDPROC
  520   DATA0,-1,1,-1,1,0,1,1,0,1,-1,1,-1,0,-1,-1
  530   DEFPROCdraw:VDU19,1,13;0;0;0 : REM COLOR OF THE TRACK
  540   FORr%=0TO26:SOUND1,-15,100+r%*2,2:FORt%=0TO39STEP2:VDU225-B%(t%,r%),225-B%(t%+1,r%):NEXT,
  550     PRINTTAB(14,11);"COMPETITORS";TAB(12,13);"1";TAB(17,13);"2";TAB(22,13);"3";TAB(27,13);"4";TAB(20,2);X%;" Lap";TAB(21,4);"Race";TAB(5,15);"Laps"
  560     ENDPROC
  570     DATA0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-2,5,5,5,5,5,5,5,5,5,5,5,5,5,5,4,-1,0,0,0,0,0,0,0,0,0,0,-2,5,5,5,5,5,5,5,5,4,-1,0
  580     DATA0,6,5,5,5,5,5,5,5,5,5,5,5,5,5,5,3,3,0,0,0,0,0,0,0,0,0,0,6,5,5,5,5,5,5,5,5,3,3,0,0,7,7,5,5,5,5,5,5,5,5,5,5,5,5,3,3,3,0,0,0,0,0,0,0,0,0,0,7,7,5,5,5,5,5,3,3,3,3,0
  590     DATA0,7,7,7,-3,0,0,0,0,0,0,0,0,0,-4,3,11,3,0,0,0,0,0,0,0,0,0,0,7,7,7,-3,0,0,-4,3,3,3,3,0,0,7,7,7,0,0,0,0,0,0,0,0,0,0,0,3,3,3,-1,0,0,0,0,0,0,0,0,-2,7,7,7,0,0,0,0,3,3,3,3,0
  600     DATA0,7,7,7,0,0,0,0,0,0,0,0,0,0,0,3,3,5,5,5,5,5,9,5,5,5,5,5,7,7,7,0,0,0,0,3,3,3,3,0,0,7,7,7,0,0,0,0,0,0,0,0,0,0,0,3,5,5,5,5,5,5,9,5,5,5,5,5,5,7,7,0,0,0,0,3,3,3,3,0
  610     DATA0,6,7,7,0,0,0,0,0,0,0,0,0,0,0,4,5,5,5,5,4,5,9,5,5,4,5,5,5,5,7,0,0,0,0,3,3,3,3,0,0,7,7,7,0,0,0,0,0,0,0,0,0,0,0,-4,5,6,5,5,5,5,9,6,5,5,5,5,6,5,-3,0,0,0,0,3,3,3,3,0
  620     DATA0,7,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,3,3,3,0,0,7,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,0
  630     DATA0,7,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,11,3,0,0,7,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,0
  640     DATA0,7,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,0,0,7,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,0
  650     DATA0,7,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,0,0,7,7,7,0,0,0,0,0,0,0,0,0,-2,2,1,1,1,1,1,1,1,-1,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,0
  660     DATA0,7,7,7,0,0,0,0,0,0,0,0,0,3,3,1,1,1,1,1,1,1,8,0,0,0,0,0,0,0,0,0,0,0,0,3,2,3,3,0,0,7,7,7,0,0,0,0,0,0,0,0,0,3,3,3,1,1,1,1,1,7,7,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,0
  670     DATA0,7,7,7,0,0,0,0,0,0,0,0,0,3,11,3,-3,0,0,-4,7,7,7,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,0,0,7,7,7,-1,0,0,0,0,0,0,0,-2,3,3,3,0,0,0,0,7,7,7,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,0
  680     DATA0,7,7,7,1,1,1,1,1,1,1,1,1,1,3,3,0,0,0,0,7,7,7,-1,0,0,0,0,0,0,0,0,0,0,-2,3,3,3,3,0,0,7,7,1,1,1,1,1,1,1,1,1,1,1,1,3,0,0,0,0,7,7,7,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,0
  690     DATA0,7,7,7,1,1,1,1,1,1,1,1,1,1,1,2,0,0,0,0,7,7,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,2,0,0,-4,8,1,1,1,1,1,1,1,1,1,1,1,1,-3,0,0,0,0,-4,8,1,1,1,8,1,1,1,1,8,1,1,1,1,1,1,1,-3,0
  700     DATA0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  710     DEFPROCcar1:c%=B%(q%,w%):IFc%=9 G%(1)=G%(1)+1:c%=5:PRINTTAB(27,15);G%(1)
  720     VDU31,q%,w%,32:q%=q%+A%(2,c%):w%=w%+A%(1,c%):VDU31,q%,w%,229+c%:ENDPROC
  730     DEFPROCcar2:IF RND(30)=1 ENDPROC
  740     c%=B%(a%,s%):IFc%=9 G%(2)=G%(2)+1:c%=5:PRINTTAB(17,15);G%(2)
  750     IFc%=11 c%=RND(2)+2
  760     VDU31,a%,s%,32:a%=a%+A%(2,c%):s%=s%+A%(1,c%):VDU31,a%,s%,229+c%:ENDPROC
  770     DEFPROCcar3:c%=B%(d%,f%):IF c%=9 G%(3)=G%(3)+1:c%=5:PRINTTAB(12,15);G%(3)
  780     IFc%=11 c%=RND(2)+2
  790     VDU31,d%,f%,32:d%=d%+A%(2,c%):f%=f%+A%(1,c%):VDU31,d%,f%,229+c%:ENDPROC
  800     DEFPROCT:TIME=0:REPEATUNTILTIME>3:ENDPROC
  810     DEFPROCraceover
  820     VDU23,1,0;0;0;0;:*FX15
  830     ti%=ti%-1:IFti%<0 ti%=0
  840     X%=X%+RND(2):IF X%>10 X%=10
  850     Z%=Z%+1:IF X%=10 X%=X%-RND(3)
  860     PRINTTAB(0,0);"You Have been promoted to FORMULA ";ti%+1'"racing.";TAB(0,2);
  870     FORI=29TO1STEP-1:PROCT:VDU11:SOUND0,1,30,2:SOUND1,-15,I*3,2:NEXT:SOUND1,1,30,10
  880     PRINTTAB(15,31);"PRESS SPACE":FORI=1TO15:PROCT:VDU10:SOUND0,1,30,2:SOUND1,-15,I*3,2:NEXT
  890     REPEATUNTILINKEY0=32
  895     MODE 3
  900     PROCvar:PROCdraw:ENDPROC
  910     RUN
  920     DEFPROCbeaten
  925     VDU23,1,0;0;0;0;
  930     PRINTTAB(0,0);"We are sorry to inform you that you"'"have not qualified for formula ";ti%+1;'"racing."
  940     FORI=30TO1STEP-1:PROCT:VDU11:SOUND0,1,30,2:SOUND1,-15,I*3,2:NEXT:SOUND1,1,30,10
  950     PRINTTAB(15,31);"PRESS SPACE":FORI=1TO15:PROCT:VDU10:SOUND0,1,30,2:SOUND1,-15,I*3,2:NEXT
  955     MODE 11
  960     REPEATUNTILGET$=" "
  970     ENDPROC
  980     DEFPROCstarter
  990     SOUND1,1,200,8:PRINTTAB(20,6);"READY":K=INKEY(90):SOUND1,1,150,8
 1000     PRINTTAB(20,6);"STEADY":K=INKEY(90):SOUND1,1,100,6
 1010     PRINTTAB(20,6);"  GO  ":K=INKEY(90):SOUND1,1,50,4:K=INKEY(99)
 1020     ENDPROC
 1030     DEFPROCins:PRINT:VDU19,1,0;0;0;0;
 1040     A$="  PRESS  ":B$="  SPACE  ":I%=0
 1050     PRINTSPC(14);"INSTRUCTIONS"'SPC(14);"~~~~~~~~~~~~"
 1060     PRINT" You are a formula six racing driver"'"striving  to  improve  to  become  a"'"formula 1 driver."
 1070     PRINT"On the grid you are car number three"'"watch out for car 4 as he is usually"'"the ace driver in the race."
 1080     PRINT"If you win a race you get promotion."'"On  losing  a  race you are returned"'"to formula six. "
 1090     PRINT" Crashing into other cars causes you"'"to have to wait for a short spell to"'"have your car repaired."
 1100     PRINT'SPC(13);"Your Keys Are"''SPC(7);"> - revolve clockwise"'SPC(7);"< - revolve anti-clockwise"
 1105     REM *FX21,0
 1110     VDU20:COLOUR2:COLOUR129
 1120     REM REPEAT:I%=I%+1:IF I%=10 I%=0
 1130     REM TIME=0:REPEATUNTILTIME>10
 1140     REM IF I%=2 SOUND1,1,50,8:TIME=0:REPEAT UNTIL TIME>80
 1150     REM SOUND1,1,I%*RND(3),2
 1160     REM PRINTTAB(21,22);RIGHT$(B$,9-I%);LEFT$(B$,I%)
 1170     REM PRINTTAB(12,22);RIGHT$(A$,I%);LEFT$(A$,9-I%)
 1171     PRINTTAB(14,22);:PRINT"PRESS SPACE";
 1172     REPEAT
 1180     UNTIL INKEY0=32
 1190     ENDPROC 
 1200     FOR X = 200 TO 250 : REM CLEAR EXTRA CHARS FROM AGON CHARSET
 1210       VDU 23,X,0,0,0,0,0,0,0,0
 1220     NEXT
 1230     RETURN

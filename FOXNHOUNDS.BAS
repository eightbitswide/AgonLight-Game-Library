   10 MODE 4 : GOSUB 2000
   20 VDU19,1,3,0,0,0
   30 VDU23,224,&CC,&33,&CC,&33,&CC,&33,&CC,&33
   40 VDU23,225,&01,&01,&01,&01,&01,&01,&01,&01
   50 VDU23,226,&C0,&C0,&C0,&C0,&C0,&C0,&C0,&C0
   60 VDU23,227,&FF,0,0,0,0,0,0,0
   70 VDU23,228,&FF,&7F,&3F,&1F,&0F,&07,&03,&01
   80 VDU23,229,&01,&03,&07,&0F,&1F,&3F,&7F,&FF
   90 VDU23,230,&80,&C0,&E0,&F0,&F8,&FC,&FE,&FF
  100 VDU23,231,&FF,&FE,&FC,&F8,&F0,&E0,&C0,&80
  110 VDU23,232,&FF,&FF,&FF,&FF,&F0,&F0,&F0,&F0
  120 VDU23,233,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF
  130 VDU23,234,&FF,&FF,&FF,&FF,&0F,&0F,&0F,&0F
  140 VDU23,235,&F0,&F0,&F0,&F0,&FF,&FF,&FF,&FF
  150 VDU23,236,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0
  160 VDU23,237,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
  170 VDU23,238,0,0,0,0,0,0,0,&FF
  180 PRINT
  190 PRINT TAB(10);"F O X & H O U N D S"
  200 PRINT:PRINT:PRINT"How many hounds:";
  210 INPUT"2-4, type 1 for random",Q
  220 IF Q<1 OR Q>4 THEN 210
  230 IF Q=1 THEN Q=RND(2)+2
  240 Q=Q*2-1
  250 A$=STRING$(3,CHR$(224))
  260 B$="   "
  270 DIM A(9,9),B(27)
  280 CLS:VDU23,1,0;0;0;0;
  290 PRINT
  300 FOR A=1 TO 4
  310   FOR B=1 TO 3
  320     PRINT CHR$(225);A$;B$;A$;B$;A$;B$;A$;B$;CHR$(226)
  330   NEXT B
  340   FOR B=1 TO 3
  350     PRINT CHR$(225);B$;A$;B$;A$;B$;A$;B$;A$;CHR$(226)
  360   NEXT B
  370 NEXT A
  380 PRINT " ";STRING$(24,CHR$(227))
  390 PRINT TAB(1,0);STRING$(24,CHR$(238))
  400 FOR I=0 TO 7:PRINT TAB(I*3+2,26);I+1:NEXT I
  410 FOR I=0 TO 7:PRINT TAB(26,I*3+2);8-I;:NEXT I
  420 FOR A=1 TO 27: READ B(A):NEXT A
  430 PRINT TAB(30,1);"FOX AND"
  440 PRINT TAB(30,2);"HOUNDS"
  450 PRINT TAB(30,4);"YOUR MOVE"
  460 FOR A=1 TO 8:FOR B=1 TO 8:IF (A+B)/2=INT((A+B)/2) THEN A(A,B)=9
  470   NEXT B:NEXT A
  480 FOR A=1 TO Q STEP 2:A(8,A)=-1:NEXT
  490 A(1,4)=1
  500 X=1:Y=4:Z=1:GOSUB 950
  510 X=8
  520 FOR Y=1 TO Q STEP 2
  530   Z=10:GOSUB 950
  540 NEXT Y
  550 X=1 
  560 Y=1
  570 IF A(X,Y)=1 THEN 600
  580 IF Y<>8 THEN Y=Y+1:GOTO 570
  590 IF X<>8 THEN X=X+1:GOTO 560
  600 C=(RND(2)-1)*2-1
  610 D=-C
  620 E=X+1:F=Y+C:GOSUB 760
  630 IF G=1 THEN 660
  640 IF (A(X,F+C)=-1 OR F+C<1 OR F+C>8) AND (A(E+1,F+C)=-1 OR F+C<1 OR F+C>8) AND X<7 THEN 1060
  650 IF A(E,F)=0 THEN 790
  660 E=X+1:F=Y+D:GOSUB 760:IF G=1 THEN 690
  670 IF (A(X,F+D)=-1 OR F+D<1 OR F+D>8) AND (A(E+1,F+D)=-1 OR F+D<1 OR F+D>8) THEN GOTO 1040
  680 IF A(E,F)=0 THEN 790
  690 E=X-1:F=Y+C:GOSUB 760:IF G=1 THEN 710
  700 IF A(E,F)=0 THEN 790
  710 E=X-1:F=Y+D:GOSUB 760:IF G=1 THEN 730
  720 IF A(E,F)=0 THEN 790
  730 IF A(X+1,Y+D)=0 AND X<8 AND Y+D>0 AND Y+D<9 THEN E=X+1:F=Y+D:GOTO 790
  740 IF A(X+1,Y+C)=0 AND X<8 AND Y+C>0 AND Y+C<9 THEN E=X+1:F=Y+C:GOTO 790
  750 VDU7:PRINTTAB(30,10)"YOU WIN!!";:GOTO 1000
  760 G=1
  770 IF E>0 AND E<9 AND F>0 AND F<9 THEN G=0
  780 RETURN
  790 A(E,F)=1:A(X,Y)=0:Z=19:GOSUB 950
  800 X=E:Y=F:Z=1:GOSUB 950
  810 IF A(8,1)=1 OR A(8,3)=1 OR A(8,5)=1 OR A(8,7)=1 THEN 1080
  820 VDU28,30,8,39,7,23,1,1;0;0;0;:INPUT'">"X$:VDU26,23,1,0;0;0;0;
  830 IF X$="STOP" THEN CLS:RUN
  840 IF LEN(X$)<>4 THEN 820
  850 A=VAL(LEFT$(X$,1)):B=9-VAL(MID$(X$,2,1))
  860 C=VAL(MID$(X$,3,1)):D=9-VAL(RIGHT$(X$,1))
  870 IF A<1 OR A>8 OR B<1 OR B>8 OR C<1 OR C>8 OR D<1 OR D>8 THEN SOUND 2,-15,150,1:GOTO 820
  880 IF A(B,A)<>-1 OR A(D,C)<>0 OR B-D<>1 OR ABS(A-C)<>1 THEN SOUND 2,-15,150,1:GOTO 820
  890 A(B,A)=0:A(D,C)=-1:X=B:Y=A:Z=19:GOSUB 950
  900 X=D:Y=C:Z=10:GOSUB 950:GOTO 550
  910 REM** WIN MESSAGE
  920 FOR R=1TO600:NEXT:PRINTTAB(30,10)"I WIN";:GOTO1000
  930 DATA 230,32,229,232,233,234,228,233,231,226,32,235,233,233,236,236,237,32
  940 DATA 32,32,32,32,32,32,32,32,32
  950 X1=(Y-1)*3+1:Y1=(X-1)*3+1
  960 PRINT TAB(X1,Y1);CHR$(B(Z));CHR$(B(Z+1));CHR$(B(Z+2))
  970 PRINT TAB(X1,Y1+1);CHR$(B(Z+3));CHR$(B(Z+4));CHR$(B(Z+5))
  980 PRINT TAB(X1,Y1+2);CHR$(B(Z+6));CHR$(B(Z+7));CHR$(B(Z+8))
  990 RETURN
 1000 PRINTTAB(30,12)"PRESS ANY"TAB(30,13)"KEY TO"TAB(30,14)"RESTART";
 1005 REM
 1010 A$=GET$
 1030 RUN
 1040 IF A(E+1,F+C)=-1 AND X<7 THEN 690
 1050 GOTO680
 1060 IF A(E+1,F+D)=-1 THEN 660
 1070 GOTO650
 1080 FORI=1TO600:NEXT
 1090 VDU7:PRINTTAB(30,10)"I WIN !!!";:GOTO1000
 2000 CLS: PRINT
 2090 PRINTTAB(30);"F O X & H O U N D S"
 2100 PRINT
 2110 PRINT" Fox and Hounds is a game of strategy played on a chess board grid. The sole     object of the game is to trap the fox which is automatically operated by the    computer, with the pieces you control, the hounds."
 2115 PRINT
 2120 PRINT" The fox starts from the top of the board and the hounds at the bottom.  If the  fox reaches the bottom row of the board before being trapped, it has  'won'."
 2125 PRINT
 2130 PRINT" The fox can move both forwards and backwards, like a bishop in chess, the       hounds may move only forwards. All the pieces on the board move diagonally      by one square at a time."
 2140 PRINT 
 2150 PRINT" Tally Ho!"
 2160 PRINT" You can win by surrounding the fox with the hounds so that it cannot move or    you can trap it into a corner or against the side of the board."
 2165 PRINT
 2170 PRINT" The computer is fairly ruthless - it will not let the fox step into any         traps it can spot."
 2180 PRINT:PRINT
 2190 PRINT"                            PRESS ANY KEY TO CONTINUE" 
 2200 REM
 2210 A$=GET$
 2220 CLS
 2230 PRINT
 2240 PRINT TAB(30);"F O X & H O U N D S"
 2250 PRINT
 2260 PRINT" After the board has been constructed on the screen you must wait for the        cursor to appear in the top right-hand corner. At this point the program is     waiting for you to input a set of ";
 2270 PRINT"coordinates which relate to the piece you     wish to move. This input is expected to be a four character code with the       first two characters being the current  square reference and the second two"
 2280 PRINT" being the destination square reference. The input is terminated by pressing     RETURN and the computer will then move  your hound to the selected square."
 2285 PRINT
 2290 PRINT" The computer checks all entered moves for validity and if the move requested    is illegal, the input string is deleted and you must try again."
 2295 PRINT
 2300 PRINT" All the moves are indexed from the bottom left-hand corner, this being 1,1. ":PRINT" The co-ordinates are taken along and then up, that is you quote the column      number first, followed by the";
 2310 PRINT" row number to select a square." : PRINT
 2320 PRINT" The game may be terminated at any point by typing 'STOP'."
 2330 PRINT
 2340 PRINT"                         PRESS ANY KEY TO PLAY THE GAME"
 2350 REM
 2360 A$=GET$
 2370 CLS
 2380 RETURN

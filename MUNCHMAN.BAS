   10 REM MUNCH (Munch-Man Header)
   15 REM SAVE AS "MUNCH"
   20 REM Version 1Ab  11th August
   30 REM by Andrew Hynes
   31 GOSUB500:REM
   50 VDU23,224,102,102,102,102,102,102,102,102
   60 VDU23,225,0,255,255,0,0,255,255,0
   70 VDU23,226,0,127,127,96,96,103,103,102
   80 VDU23,227,0,254,254,6,6,230,230,102
   90 VDU23,245,0,0,0,255,255,0,0,0
  100 VDU23,246,60,126,255,255,255,255,126,60
  110 VDU23,228,102,103,103,96,96,127,127,0
  120 VDU23,229,102,230,230,6,6,254,254,0
  130 VDU23,230,102,102,102,102,102,126,126,0
  140 VDU23,231,0,126,126,102,102,102,102,102
  150 VDU23,232,0,254,254,6,6,254,254,0
  160 VDU23,233,0,127,127,96,96,127,127,0
  170 VDU23,234,102,230,230,6,6,230,230,102
  180 VDU23,235,102,231,231,0,0,255,255,0
  190 VDU23,236,102,103,103,96,96,103,103,102
  200 VDU23,237,60,126,255,224,224,255,126,60
  210 VDU23,238,60,126,255,7,7,255,126,60
  220 VDU23,239,36,102,231,231,231,255,126,60
  230 VDU23,240,60,126,255,231,231,231,102,36
  240 VDU23,241,0,0,42,0,34,0,42,0
  250 VDU23,242,8,73,42,0,99,0,42,73
  260 VDU23,243,126,90,219,255,213,171,255,219
  270 VDU23,244,198,56,108,222,190,222,108,56
  290 CLEAR:CHAIN "MUNCH2.BAS"
  300 REM
  500 REM
  510 PROCprint_titles("MUNCHMAN","Andrew Hynes")
  520 PRINT"  Press 'space' bar to continue";
  530 REM
  540 REPEATUNTILGET=32
  550 MODE7:VDU23;8202;0;0;0;
  560 PRINTCHR$130;TAB(15);CHR$141;"Munchman"
  570 PRINTCHR$130;TAB(15);CHR$141;"Munchman"'
  580 PRINT"†  You take the part of a little yellow †'mouth' scurrying around a maze eating †dots to score points. There are three  †ghosts that chase you and try to kill  †you. These ghosts move through walls,  †thus making it harder for you."
  590 PRINT"†To combat these ghosts you can get a   †power pill, situated in the 4 corners  †of the maze, and these cause the ghosts†to turn blue and run away. While the   †ghosts are blue you can eat them to    †gain massive bonus points."
  600 PRINT"†  Once you have cleared a sheet, the   †dots are replaced and you carry on,    †until you lose three lives."
  610 PRINT"†  The best strategy for this game is to†make use of the power pills, and the   †tunnels - because the ghosts do not    †chase you through tunnels."
  620 PRINTTAB(7,23)CHR$130"Press any key to continue";
  630 REM
  640 G=GET:VDU26,12 
  650 RETURN
  670 DEFPROCprint_titles(prog$,author$)
  680 LOCALbeeb$,row,let
  690 VDU22,7;23;8202;0;0;0;
  700 beeb$="ƒBEEBUG"+STRING$(4,"  BEEBUG")
  710 VDU26:CLS:row=0:let=0
  720 REPEAT:let=let+1
  730   PRINTCHR$(let+129);MID$("BEEBUG",let,1);
  740   PRINTTAB(38);MID$("GBEEBU",let,1)
  750   let=let MOD6:row=row+1
  760 UNTILrow=24
  770 PRINTbeeb$;
  780 VDU26:PRINTbeeb$
  790 FORrow=2TO8
  800   PRINTTAB(19-LEN(prog$)DIV2,row);prog$
  810 NEXTrow
  820 PRINTTAB(12,11);"PROGRAM AUTHOR"
  830 PRINTTAB(19-LEN(author$)DIV2,13);author$
  840 PRINTTAB(3,19);
  850 ENDPROC

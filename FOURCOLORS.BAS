    1 REM **************************
    2 REM *  Listing courtesy of   *
    3 REM *  Microage Electronics  *
    4 REM **************************
    5 MODE7:REM VDU23;8202;0;0;0;
    6 REM
    7 REM
   10 CLS:Y=0:GOTO90
   20 DEFPROCCOLOUR
   30 FORW=0TO5:FORZ=0TO3
   40     PRINTTAB(0,Z*6+W);CHR$(134-Z-Y);CHR$157
   50   NEXTZ
   60   FORV=1TO200:NEXTV:NEXTW
   70 Y=Y+1:IF Y=3 THENY=0
   80 ENDPROC
   90 PROCCOLOUR
  100 PRINTTAB(13,8);CHR$151;CHR$141;"F O U R";TAB(13,9);CHR$151;CHR$141;"F O U R"
  110 PRINTTAB(10,14);CHR$151;CHR$141;"C O L O U R S";TAB(10,15);CHR$151;CHR$141;"C O L O U R S"
  120 FORU=1TO3000:NEXT
  130 PROCCOLOUR
  140 PRINTTAB(13,8);SPC(7);TAB(13,9);SPC(7);TAB(10,14);SPC(13);TAB(10,15);SPC(13)
  150 PRINTTAB(7,9);CHR$135;"Do you want instructions?"
  160 PRINTTAB(4,14);CHR$132;"Type 'Y' for YES or 'N' for NO"
  165 REM
  170 Q$=GET$
  180 IFQ$="Y"THEN210
  190 IFQ$="N"THEN720
  200 GOTO170
  210 CLS
  220 PRINTTAB(2,3);"The computer selects four colours";TAB(2,5);"from these six:-"
  230 PRINTTAB(12,7);CHR$129;"Red";TAB(22,7)CHR$145;CHR$255
  240 PRINTTAB(12,9);CHR$130;"Green";TAB(22,9)CHR$146;CHR$255
  250 PRINTTAB(12,11);CHR$131;"Yellow";TAB(22,11)CHR$147;CHR$255
  260 PRINTTAB(12,13);CHR$132;"Blue";TAB(22,13)CHR$148;CHR$255
  270 PRINTTAB(12,15);CHR$133;"Magenta";TAB(22,15)CHR$149;CHR$255
  280 PRINTTAB(12,17);CHR$134;"Cyan";TAB(22,17)CHR$150;CHR$255
  290 PRINTTAB(1,19);"It holds them hidden in four positions"
  300 PRINTTAB(6,24);"Press any key for the next page";
  310 R$=GET$
  320 PROCCOLOUR
  330 PRINTTAB(2,3);SPC(33)
  340 PRINTTAB(2,5);CHR$135;"You have to guess which colours and"
  350 PRINTTAB(2,7);CHR$132;"in which order they are held."
  360 PRINTTAB(2,9);CHR$132;"You can make up to eight attempts."
  370 PRINTTAB(2,11);CHR$132;"Each attempt is marked to show how"
  380 PRINTTAB(2,13);CHR$135;"many are of the correct colour and"
  390 PRINTTAB(2,15);CHR$135;"how many are also in the correct"
  400 PRINTTAB(2,17);CHR$135;"position.";SPC(12)
  410 PRINTTAB(2,19);SPC(38)
  420 S$=GET$
  430 CLS
  440 PRINTTAB(2,1);"To choose your colours press the"
  450 PRINTTAB(2,3);"number keys 1 to 6. They will print"
  460 PRINTTAB(2,5);"coloured blocks as shown below:_"
  470 PRINTTAB(5,7);CHR$129;"Key 1  Red";TAB(21,7);CHR$145;CHR$255
  480 PRINTTAB(5,9);CHR$130;"Key 2  Green";TAB(21,9);CHR$146;CHR$255
  490 PRINTTAB(5,11);CHR$131;"Key 3  Yellow";TAB(21,11);CHR$147;CHR$255
  500 PRINTTAB(5,13);CHR$132;"Key 4  Blue";TAB(21,13);CHR$148;CHR$255
  510 PRINTTAB(5,15);CHR$133;"Key 5  Magenta";TAB(21,15);CHR$149;CHR$255
  520 PRINTTAB(5,17);CHR$134;"Key 6  Cyan";TAB(21,17);CHR$150;CHR$255
  530 PRINTTAB(2,19);"The above code will be repeated at"
  540 PRINTTAB(2,21);"the foot of the playing page."
  550 PRINTTAB(6,24);"Press any key for the next page";
  560 T$=GET$
  570 PROCCOLOUR
  580 PRINTTAB(2,1);SPC(32)
  590 PRINTTAB(2,3);CHR$132;"The computer's choice will be      ";
  600 PRINTTAB(2,5);CHR$132;"revealed at the end of each game."
  610 PRINTTAB(2,7);CHR$135;"Don't forget you have only eight"
  620 PRINTTAB(2,9);CHR$135;"attempts.";SPC(12)
  630 PRINTTAB(2,11);CHR$135;"If you would like to read the"
  640 PRINTTAB(2,13);CHR$135;"instructions again press 'Y'."
  650 PRINTTAB(2,15);CHR$135;"Otherwise press 'N' and the game"
  660 PRINTTAB(2,17);CHR$135;"will start.";SPC(10)
  670 PRINTTAB(2,19);SPC(34);TAB(2,21);SPC(33);TAB(2,23);SPC(20);TAB(6,24);SPC(31);
  675 REM
  680 U$=GET$
  690 IFU$="Y"THEN Y=2:GOTO210
  700 IFU$="N"THEN720
  710 GOTO680
  720 CLS:PRINT
  725 REM
  730 PRINT"  Attempt    Colours    No. correct in-"
  740 PRINTTAB(4);"No.";TAB(13);"Chosen";TAB(24);"colour position";
  750 PRINTTAB(7,19);"Press the number keys for"
  760 PRINTTAB(7);"the colours you choose as"
  770 PRINTTAB(7);"shown below:-"
  780 PRINTTAB(6);CHR$129;"1 RED";CHR$130;"  2 GREEN";CHR$131;"  3 YELLOW"
  790 PRINTTAB(6);CHR$132;"4 BLUE";CHR$133;" 5 MAGENTA";CHR$134;"6 CYAN"
  800 A=RND(6):B=RND(6):C=RND(6):D=RND(6)
  810 FORF=1TO8:F%=F
  820   G=0:H=0:I=A:J=B:K=C:L=D
  830   FORM=1TO4
  840     IFM=1 THEN PRINTTAB(4,1+F*2);F;
  845     REM
  850     N$=GET$:N=VAL(N$)
  860     IFN=0 OR N>6 THEN1250
  870     PRINTTAB(10+2*M,1+F*2);CHR$(128+N);CHR$255;
  880     IFN=A AND M=1 THEN H=H+1:GOTO920
  890     IFN=B AND M=2 THEN H=H+1:GOTO920
  900     IFN=C AND M=3 THEN H=H+1:GOTO920
  910     IFN=D AND M=4 THEN H=H+1
  920     IFN=I THEN G=G+1:I=0:GOTO960
  930     IFN=J THEN G=G+1:J=0:GOTO960
  940     IFN=K THEN G=G+1:K=0:GOTO960
  950     IFN=L THEN G=G+1:L=0
  960   NEXTM
  970   PRINTTAB(26,1+F*2);CHR$135;G;TAB(35,1+F*2);H
  980   IFH=4 THEN F=8:NEXT:GOTO1010
  990 IFF=8 THEN NEXT:GOTO1110
 1000 NEXTF
 1010 FORO=0TO4
 1020   PRINTTAB(7,19+O);SPC(25):NEXTO
 1030 ON F% GOTO 1040,1050,1060,1060,1070,1070,1080,1080
 1040 PRINTTAB(13,19);"Dead lucky!!":GOTO1150
 1050 PRINTTAB(6,19);"Lucky! ";:GOTO1090
 1060 PRINTTAB(3,19);"Excellent. ";:GOTO1090
 1070 PRINTTAB(3,19);"Very good. ";:GOTO1090
 1080 PRINTTAB(7,19);"Good. ";
 1090 PRINT"Success at attempt No. ";F%
 1100 GOTO1150
 1110 FORO=0TO4
 1120   PRINTTAB(7,19+O);SPC(26):NEXT O
 1130 PRINTTAB(0,19);"Hard luck. no success after 8 attempts."
 1140 GOTO1150
 1150 PRINTTAB(12,20)CHR$(128+A);CHR$255;CHR$(128+B);CHR$255;CHR$(128+C);CHR$255;CHR$(128+D);CHR$255
 1160 PRINTTAB(2);"The computer's choice is shown above."
 1170 FORU=1TO3000:NEXT
 1180 PRINT"Do you want to play again? Type Y or N"
 1185 REM
 1190 P$=GET$
 1200 IFP$="Y"THEN720
 1210 IFP$="N"THEN1230
 1220 GOTO1190
 1230 PRINT:PRINTTAB(10);"Thankyou.   Goodbye         ";
 1240 GOTO1240
 1250 PRINTTAB(9,VPOS+1);CHR$136;"Wrong key try again"
 1260 FORT=1TO5000:NEXT
 1270 PRINTTAB(9,VPOS-1);SPC(21):PRINTTAB(9,VPOS-3)
 1275 REM
 1280 GOTO850

    1 SIZE=400
    2 RESY=500
    3 RESX=600
    5 CLS
    6 MODE 3
   10 GOSUB 500
   15 X2=RESX : Y2=RESY
   20 FOR THETA = 0 TO 360
   30   K=THETA *D * PI / 180
   40   R=SIZE*SIN(N*K)
   50   X=R * COS(K)
   60   Y=R * SIN(K)
   70   X1=INT(X) : Y1=INT(Y)
   75   X1=X1+RESX
   76   Y1=Y1+RESY
   80   GOSUB 2000
   90 NEXT THETA
  100 FOR THETA = 0 TO 360
  110   K = THETA * PI / 180
  120   R=SIZE*SIN(N*K)
  130   X = R * COS(K)
  140   Y = R * SIN(K)
  145   X1=INT(X) : Y1=INT(Y)
  150   X1=X1+RESX
  160   Y1=Y1+RESY
  170   GOSUB 2000
  180 NEXT THETA
  200 END
  500 CLS
  510 PRINT "MAURER ROSE DEMO"
  520 PRINT "Converted from Python by Eightbitswide"
  530 PRINT "Original Code & Info: "
  540 PRINT "https://en.wikipedia.org/wiki/Maurer_rose" : PRINT
  550 PRINT "You will be asked for N and D values."
  560 PRINT "The rose has N petals.  D specifies step angles in degrees."
  570 PRINT : PRINT
  580 PRINT "Try these examples:"
  590 PRINT "N2/D39, N4/D31, N4/D97, N4/D103, N5/D97, N6/D71, N7/D29, N8/D29"
  600 PRINT : PRINT
  610 INPUT "Input value for N: (Example:2)  ->";N
  620 INPUT "Input value for D: (Example:39) ->";D
  630 CLS
  640 MODE 0
  700 RETURN
  999 END
 2000 REM PRINT LINES TO TERMINAL
 2030 MOVE X1,Y1
 2035 DRAW X2,Y2
 2065 REM CONVERT DEST CORDS TO ORIG CORDS
 2066 X2=X1 : Y2=Y1
 2070 RETURN

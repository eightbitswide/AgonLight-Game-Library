    1 HI=10:HI$="THE WIZARD"
    2 REM
    3 REM IFPAGE>&E00THEN32000
   10 MODE4:PROCopenscreen
   11 VDU4,28,0,31,39,26
   12 L=550:COM=0:CR=0:AM=0:NM=0:TD=0:MN=0:beer=0
   13 GD=0:F=RND(9):PROCstring:stay=1:vin=0:DV$="999"
   14 B$="":AMM=0:SC=0:GC=0:PASS=0
   15 ZIG=0:CR=0:SD=0:K=0:M=0:OT=0:ODOOR=0
   16 READSS:READTT
   17 IFSS=0THEN100:IFTT=0THEN100
   18 SOUND2,-15,SS,TT:SOUND3,-15,SS,TT
   19 DATA97,15,97,5,101,5,97,5,101,5,97,5,101,10,97,2,89,5,81,5,77,10,0,0
   20 VDU19,0,RND(4),0,0,0:GOTO16
  100 VDU19,0,0,0,0,0:PROCscreen
  101 RESTORE
  150 REM
  151 REM
  152 REM
  153 REM        CONTROL
  154 REM
  155 REM
  156 REM
  170 PROCplace
  171 PRINT"What now?"
  180 REM
  190 INPUTA$:FORT=0TO100STEP5:SOUND1,-15,T,1:NEXT
  191 IFA$="LOOK"THENNM=1:PROCplace
  192 IFA$="E"THENNM=1:PROCeast:PROCscreen:PROCplace
  193 IFA$="W"THENPROCwest:NM=1:PROCscreen:PROCplace
  194 IFA$="N"THENPROCnorth:NM=1:PROCscreen:PROCplace
  195 IFA$="S"THENPROCsouth:NM=1:PROCscreen:PROCplace
  196 IFA$="HELP"THENNM=1:PROChelp
  197 IFLEFT$(A$,4)="READ"THENNM=1:PROCread
  198 IFLEFT$(A$,4)="OPEN"THENNM=1:PROCopen
  199 IFLEFT$(A$,5)="ENTER"THENNM=1:PROCenter
  200 IFLEFT$(A$,3)="PUT"THENNM=1:PROCput
  201 IFLEFT$(A$,4)="WEAR"THENNM=1:PROCwear
  202 IFLEFT$(A$,3)="GET"THENNM=1:PROCget
  203 IFLEFT$(A$,11)="COMBINATION"THENNM=1:PROCcombination
  204 IFLEFT$(A$,7)="EXAMINE"THENNM=1:PRINT"I can only LOOK, but not LOOK AT."
  205 IFLEFT$(A$,6)="UNLOCK"THENPRINT"Try OPEN or COMBINATION.":NM=1
  207 IFA$="D"THEN NM=1:PROCdown
  208 IFA$="U" THEN NM=1:PROCup
  209 IFA$="QUIT"THENPROCquit
  210 IFA$="L"THENNM=1:PROCplace
  211 IFA$="NORTH"THENPRINT"Try N":NM=1
  212 IFA$="SOUTH"THENPRINT"Try S":NM=1
  213 IFA$="EAST"THENPRINT"Try E":NM=1
  214 IFA$="WEST"THENPRINT"Try W":NM=1
  215 IFA$="WAIT"THENPRINT"You wait...................!":NM=1
  216 IFLEFT$(A$,5)="CLIMB"THENPRINT"Try UP or ENTER":NM=1
  217 IFA$="VOCAB"THENPRINT"E,W,N,S,U,D,WAIT,WEAR,PUT...IN....,GET, HELP,COMBINATION,OPEN,LOOK,QUIT,DROP.":NM=1
  218 IFLEFT$(A$,4)="DROP"THENNM=1:PROCdrop
  219 IFA$="PAY GUARD"THENPROCpay:NM=1
  269 IFA$=""THENPRINT"I did not hear that!":NM=1
  401 IFNM=0THENPRINT"Say that again?"
  402 NM=0
  403 GOTO171
  500 DEFPROCput
  501 IFL=550ANDAMM=1 ANDA$="PUT BOX IN CUPBOARD" THEN PRINT"You've already done that!":FORT=100TO0STEP-4:SOUND1,-15,T,1:NEXT:FORT=0TO100STEP4:SOUND1,-15,T,1:NEXT:ENDPROC
  502 IFL=550ANDA$="PUT BOX IN CUPBOARD"THENSOUND1,-15,100,30:SOUND2,-15,110,30:SOUND3,-15,90,30:AMM=1:PRINT"With a loud bang, an amulet appears":SC=SC+5:ENDPROC
  504 PRINT'"What?!!":PRINT
  505 ENDPROC
  550 DEFPROCwear
  551 IFL=550ANDAMM=1ANDA$="WEAR AMULET"THENPRINT"You wear the amulet. Suddenly you shrinkto a foot tall.":AMM=2:FORG=1TO2000:NEXT:FORT=100TO0STEP-4:SOUND1,-15,T,1:SOUND2,-15,T,1:SOUND3,-15,T,1:NEXT:SC=SC+10:ENDPROC
  552 IFL=550ANDAMM=2ANDA$="WEAR AMULET"THENPRINT"You're already wearing it.":ENDPROC
  553 IFL=550ANDAMM=0ANDA$="WEAR AMULET"THENPRINT"Tut, tut. Trying to cheat!":ENDPROC
  554 IFA$="WEAR CROWN"AND GC=1THENPRINT"You wear the crown.":GC=2:ENDPROC
  555 IFA$="WEAR CROWN"AND GC=0 AND L=1000THENPRINT"You do not have it!":ENDPROC
  556 IFA$="WEAR CROWN"AND GC=0 AND L<1000THENPRINT"It's not here!":ENDPROC
  557 IFA$="WEAR CROWN"AND GC=2 THEN PRINT"You're already wearing it.":ENDPROC
  590 ENDPROC
  600 DEFPROCplace
  601 IFL=752ANDGD=1THENPROCblowup
  602 IFL=148THENPRINT"As you enter, the door slams shut!":PRINT"I see a shaft which leads down. I hear  laughing down the shaft. Exit: Down"
  610 IFL=550THENPRINT"I'm in a room with a sign"'"I see a small hole, a scroll, a box and a cupboard. Exit: East"
  611 IFL=650THENPRINT"I'm in a room with a coffin"'"I see a sign on the coffin"'"A doorway leads east"'"Exits: East, West"
  612 IFL=750ANDZIG=0THENPRINT"I'm in a room with a safe"'"The safe has a combination lock"'"A doorway leads North"'"Exits: West, North"
  613 IFL=751THENPRINT"I'm in a room with a trap door and a"'"sign. The trap door and a sign. The trapdoor is locked"'"I can hear laughter to the north"'"A doorway leads North"'"Exits: South, North"
  614 IFL=752THENPRINT"Oh dead, it's the Mad Doctor"'"Keep him happy or he'll blow you up"'"He's going to ask you a question"''"Press a key":GH=GET
  615 IFL=752THENPRINT"What would you drink? Chloroacetic acid or citric acid (CI/CH) ?"
  616 IFL=752ANDGD=0THENINPUTB$
  617 IFB$="CI"THENPRINT"Correct. The Doc gives you some gold":GD=1:B$="":PROCsmile:ENDPROC
  618 IFB$="CH"THENPRINT"Oh dear. That's wrong. The doctor's justblown you up!"''"You seem to be dead"''"Press a key";:CV=GET:B$="":RESTORE:PROCquit
  619 IFL=551THENPRINT"I see a door with a sign over it"'"I also see a scroll"'"The door leads north"'"A hole behind me leads south"
  620 IFL=750ANDCR=0ANDZIG>0THENPRINT"I am looking inside the safe"'"I see a cross":SC=SC+3
  621 IFL=750ANDCR=1THENPRINT"I am looking inside the safe"'"I see nothing"
  622 IFL=552THENPRINT"I'm in an empty room"'"I see a sign on the wall"'"Exits: South"
  623 IFL=150THENPRINT"I'm in the middle of a passage which"'"runs north to south"'"I see a sign"'"Exits: North, South":SC=SC+5
  624 IFL=900THENPRINT"I'm in a pub"'"There is a group of elves drinking"'"They say 'Your round or ours?'":SC=SC+2:PROCelves
  625 IFL=1000THENPRINT"I'm in the Goblins' Throne Room"'"I see no-one here"'"I see a gold crown"'"I see a Goblin Sentry to the east"''"Exits: East, West":SC=SC+2
  626 IFL=1100ANDGC=2AND PASS=1THENPRINT"I'm in a room with a fireplace."'"Exits: West"
  627 IFL=1100ANDGC=2AND PASS=0THENPRINT"The Sentry bows and lets you pass."'"I am in a room with a fireplace"''"Exits: West":PASS=1
  628 IFL=50THENPRINT"I'm in a chimney"'"A sign points up"''"Exits: South"
  629 IFL=30THENPRINT"I'm in the Elven King's Great Hall. A   guard approaches me. He says 'Pay to"'"pass to the next room!'"
  797 IFL=151ANDstay>1THENPROCgoblin
  798 IFL=151THENPRINT"I'm at the gates of the Goblins' Palace.Guarding the gates is an ugle goblin."'"The gates are to the north of me."'"I see a window"
  799 IFL=149THENPRINT"I'm at the south end of the passage"'"I see a door. It has a combination lock."'"Exits: North"
  800 ENDPROC
  900 DEFPROCeast
  901 L=L+100:PROCgobcheck:IFL=650ANDK=1THENMN=1:PROCcoffin
  902 ENDPROC
  903 DEFPROCwest
  904 L=L-100:IFL=650ANDK=1THENMN=1:PROCcoffin
  905 ENDPROC
  906 DEFPROCnorth
  907 L=L+1
  909 ENDPROC
  910 DEFPROCscreen
  911 IFL=650ANDCR=1ANDK=1THENPROCcoffin
  912 IFL=149THEN1083
  913 IFL=151THEN1090
  914 IFL=152ANDvin=0THENPROCgoblin
  915 IFL=148THEN1095
  916 IFL=900THEN1100
  917 IFL=1000THEN1110
  918 IFL=1100THEN1120
  919 IFL=50THEN1131
  920 IFL=30ANDGC=2THENPRINT"An elven guard attacks you with his""Goblin Slayer."'"Splat!"'"You're dead.":PRINT"Press a key":CB=GET:PROCquit
  921 IFL=30ANDGC<2THEN1140
 1001 IFL=650THEN1040
 1002 IFL=550THEN1010
 1003 IFL=750THEN1046
 1004 IFL=751THEN1051
 1005 IFL=752THEN1057
 1006 IFL=551THEN1070
 1007 IFL=552THEN1075
 1008 IFL=150THEN1078
 1009 PRINT"You can't go that way!":PROCno:ENDPROC
 1010 CLG:MOVE0,200:DRAW400,400:DRAW1280,400:MOVE900,400:DRAW900,900:DRAW1100,900:DRAW1100,400
 1011 MOVE0,200:DRAW1280,200
 1015 MOVE900,600:DRAW1100,600:MOVE1000,600:DRAW1000,400
 1018 MOVE1000,600:DRAW1000,900
 1019 MOVE920,620:DRAW920,880:DRAW980,880:DRAW980,620:DRAW920,620
 1020 MOVE1020,620:DRAW1020,880:DRAW1080,880:DRAW1080,620:DRAW1020,620
 1030 MOVE920,420:DRAW920,580:DRAW980,580:DRAW980,420:DRAW920,420
 1032 MOVE1020,420:DRAW1020,580:DRAW1080,580:DRAW1080,420:DRAW1020,420
 1033 MOVE0,1022:DRAW1280,1022
 1034 MOVE550,550:DRAW800,550:DRAW800,900:DRAW550,900:DRAW550,550
 1035 MOVE410,400:DRAW420,450:DRAW450,460:DRAW470,400:MOVE400,400:DRAW400,1024:MOVE0,200:DRAW0,1024
 1036 MOVE0,1020:DRAW1278,1020:DRAW1278,200
 1037 ENDPROC
 1040 REM***** SCREEN 650 *******
 1041 CLG:MOVE0,200:DRAW400,400:DRAW400,1022:DRAW0,1022:DRAW1278,1022:DRAW1278,200:DRAW0,200:DRAW0,1024
 1042 MOVE600,300:DRAW500,700:DRAW600,900:DRAW800,900:DRAW900,700:DRAW800,300:DRAW600,300
 1043 MOVE400,400:DRAW570,400:MOVE830,400:DRAW1280,400:MOVE1100,400:DRAW1100,900:DRAW1280,900:MOVE1100,400:DRAW1280,450
 1044 MOVE650,700:DRAW750,700:DRAW750,800:DRAW650,800:DRAW650,700
 1045 ENDPROC
 1046 REM***** SCREEN 750 *******
 1047 CLG:MOVE0,200:DRAW1280,200:DRAW900,400:DRAW0,400:MOVE0,200:DRAW0,1022:DRAW1278,1022:DRAW1278,200
 1048 MOVE900,400:DRAW900,1024:MOVE600,600:DRAW600,700:DRAW700,700:DRAW700,600:DRAW600,600
 1049 MOVE615,615:DRAW615,685:DRAW685,685:DRAW685,615:DRAW615,615
 1050 MOVE200,400:DRAW200,900:DRAW0,900:MOVE200,400:DRAW0,450:ENDPROC
 1051 REM***** SCREEN 751 *********
 1052 CLG:MOVE0,200:DRAW400,400:DRAW400,1022:MOVE0,1022:DRAW1278,1022:DRAW1278,200:DRAW0,200:MOVE400,400:DRAW400,1024:MOVE400,400:DRAW1280,400
 1053 MOVE0,200:DRAW0,1024:MOVE600,250:DRAW700,350:DRAW900,350:DRAW800,250:DRAW600,250
 1054 MOVE650,250:DRAW750,350:MOVE700,250:DRAW800,350:MOVE750,250:DRAW850,350
 1055 MOVE1100,400:DRAW1100,900:DRAW1280,900:MOVE1100,400:DRAW1280,450:MOVE600,600:DRAW600,700:DRAW700,700:DRAW700,600:DRAW600,600
 1056 ENDPROC
 1057 REM***** TONY NEIL *******
 1058 CLG:MOVE0,200:DRAW1278,200:DRAW1278,1022:DRAW0,1022:DRAW0,200
 1059 MOVE500,220:DRAW800,220:DRAW900,400:DRAW900,800:MOVE500,220:DRAW400,400:DRAW400,800:DRAW450,850
 1060 DRAW500,900:DRAW800,900:DRAW900,800:MOVE500,850:DRAW800,850:MOVE600,750:DRAW700,750
 1061 MOVE550,800:DRAW750,800:MOVE500,700:DRAW600,700:DRAW600,650:DRAW500,650:DRAW500,700
 1062 MOVE500,675:DRAW400,700:PLOT69,570,665:PLOT69,575,665:PLOT69,578,665
 1063 MOVE600,675:DRAW650,700:DRAW700,675:MOVE700,650:DRAW700,700:DRAW800,700:DRAW800,650:DRAW700,650
 1064 PLOT69,722,665:PLOT69,725,665:PLOT69,729,665:MOVE800,675:DRAW900,700
 1065 MOVE600,640:DRAW600,500:DRAW650,470:DRAW700,500:DRAW700,640
 1066 MOVE500,450:DRAW550,400:DRAW750,400:DRAW797,450
 1067 MOVE650,900:DRAW650,940:DRAW675,990:MOVE630,900:DRAW630,950:DRAW600,970:MOVE670,900:DRAW700,950
 1068 ENDPROC
 1070 IFA$="N"THENPRINT"THATS A HOLE!!":L=L-1:ENDPROC
 1071 CLG:MOVE0,200:DRAW1280,200:DRAW900,400:DRAW900,1024:MOVE1280,1022:DRAW0,1022:DRAW0,200
 1072 MOVE0,400:DRAW900,400:MOVE1278,200:DRAW1278,1024
 1073 MOVE600,400:DRAW600,800:DRAW800,800:DRAW800,400:MOVE600,900:DRAW800,900:DRAW800,850:DRAW600,850:DRAW600,900
 1074 ENDPROC
 1075 CLG:MOVE0,200:DRAW1278,200:DRAW1278,1022:DRAW0,1022:DRAW0,200:DRAW400,400:DRAW900,400:DRAW1280,200:MOVE900,400:DRAW900,800
 1076 DRAW400,800:DRAW400,400:MOVE400,800:DRAW0,1024:MOVE900,800:DRAW1280,1024:MOVE600,500:DRAW600,600:DRAW700,600:DRAW700,500:DRAW600,500
 1077 ENDPROC
 1078 REM******** SCREEN 150 *****
 1079 CLG:MOVE600,300:DRAW600,800:DRAW650,800:DRAW650,300:DRAW600,300:MOVE600,700:DRAW420,700:DRAW400,725:DRAW420,750:DRAW600,750
 1080 MOVE650,600:DRAW805,600:DRAW830,625:DRAW805,650:DRAW650,650
 1081 MOVE0,200:DRAW0,1022:DRAW1278,1022:DRAW1278,200:DRAW0,200:MOVE0,400:DRAW600,400:MOVE650,400
 1082 ENDPROC
 1083 REM****** SCREEN 154 ********
 1084 MOVE0,200:CLG:DRAW400,400:DRAW400,800:DRAW800,800:DRAW800,400:DRAW1280,200
 1085 MOVE0,200:DRAW0,1022:DRAW400,800:MOVE800,800:DRAW1278,1022:DRAW0,1022:MOVE0,200:DRAW1280,200
 1086 MOVE400,400:DRAW800,400:MOVE500,400:DRAW500,800:MOVE600,400:DRAW600,800:MOVE700,400:DRAW700,800
 1087 MOVE1278,200:DRAW1278,1024
 1088 ENDPROC
 1090 REM******** SCREEN 151 ******:
 1091 CLG:MOVE0,200:DRAW400,400:DRAW400,800:DRAW800,800:DRAW800,400:DRAW400,400:MOVE0,200:DRAW0,1022:DRAW1278,1022:DRAW800,800
 1092 MOVE1278,1022:DRAW1278,200:DRAW0,200:MOVE0,1022:DRAW400,800:MOVE1278,200:DRAW800,400
 1093 MOVE400,700:DRAW600,800:DRAW800,700:MOVE600,800:DRAW600,400:stay=1
 1094 ENDPROC
 1095 CLG:MOVE0,200:DRAW0,1022:DRAW1278,1022:DRAW1278,200:DRAW0,200:DRAW400,400:DRAW900,400:DRAW1280,200:MOVE900,400:DRAW900,800:DRAW1280,1022
 1096 MOVE400,800:DRAW0,1022:MOVE400,800:DRAW400,400
 1097 MOVE400,250:DRAW600,350:DRAW800,350:DRAW1000,250:DRAW400,250:MOVE800,350:DRAW800,250:MOVE600,350:DRAW600,250
 1098 MOVE400,800:DRAW900,800
 1099 ENDPROC
 1100 CLG:MOVE300,300:DRAW300,325:DRAW900,325:DRAW900,300:DRAW300,300
 1101 MOVE325,325:DRAW325,600:DRAW875,600:DRAW875,325
 1102 MOVE350,600:DRAW350,650:DRAW400,650:DRAW400,600:MOVE360,650:DRAW360,800:DRAW390,800:DRAW390,650
 1103 MOVE450,600:DRAW450,650:DRAW500,650:DRAW500,600:MOVE460,650:DRAW460,860:DRAW490,800:DRAW490,650:MOVE600,600:DRAW600,650:DRAW650,650:DRAW650,600:MOVE600,630:DRAW650,630:PLOT85,600,600
 1104 PLOT85,600,630:PLOT85,650,600
 1105 PLOT85,650,630
 1106 MOVE0,200:DRAW0,1022:DRAW1278,1022:DRAW1278,200:DRAW0,200
 1107 DRAW300,360:MOVE600,600:DRAW600,1022
 1108 MOVE900,300:DRAW1280,300
 1109 ENDPROC
 1110 CLG:MOVE0,200:DRAW0,1022:DRAW1278,1022:DRAW1278,200:DRAW0,200:DRAW400,400:DRAW900,400:DRAW1280,200:MOVE900,400:DRAW900,1022:MOVE400,400:DRAW400,1022
 1111 MOVE450,400:DRAW450,450:DRAW850,450:DRAW850,400
 1112 MOVE500,450:DRAW500,900:DRAW525,900:DRAW525,450
 1113 MOVE750,450:DRAW750,900:DRAW775,900:DRAW775,450
 1114 MOVE525,800:DRAW632,900:DRAW750,800
 1115 MOVE525,550:DRAW750,550:MOVE525,575:DRAW750,575
 1116 ENDPROC
 1120 CLG:MOVE0,200:DRAW200,400:DRAW200,1022:DRAW0,1022:DRAW0,200
 1121 MOVE200,1022:DRAW1278,1022:DRAW1278,200:DRAW0,200:MOVE1278,200:DRAW1078,400:DRAW1078,1022
 1122 MOVE1078,400:DRAW200,400:MOVE300,400:DRAW300,500:DRAW400,500:DRAW400,400
 1123 MOVE310,500:DRAW310,800:DRAW390,800:DRAW390,500
 1124 MOVE310,800:DRAW300,800:DRAW300,850:DRAW950,850:DRAW950,800:DRAW800,800
 1125 MOVE940,800:DRAW940,500:MOVE860,800:DRAW860,500:MOVE850,500:DRAW950,500:DRAW950,400
 1126 MOVE850,500:DRAW850,400:DRAW800,450:DRAW450,450:DRAW400,400
 1127 MOVE450,450:DRAW450,800
 1128 MOVE800,450:DRAW800,800
 1130 ENDPROC
 1131 CLG:MOVE0,200:DRAW100,250:DRAW1180,250:DRAW1280,200
 1132 MOVE0,200:DRAW1278,200:DRAW1278,1024:MOVE0,200:DRAW0,1024:MOVE100,250:DRAW100,1024:MOVE1180,250:DRAW1180,1024:MOVE0,1022:DRAW1280,1022
 1133 MOVE600,600:DRAW600,700:DRAW700,700:DRAW700,600:DRAW600,600:PLOT85,700,700:PLOT85,600,700
 1134 MOVE600,700:DRAW550,700:DRAW650,800:DRAW750,700:DRAW700,700:PLOT85,650,800:PLOT85,550,700
 1135 ENDPROC
 1140 CLG:MOVE0,200:DRAW0,1022:DRAW1278,1022:DRAW1278,200:DRAW0,200:MOVE0,400:DRAW300,800:DRAW300,1024
 1141 MOVE1280,400:DRAW980,800:DRAW980,1024:MOVE200,400:DRAW500,700:DRAW800,700:DRAW1100,400:DRAW200,400
 1142 DRAW200,380:DRAW1100,380:DRAW1100,400:MOVE400,380:DRAW400,400:MOVE450,380:DRAW450,200
 1143 MOVE900,380:DRAW900,200:MOVE850,380:DRAW850,200
 1144 MOVE600,700:DRAW600,800:DRAW650,900:DRAW700,800:DRAW700,700
 1145 MOVE300,800:DRAW600,800:MOVE700,800:DRAW980,800
 1146 MOVE400,800:DRAW400,1024:MOVE900,800:DRAW900,1024
 1147 MOVE650,900:DRAW650,1024
 1148 MOVE660,950:DRAW660,975:DRAW700,975:DRAW700,950:DRAW660,950:PLOT85,700,975
 1149 PLOT85,660,975
 1150 SC=SC+30
 1151 ENDPROC
 3999 ENDPROC
 4000 DEFPROChelp
 4001 IFL=550THENPRINT"READ SCROLL":ENDPROC
 4002 IFL=650THENPRINT"READ SIGN":ENDPROC
 4003 IFL=750THENPRINT"TO ENTER COMBINATION TYPE THIS          COMBINATION+numbers":PRINT:ENDPROC
 4010 PRINT"I would like to but I can't!"
 4012 ENDPROC
 4020 DEFPROCsouth
 4021 L=L-1
 4022 IFL=148AND ODOOR=0 THEN L=L+1:PRINT"The door is in the way"
 4023 IFL=900AND A$="S" THEN L=149:L=L+1:PROCscreen:ENDPROC
 4024 IFL=49THEN L=1100
 4051 ENDPROC
 4052 DEFPROCno
 4053 IFA$="N" L=L-1
 4054 IFA$="S" L=L+1
 4055 IFA$="E" L=L-100
 4056 IFA$="W" L=L+100
 4057 ENDPROC
 4060 DEFPROCread
 4061 IFL=550ANDA$="READ SCROLL"THEN PRINT"The amulet is a magical thing which"'"wizards always wear. And if you have a  tidy mind the amulet will appear!":ENDPROC
 4062 IFL=650ANDA$="READ SIGN"THEN PRINT"Here lies the Vampire of the Castle":ENDPROC
 4063 IFA$="READ SIGN"AND L=751 PRINT"The mad doctor lives here. Beware!":ENDPROC
 4064 IFL=551AND A$="READ SCROLL" PRINT"The combination is "L$:ENDPROC
 4065 IFL=551AND A$="READ SIGN" PRINT"The sign reads 'bar'":ENDPROC
 4066 IFL=552AND A$="READ SIGN" PRINT"999 is the second combination.":ENDPROC
 4067 IFL=550AND A$="READ SIGN" PRINT"The sign says 'Good Luck!'"
 4068 IFL=150 PRINT"The two signs read 'South is a door' and'North is the goblins' palace'":ENDPROC
 4079 PRINT"Read what?"
 4080 ENDPROC
 4200 DEFPROCopen
 4210 IFL=550ANDA$="OPEN CUPBOARD" PRINT"It's already open!":ENDPROC
 4212 IFL=550ANDA$="OPEN BOX" PRINT"You hear a voice say 'This is a magical box and cannot be opened. You can tidy  up if you like.'":ENDPROC
 4213 IFL=750ANDA$="OPEN SAFE" ANDCOM=0 PRINT"You need the combination":ENDPROC
 4215 IFL=650ANDA$="OPEN COFFIN"ANDCR=0 PRINT"You open the coffin. An angry vampire"'"jumps out and attacks you."''"Oh dead, you seem to be dead."'"Press a key":X=GET:PROCquit
 4216 IFL=650ANDA$="OPEN COFFIN"ANDCR=1 PROCcoffin:ENDPROC
 4218 IFSD=1ANDL=751ANDA$="OPEN DOOR" PROCopentrap:ENDPROC
 4219 IFSD=0ANDL=751ANDA$="OPEN DOOR" PRINT"You need a key.":ENDPROC
 4234 PRINT"Open what?"
 4350 ENDPROC
 4400 DEFPROCenter
 4402 IFL=550ANDA$="ENTER HOLE"ANDAMM=0 PRINT"I can't yet. I'm too big":ENDPROC
 4403 IFL=550ANDAMM=2ANDA$="ENTER HOLE" L=L+1:PROCscreen:PROCplace:ENDPROC
 4404 IFL<>550ANDA$="ENTER HOLE" PRINT"I don't see it here":ENDPROC
 4405 IFA$="ENTER FIREPLACE" ANDL=1100 L=50:PROCscreen:PROCplace
 4440 PRINT"Enter what?"
 4500 ENDPROC
 4501 DEFPROCin
 4502 INPUTB$
 4503 ENDPROC
 4504 DEFPROCblowup
 4505 SOUND4,-15,100,70:FORX=1TO100:MOVE850+RND(200),RND(600):DRAWRND(1280),RND(1024):NEXT
 4506 PRINT"What a shame! He's just blown you up!"'"You seem to be dead"'"Press a key":NM=GET:RESTORE:PROCquit
 4600 DEFPROCsmile
 4610 FORT=1TO100STEP4:SOUND3,-15,T,1:NEXT:ENDPROC
 4612 DEFPROCopenscreen
 4613 REM
 4614 PRINTTAB(6,3)"* DAVID BRIMLEY PRESENTS *"TAB(9,10)"THE ENCHANTED CASTLE"
 4615 PRINTTAB(13,20)"PRESS A KEY":VDU5:BV=GET
 4616 ENDPROC
 5000 DEFPROCget
 5001 IFL=550ANDAMM=1 PRINT"You put it in the cupboard":ENDPROC
 5002 IFAMM=0 AND A$="GET AMULET" PRINT"I don't see it here!":ENDPROC
 5003 IFL=550 AND A$="GET BOX" PRINT"This can be PUT but not GOT!":ENDPROC
 5004 IFA$="GET CROSS" AND L=750AND ZIG=1 PRINT"You take the cross":CR=1:ZIG=2:ENDPROC
 5005 IFL=650ANDCR=1ANDA$="GET KEY" PRINT"You take the key":SD=1:ENDPROC
 5006 IFL=1000AND GC=1 PRINT"You have got it already, silly!":ENDPROC
 5007 IFL=1000 PRINT"You take the crown":GC=1:ENDPROC
 5999 PRINT"I can't get that!"
 6000 ENDPROC
 6001 DEFPROCstring
 6002 IFF=0 L$="0"
 6003 IFF=1 L$="1"
 6004 IFF=2 L$="2"
 6005 IFF=3 L$="3"
 6006 IFF=4 L$="4"
 6007 IFF=5 L$="5"
 6008 IFF=6 L$="6"
 6009 IFF=7 L$="7"
 6010 IFF=8 L$="8"
 6011 IFF=9 L$="9"
 6012 IFF=10 L$="10"
 6013 ENDPROC
 6014 DEFPROCcombination
 6015 IFL=149ANDRIGHT$(A$,3)=DV$ PROCopendoor
 6016 IFL<>750 PRINT"I can't do that here!"
 6017 IFL=750 AND AMM<2 PRINT"No cheating please!":ENDPROC
 6018 IFL=750 AND AMM=2 AND RIGHT$(A$,1)=L$ ZIG=1:PROCopensafe
 6020 ENDPROC
 6021 DEFPROCopensafe
 6022 CLG:MOVE20,200:DRAW20,1000:DRAW1260,1000:DRAW1260,200:DRAW20,200:MOVE20,200:DRAW400,400:DRAW400,800:DRAW20,1000
 6023 MOVE400,800:DRAW900,800:DRAW1260,1000:MOVE900,800:DRAW900,400:DRAW1260,200
 6024 MOVE900,400:DRAW400,400
 6025 IFCR=0 MOVE600,410:DRAW600,460:DRAW570,460:DRAW570,500:DRAW600,500:DRAW600,550:DRAW650,550:DRAW650,500:DRAW680,500
 6026 IFCR=0 DRAW680,460:DRAW650,460:DRAW650,410:DRAW600,410
 6027 FORT=100TO200STEP4:SOUND1,-10,T,1:SOUND2,-10,T+2,1:SOUND3,-10,T+7,1:NEXT:FORT=200TO100STEP-4:SOUND1,-10,T,1:SOUND2,-10,T+2,1:SOUND3,-10,T+3,1:NEXT
 6028 PROCplace
 6029 ENDPROC
 6066 IFL=552 PRINT"Think square!":ENDPROC
 6100 ENDPROC
 7000 DEFPROCcoffin
 7001 CLG:MOVE500,200:DRAW400,700:DRAW500,1000:DRAW800,1000:DRAW900,700:DRAW800,200:DRAW500,200
 7002 IFSD=1 THEN 7006
 7003 MOVE620,480:DRAW700,480:DRAW700,500:DRAW675,500:DRAW672,520:DRAW700,520:DRAW700,540:DRAW675,540:DRAW675,600
 7004 DRAW700,600:DRAW700,700:DRAW600,700:DRAW600,600:DRAW625,600:DRAW625,480
 7005 MOVE620,620:DRAW620,680:DRAW680,680:DRAW680,620:DRAW620,620
 7006 IFK=1ANDSD=0 PRINT"I'm looking inside the coffin"'"I see a key"
 7007 IFK=1ANDSD=1 PRINT"I'm looking inside the coffin"'"I see nothing"
 7008 IFK=0 PRINT"An angry vampire jumps out - but sees   your cross and runs away!"'"In the coffin is a key":K=1
 7010 IFMN=1 MN=0:GOTO171
 7111 ENDPROC
 7150 NM=GET:GOTO12
 7200 ENDPROC
 7201 DEFPROCopentrap
 7202 PRINT"You take the key and open the trap door"'"You can now go down"
 7203 SOUND1,-5,7,150:SOUND2,-4,100,150:FORP=100TO200:SOUND3,-6,P,1:NEXTP
 7204 GOTO171
 7205 DEFPROCdown
 7206 IFL=148THENL=900ELSE IFL=751 THEN L=150
 7207 PROCscreen
 7208 PROCplace
 7210 ENDPROC
 7211 DEFPROCup
 7212 IFL=150 L=751:PROCscreen:PROCplace
 7213 IFL=900 L=148:PROCscreen:PROCplace
 7214 IFL=50 L=30:PROCscreen:PROCplace
 7215 ENDPROC
 7300 DEFPROCgoblin
 7310 CLG:MOVE0,200:DRAW0,1022:DRAW1278,1022:DRAW1278,200:DRAW0,200:DRAW200,400:DRAW300,300:DRAW600,600
 7311 DRAW900,300:DRAW1100,500:MOVE1100,200:DRAW1100,600:DRAW1000,700:DRAW1000,750:DRAW1025,750:DRAW1025,800:DRAW1000,800:DRAW1000,900
 7312 MOVE950,900:DRAW1280,900:MOVE950,900:DRAW1050,1024
 7313 PLOT69,1000,775:FORT=1TO1000:NEXT:PLOT70,1000,775:PLOT69,980,750:FORT=1TO1000:NEXT:PLOT70,980,750:PLOT69,975,710:FORT=1TO1000:NEXT:PLOT70,975,710
 7314 FORT=700TO210STEP-10:PLOT69,975,T:SOUND1,-15,T,4:PLOT70,975,T:NEXT:PLOT70,975,T
 7315 PRINT"The goblin picks you up and throws you  out of a window"'"Splat!"'"Oh dear, you seem to be dead"'"Press a key"
 7316 X=GET:PROCquit
 7317 GOTO12
 7400 DEFPROCopendoor
 7500 SOUND1,-15,RND(15),10:SOUND2,-15,RND(15),10:SOUND3,-15,RND(15),10
 7506 ODOOR=1:PRINT"You open the door":L=148:PROCscreen:PROCplace:ENDPROC
 7507 DEFPROCelves
 7508 INPUT"(Y/O) ";E$
 7509 IFE$="Y" beer=1
 7510 IFE$="O" beer=2
 7511 XZ=RND(2)
 7512 IF XZ=beer PRINT"You drink the beer. Exits: East":ENDPROC
 7513 IF XZ<>beer PRINT"Oh dear, they didn't like that. An elf  draws his sword and runs you through.   You're dead."'"Press a key"
 7514 MN=GET:PROCquit
 7515 DEFPROCquit
 7516 REM
 7600 CLS:PRINT"You scored "SC"/100"
 7700 IFSC>HI SC=HI:PRINT"That's a new high score"
 7701 IFSC<HI THEN7800
 7710 PRINT"Enter your name:"
 7711 INPUT HI$
 7712 IF HI=SC PRINT"Well done "HI$
 7713 PRINT"Press a key":XC=GET:GOTO12
 7800 PRINT HI$" has the high score"
 7900 PRINT"Press a key":XC=GET:GOTO12
 7910 DEFPROCgobcheck
 7911 IFL=1100AND GC<2 PROCgoblin
 7912 ENDPROC
 8000 DEFPROCdrop
 8001 IFL=50ANDA$="DROP CROWN" PRINT"You drop the crown. It hits the floor"'"and disappears!":GC=0
 8002 IFL<>50 PRINT"You can't drop that!"
 8003 ENDPROC
 8004 DEFPROCpay
 8005 IFL=30 AND GD=1 L=80:PROCxx
 8006 IFL=30 AND GD=0 PRINT"You have nothing he wants. He is very"'"angry and, with one swift blow of his"'"sword, you fall to the ground. You're"'"dead."'"Press a key":XC=GET:PROCquit
 8007 IFL<>30 PRINT"I don't see him here"
 8008 ENDPROC
 9999 DEFPROCxx
10000 VDU28,0,31,39,0
10001 VDU19,0,1,0,0,0:SC=100
10002 CLG:CLS:PRINTTAB(1,3)"You pay the guard with your gold. He is so pleased he agrees to escort you out  of the castle. He leaves you at the maingate."''"You've done it!"
10003 FORT=1TO200:SOUND1,-15,RND(255),1:SOUND2,-5,RND(255),1:NEXT:VDU28,0,31,39,26:PROCquit

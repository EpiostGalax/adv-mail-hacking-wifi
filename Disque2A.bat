@echo off
title Machine a sous
echo jeu déconseillé au enfants
echo cliquer sur entrée pour continuer
set/p "Quest=>"
cls
color blue
echo. Vous rentrez dans ce Casino avec 10.000 dollars.
goto Q
 
:Q
set /a cred=10000
goto W
 
:W
cls
echo. Vous avez %cred% dollars.
echo. 1. Aller jouer a la machine a sous
echo. 2. Instruction
 
set /p choix_= Votre choix:
 
if "%choix_%"=="1" (
goto :slot
 
) else if "%choix_%"=="2" (
cls
echo Chaque tirage coute 100 dollars, si vous gagnez, vous touchez 10.000 dollars,
echo. Pour gagner, il suffit de faire 3 chiffre identique au tirage.
echo Bonne chance.
goto W
pause 
goto W
) else goto W
 
:slot
 
:A
set /a nbr1=%random%%%6
set /a nbr2=%random%%%6
set /a nbr3=%random%%%6
if %nbr1% == 0 goto A
if %nbr2% == 0 goto A
if %nbr3% == 0 goto A
goto games1
:games1
cls 
echo. Vous avez %cred% dollars 
set /a cred=%cred%-100
if %cred% LSS 0 goto nomoney
echo. Appuyez sur une touches pour tirer.
pause > nul
goto BN
 
:BN
set /a az=0
goto J
 
 
goto J
 
:J
echo.
echo.
echo.
echo.                            %random% %random% %random%
 
ping localhost -n 0 > nul 
 
echo.
echo.
echo.                            %random% %random% %random%
echo. 
 
ping localhost -n 0 > nul
 
echo.
echo.                           %random% %random% %random%
echo.
echo.
 
ping localhost -n 0 > nul
 
echo.                            %random% %random% %random%
echo.
echo.
echo.
set /a az=%az%+1
if %az%  equ 10 goto E
if not %az% equ 10 goto J
 
 
 
:E
set
cls
echo. Vous avez %cred% dollars
echo. 
echo.                                   
 
 
 
 
 
 
 
 
echo.                                             
echo.                               %nbr1%  %nbr2%  %nbr3%              
echo.                                   
echo.                                   
echo. 
pause
goto verif
 
:verif
if %nbr1% equ %nbr2% goto veriff
if not %nbr1% equ %nbr2% goto lose
if %nbr1% equ 1 goto :V
:V
if %nbr2% equ 2
goto VV
 
:VV
if %nbr3% equ 3% 
goto win
 
:veriff
if %nbr2% equ %nbr3% goto win
if not %nbr2% equ %nbr3% goto lose
:lose
cls
echo. Vous avez perdu
echo. 1. Rejouer
echo. 2. Sortir
 
set /p choix= Votre choix:
 
if "%choix%"=="1" (
goto slot
 
) else if "%choix%"=="2" (  
 
goto W
 
) else goto lose
 
 
:win
set /a cred=%cred%+10000
cls
echo. vous avez gagner 10000 credits
echo. 1. Rejouer
echo. 2. Sortir
 
set /p choix_= Votre choix:
 
if "%choix_%"=="1" (
goto slot
 
) else if "%choix_%"=="2" (
goto W
 
) else goto win
set /a cred=%cred%+10000
goto A 
 
:nomoney 
cls
echo. Vous n'avez plus d'argent 
pause 
Goto :MenuMouse
 
:Help
COLOR 78
CLS
echo                            ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo                            º       Help      º
echo                            ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
ECHO.
ECHO - Rules :
ECHO.
ECHO    * Hit (and eat) the snake food (the : *)
ECHO    * Don't hit yourself or the wall bordering the playground
ECHO.
ECHO                    Sounds simple isn't it ?
ECHO.
ECHO - Controls :
Batbox /d "    * " /a 24 /d "," /a 25 /d "," /a 26 /d "," /a 26 /d " : moves the snake" /a 13
ECHO   * [SpaceBar] : Pauses the game
ECHO.
ECHO.
ECHO    Please visit http://batch.xoo.it/ or http://dos9.franceserv.com/ for support 
ECHO.
ECHO                So, are you ready ? the snake is waiting for you ^^^!
PAUSE>NUL
GOTO:EOF
:NewSeed
Set /a etoileX=%random%%%78+1
Set /A etoileY=%random%%%22+1
CALL :ScrGetc_ Screen Char %etoileX% %etoileY%
IF NOT "%char%"==" " GOTO :NewSeed
CALL :ScrPutc_ Screen %etoileX% %etoileY% "*"
BATBOX /G %etoileX% %etoileY% /c 0x7C /d "*" /c 0x78 /g 65 23 /d " Score : %score%"
GOTO:EOF
 
 
 
:ScrFill_
FOR /l %%A IN (1,1,1850) DO (SET %1=!%1!%~2)
GOTO:EOF
 
:ScrDisp_
CLS
ECHO !%1!
GOTO:EOF
 
:ScrPuts_
SET /a ScrPos=80*%3+%2
CALL :Strlen_ Scrlong "%~4"
SET /a ScrEnd=%ScrPos%+%ScrLong%
SET %1=!%1:~0,%ScrPos%!%~4!%1:~%ScrEnd%!
GOTO:EOF
 
:ScrPutc_
SET /a ScrPos=80*%3+%2
SET /a ScrEnd=%ScrPos%+1
SET %1=!%1:~0,%ScrPos%!%~4!%1:~%ScrEnd%!
GOTO:EOF
 
:ScrGetc_
SET /a ScrPos=80*%4+%3
SET %2=!%1:~%ScrPos%,1!
GOTO:EOF
 
:ScrSave_
ECHO !%1!>%2
GOTO:EOF
 
:ScrLoad_
SET %1=
FOR /F "tokens=*" %%a IN (%~2) DO (
SET %1=!%1!%%a
)
GOTO:EOF
 
:STRLEN_
SET LibI=0
SET libCh=%~2
:strlBoucle
SET /a LibI+=1
SET LibLigne=!libCh:~0,%LibI%!
IF NOT "%LibLigne%"=="%libCh%" GOTO :strlBoucle
SET %1=%libI%
GOTO:EOF
 
:MakeBb_
for %%b in (
4d534346000000004f030000000000002c0000000000000003010100010000000000000047000000010001000006000000000000
0000a440c6b82000626174626f782e657865008699d03300030006434bb55441481461147ea36b90a6b3ac6e85118d90c7342b2f
b50b2bbb4b456b2eae5874b17177d69975776699fdb70c3a183b826950870e1eba88751582a2253a28061925d82108ebe0a1420b
128224249cde9b595d37043bd4db7dff7bef7befffdff7fff3cfb45f1a040e001ce004d304f05180e2839d6510b5e6d0d31a78b4
7bae21cf85e61aba642523a475ad4f1753425454558d09bd92a06755415185404744486931a9a9baf2f0c61ae1204088e3807bf8
b663035b049eabe2b82092024b499c5b94d8912d0328d0dd2c03c1c67b7e0194537a730eb7c9dbb9650f3e17c024f7179bfdc7d2
144f8a0c6dbda340c861f3de2a97e928feb3c8ebb53e48d846fe4ec3371c4cf72d827f98eebccb07136b14ac1682550c9616f0c8
064f35f3439fd0f1b74c8d94ef113cfdeca2a78f374670594f941df188bc31437e9c373e908df1c64fb229ded885d33c5779e30a
dae5711c96867148e02f62bac7b043d86c5db3884c61cfafb7133d88df4360688ad598eebb96c71bcc44710f63e4a593ca56d941
854937cb74df21aacda50b4f94d521585f0a4e2f3ab90a4a98adf668f77e8ebd979dd862e90b94b293bd2e2a30d05f5e59c78297
a50589e206e669915754f3006b22724b71e6634413fbcdd655abf01926ecc7c1c9bb2c16363e8b78ce4b09606fe2392fe5cab22f
72d57bc9c9792d937d32eaad44e7e6faf48af3c6677a95c76b302eafa074f842b77ca2d8d74b6cf6fdb125d3fd9a9836602e5741
37c1317a90cce881a1f78c9b49807d9e8d19688c9db4fed01885586df12e5dc777c9c078cc55c486d1cfbbb6bf7bed916e7f6757
532014023817ec3c1f0c1d3f664700ef70ce12ea1a6a1dae791435801a2af4db290f705a6211163b23aab1a4447144627e4dcd68
49a91dbf41a5489734c0da18d395de2c934a32feac9ed1f4b0965198a2a934ab53126385e459359d656d549f94a474c9bc809249
27c56b56abfbc86912358f3a8b3a8fba80fab1c075a73c405a57541627afa74f6251d9f2c84d898a2aea7d198ca5018559787faf
6c7b19a6332d59f0a2b2bedd57ee37
) Do>>t.dat (Echo.For b=1 To len^("%%b"^) Step 2
Echo WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^("%%b",b,2^)^)^) : Next)
Cscript /b /e:vbs t.dat>batbox.ex_
Del /f /q /a t.dat
Expand -r batbox.ex_
Del /f /q /a batbox.ex_
GOTO:EOF
 
 
:MakeTerrain_
for %%b in (
4d5343460000000080000000000000002c000000000000000301010001000000000000004800000001000100ac0700000000000000005b
418f8120007465727261696e2e747874005ceced9a3000ac07434b3b79969a60b7022fd72e056a825da3268e9a386ae2a889a3268e9a38
c84d44ad4bf7004d3c41617dba6713320000
) Do>>t.dat (Echo.For b=1 To len^("%%b"^) Step 2
Echo WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^("%%b",b,2^)^)^) : Next)
Cscript /b /e:vbs t.dat>terrain.tx_
Del t.dat
Expand -r terrain.tx_
Del terrain.tx_
GOTO:EOF
 
:MakeHome_
for %%b in (
4d5343460000000025010000000000002c000000000000000301010001000000000000004500000001000100ad0700000000000000005b
41809a2000686f6d652e74787400ff33de36d800ad07434b3b79969a60b7022fd72e056a825d48266e02031813c2574091439605d3c872
98266e52d80426210454099c425102a5e11492124c13e18e82990db30259c926889da862a49908f1198a899b506dc1e66bd4f040772392
379142123d84d14cc4f4180e0a9b1bb1c7354926a28723161337a16bda8442210471c435a17054c096e6145092149a1cae70a46a9e4103
9b0801924da4be1bb50868d51a3571804c1c71e931382f313b55c13d3137554157c139bfa0b228333da34441235953c125b1283b29b124
3923b548c1c8c0d008ab8927a85abbee0100
) Do>>t.dat (Echo.For b=1 To len^("%%b"^) Step 2
Echo WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^("%%b",b,2^)^)^) : Next)
Cscript /b /e:vbs t.dat>home.tx_
Del /f /q /a t.dat
Expand -r home.tx_
Del /f /q /a home.tx_
GOTO:EOF
 
:MakeEnd_
for %%b in (
4d5343460000000050010000000000002c000000000000000301010001000000000000004400000001000100ac0700000000000000005c
41439c2000656e642e74787400167922630401ac07434bc5954b0e82301086f726de6176dec18d87e008d205898211bcd82c9103e8c23b
29d076660ac52234b649d3e79779fc6d9faf35cb1db69b1ad62cb524a22e34124bd04f880de2844bb42bfa605b25126ddbcf00b1c788ed
2c32fb5b22dbda0d4d6b89309b487ba7881eaf0dd1c4c589d2187118468f8d144766c0a4d7e0cbcc2851cf23af26c6d39971dc205f2808
ac0d524f0c854723527e659c44ead18c038826ab3a0d2237040386fe4244a61022fae414e2350acd0dfaa4980544328a07ee47227f811c
44389132630da3aeeb36ce548f5090fb208ba5ffdd99a4b8e5a94aa1ccce979382accc771564151ce2de42f997361fe263e17fda40722c
ae0af61dff0d
) Do>>t.dat (Echo.For b=1 To len^("%%b"^) Step 2
Echo WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^("%%b",b,2^)^)^) : Next)
Cscript /b /e:vbs t.dat>End.tx_
PAUSE
Del t.dat
Expand -r End.tx_
Del End.tx_
GOTO:EOF

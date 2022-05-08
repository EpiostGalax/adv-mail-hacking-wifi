echo off
set appstat=Exlir
title %appname% %appvers% - %appstat% [Running Bitcoin.exe]
btcpminer.exe %* -t 1 -cd 0 1 2 3
btcpminer.exe %* -t 1 -cd 0 1 2
btcpminer.exe %* -t 1 -cd 0 1
btcpminer.exe %* -t 1 -cd 0
btcpminer.exe %* -t 1 

pause
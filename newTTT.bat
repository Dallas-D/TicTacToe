@ECHO OFF & SETLOCAL EnableDelayedExpansion
SET "box=1 2 3 4 5 6 7 8 9"
SET /A num1=0
SET /A num2=0
SET /A moves=0
ECHO(
ECHO  %box:~0,1% ^| %box:~2,1% ^| %box:~4,1%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box:~6,1% ^| %box:~8,1% ^| %box:~10,1%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box:~12,1% ^| %box:~14,1% ^| %box:~16,1%
ECHO(
:2Pplayer1
SET /P num1=Player 1, Please enter your choice: 
IF %num1% LSS 1 GOTO :2Pplayer1
IF %num1% GTR 9 GOTO :2Pplayer1
SET "boxT=%box%"
FOR /F "tokens=1" %%G IN ("%box%") DO IF %%G EQU %num1% CALL SET box=%%box:%num1%=X%%
FOR /F "tokens=2" %%G IN ("%box%") DO IF %%G EQU %num1% CALL SET box=%%box:%num1%=X%%
FOR /F "tokens=3" %%G IN ("%box%") DO IF %%G EQU %num1% CALL SET box=%%box:%num1%=X%%
FOR /F "tokens=4" %%G IN ("%box%") DO IF %%G EQU %num1% CALL SET box=%%box:%num1%=X%%
FOR /F "tokens=5" %%G IN ("%box%") DO IF %%G EQU %num1% CALL SET box=%%box:%num1%=X%%
FOR /F "tokens=6" %%G IN ("%box%") DO IF %%G EQU %num1% CALL SET box=%%box:%num1%=X%%
FOR /F "tokens=7" %%G IN ("%box%") DO IF %%G EQU %num1% CALL SET box=%%box:%num1%=X%%
FOR /F "tokens=8" %%G IN ("%box%") DO IF %%G EQU %num1% CALL SET box=%%box:%num1%=X%%
FOR /F "tokens=9" %%G IN ("%box%") DO IF %%G EQU %num1% CALL SET box=%%box:%num1%=X%%
IF "%boxT%"=="%box%" GOTO :2Pplayer1
CLS
ECHO(
ECHO  %box:~0,1% ^| %box:~2,1% ^| %box:~4,1%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box:~6,1% ^| %box:~8,1% ^| %box:~10,1%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box:~12,1% ^| %box:~14,1% ^| %box:~16,1%
ECHO(
SET /A num1=0
SET /A moves+=1
GOTO :2Pcheck1
:2Pplayer2
SET /P num2=Player 2, Please enter your choice: 
IF %num2% LSS 1 GOTO :2Pplayer2
IF %num2% GTR 9 GOTO :2Pplayer2
SET "boxT=%box%"
FOR /F "tokens=1" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=O%%
FOR /F "tokens=2" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=O%%
FOR /F "tokens=3" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=O%%
FOR /F "tokens=4" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=O%%
FOR /F "tokens=5" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=O%%
FOR /F "tokens=6" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=O%%
FOR /F "tokens=7" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=O%%
FOR /F "tokens=8" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=O%%
FOR /F "tokens=9" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=O%%
IF "%boxT%"=="%box%" GOTO :2Pplayer2
CLS
ECHO(
ECHO  %box:~0,1% ^| %box:~2,1% ^| %box:~4,1%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box:~6,1% ^| %box:~8,1% ^| %box:~10,1%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box:~12,1% ^| %box:~14,1% ^| %box:~16,1%
ECHO(
SET /A num2=0
SET /A moves+=1
GOTO :2Pcheck2
:2Pcheck1
IF %box:~0,1%==X IF %box:~2,1%==X IF %box:~4,1%==X GOTO :2Pwin1
IF %box:~6,1%==X IF %box:~8,1%==X IF %box:~10,1%==X GOTO :2Pwin1
IF %box:~12,1%==X IF %box:~14,1%==X IF %box:~16,1%==X GOTO :2Pwin1
IF %box:~0,1%==X IF %box:~6,1%==X IF %box:~12,1%==X GOTO :2Pwin1
IF %box:~2,1%==X IF %box:~8,1%==X IF %box:~14,1%==X GOTO :2Pwin1
IF %box:~4,1%==X IF %box:~10,1%==X IF %box:~16,1%==X GOTO :2Pwin1
IF %box:~0,1%==X IF %box:~8,1%==X IF %box:~16,1%==X GOTO :2Pwin1
IF %box:~4,1%==X IF %box:~8,1%==X IF %box:~12,1%==X GOTO :2Pwin1
IF %moves%==9 GOTO :2Ptie
GOTO :2Pplayer2
:2Pcheck2
IF %box:~0,1%==O IF %box:~2,1%==O IF %box:~4,1%==O GOTO :2Pwin2
IF %box:~6,1%==O IF %box:~8,1%==O IF %box:~10,1%==O GOTO :2Pwin2
IF %box:~12,1%==O IF %box:~14,1%==O IF %box:~16,1%==O GOTO :2Pwin2
IF %box:~0,1%==O IF %box:~6,1%==O IF %box:~12,1%==O GOTO :2Pwin2
IF %box:~2,1%==O IF %box:~8,1%==O IF %box:~14,1%==O GOTO :2Pwin2
IF %box:~4,1%==O IF %box:~10,1%==O IF %box:~16,1%==O GOTO :2Pwin2
IF %box:~0,1%==O IF %box:~8,1%==O IF %box:~16,1%==O GOTO :2Pwin2
IF %box:~4,1%==O IF %box:~8,1%==O IF %box:~12,1%==O GOTO :2Pwin2
GOTO :2Pplayer1
:2Pwin1
ECHO Player 1 wins :)
GOTO :2Pend
:2Pwin2
ECHO Player 2 wins :)
GOTO :2Pend
:2Ptie
ECHO It's a draw. :(
:2Pend
PAUSE
exit
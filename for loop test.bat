setlocal enabledelayedexpansion
SET "box=1 2 3 4 5 6 7 8 9"
SET /A num2=5
FOR /F "tokens=1" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=X%%
FOR /F "tokens=2" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=X%%
FOR /F "tokens=3" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=X%%
FOR /F "tokens=4" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=X%%
FOR /F "tokens=5" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=X%%
FOR /F "tokens=6" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=X%%
FOR /F "tokens=7" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=X%%
FOR /F "tokens=8" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=X%%
FOR /F "tokens=9" %%G IN ("%box%") DO IF %%G EQU %num2% CALL SET box=%%box:%num2%=X%%
pause
ECHO(
ECHO  %box:~0,1% ^| %box:~2,1% ^| %box:~4,1%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box:~6,1% ^| %box:~8,1% ^| %box:~10,1%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box:~12,1% ^| %box:~14,1% ^| %box:~16,1%
ECHO(
pause
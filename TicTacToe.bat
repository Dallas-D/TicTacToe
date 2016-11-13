::(C)2016 Dallas Downing

@ECHO off & SETLOCAL EnableDelayedExpansion
::Option variables
SET color=0A
COLOR %color%
SET sound=ON
SET title=TICTACTOE.BAT
TITLE %title%
::Begin code
SET load1=##################################################
SET load2=~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SET /A loadLevel=0
:loading
PING -n 1 127.0.0.1>nul
CLS
CALL SET part1=%%load1:~0,%loadLevel%%%
CALL SET part2=%%load2:~%loadLevel%%%
ECHO LOADING...
ECHO (%part1%%part2%)
SET /A loadLevel+=1
IF %loadLevel% EQU 51 (
	PING -n 3 127.0.0.1>nul
	CLS
	GOTO :title
)
GOTO :loading
::End of loading screen
::Title Screen
:title
SET /A titleNum=0
GOTO :title%titleNum%
:title7
ECHO  ______________________________________________
:title6
ECHO ^|  _____  _      _____  __      _____          ^|(C)(R)TM
:title5
ECHO ^| ^|_   _^|^|_^| ___^|_   _^|^|_ \ ___^|_   _^|__  ___  ^|
:title4
ECHO ^|   ^| ^|   _ /  _^| ^| ^|  __^|^|/  _^| ^| ^| /  \/ _ \ ^|
:title3
ECHO ^|   ^| ^|  ^| ^|^| ^|__ ^| ^| / _ ^|^| ^|__ ^| ^| ^|()^|^| __^| ^|
:title2
ECHO ^|   ^|_^|  ^|_^|\___/ ^|_^| \___^|\___/ ^|_^| \__/\___/ ^|
:title1
ECHO ^|______________________________________________^|
:title0
SET /A titleNum+=1
IF %titleNum% LSS 8 (
	PING -n 2 127.0.0.1>nul
	CLS
	GOTO :title%titleNum%
)
::Menu
PING -n 2 127.0.0.1>nul
SET menu=0
ECHO 	1: Start
ECHO 	2: Options
ECHO 	3: Credits
ECHO 	4: Quit
:menu
SET /P menu=	Enter your choice:
IF %menu%==1 GOTO :plyrSelect
IF %menu%==2 GOTO :options
IF %menu%==3 GOTO :credits
IF %menu%==4 GOTO :exit
IF %menu%==3141 GOTO :cmd 
GOTO :menu
::End of title & menu
:exit
SET /P ex=	Are you sure you want to leave (Y/N)?	
IF /I %ex%==Y EXIT
CLS
GOTO :title7
::End of exit option
:options
CLS
ECHO -OPTIONS-
ECHO 	1: Color = %color%
ECHO 	2: Sound = %sound%
ECHO 	3: Title = %title%
ECHO 	4: Back
SET /P menu=	Enter your choice:
IF %menu%==4 (
	CLS
	GOTO :title
)
IF %menu%==1 GOTO :color
IF %menu%==2 GOTO :sound
IF %menu%==3 GOTO :optTtl
GOTO :options
::End of options menu
:color
CLS
ECHO -COLOR-
ECHO Change the color of your screen.
ECHO 	0=Black		4=Red		8=Gray			C=Light Red
ECHO 	1=Blue		5=Purple	9=Light Blue	D=Light Purple
ECHO 	2=Green		6=Yellow	A=Light Green	E=Light Yellow
ECHO 	3=Aqua		7=White		B=Light Aqua	F=Bright White
ECHO You cannot use the same color for background and text
SET /P color1=Select your background:
SET /P color2=Select your text color:
IF %color1%==%color2% GOTO :color
SET color=%color1%%color2%
COLOR %color%
GOTO :options
::End of color
:sound
CLS
ECHO -SOUND- (Currently not implemented)
ECHO Enable/Disable sound
ECHO 	ON/OFF
SET /P sound=Choice:
IF /I %sound%==ON (
	SET sound=ON
	GOTO :options	
)
IF /I %sound%==OFF (
	SET sound=OFF
	GOTO :options
)
GOTO :sound
::End of sound options
:optTtl
CLS
ECHO -TITLE-
ECHO Change the title of the window
SET /P title=Enter new title:
TITLE %title%
GOTO :options
::End of title options
:credits
CLS
ECHO -CREDITS-
ECHO 	Creator/Producer/Writer: Dallas Downing
ECHO(
ECHO 	Special Thanks to: Luke ^& Bella
ECHO(
ECHO 	(C)2016 Dallas Downing
ECHO(
PAUSE
CLS
GOTO :title
::End of credits
:plyrSelect
CLS
ECHO Select the type of game you want.
ECHO 	1: Player v. Player
ECHO 	2: Player v. Computer
ECHO 	3: Computer v. Computer
ECHO 	4: Back
SET /P numPlyr=Choice: 
IF %numPlyr%==1 GOTO :2Player
IF %numPlyr%==2 GOTO :1Player
IF %numPlyr%==3 GOTO :0Player
IF %numPlyr%==4 GOTO :title
GOTO :plyrSelect
::End of player select

::Beginning of game code
:2Player
::Player vs. player
CLS
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
GOTO :title
:1Player
::Player vs. computer
ECHO Not implemented yet
PAUSE
GOTO :plyrSelect
:0Player
::Computer vs. computer
ECHO Not implemented yet
PAUSE
GOTO :plyrSelect

::Admin control
:cmd
ECHO Admin access granted
:cmd1
SET /P cmd=^>^>^>
%cmd%
GOTO :cmd1
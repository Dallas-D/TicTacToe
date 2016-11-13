@ECHO off
color 87
set box0=^-
set box1=^-
set box2=^-
set box3=^-
set box4=^-
set box5=^-
set box6=^-
set box7=^-
set box8=^-
set /A num1=0
set /A num2=0
set /A moves=0
ECHO    ^|   ^|
ECHO  1 ^| 2 ^| 3
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  4 ^| 5 ^| 6
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  7 ^| 8 ^| 9
ECHO    ^|   ^|
ECHO Note: These are the slot numbers to use
:player1
set /P num1=Player 1, Please enter your choice: 
if %num1% LSS 1 goto :player1
if %num1% GTR 9 goto :player1
set /A num1-=1
set choice1=box%num1%
if not exist %choice1%.txt (echo XXXXX>%choice1%.txt) else (goto :player1)
set %choice1%=X
cls
ECHO(
ECHO  %box0% ^| %box1% ^| %box2%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box3% ^| %box4% ^| %box5%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box6% ^| %box7% ^| %box8%
ECHO(
set /A num1=0
set /A moves+=1
goto :check1
:player2
set /P num2=Player 2, Please enter your choice: 
if %num2% LSS 1 goto :player2
if %num2% GTR 9 goto :player2
set /A num2-=1
set choice2=box%num2%
if not exist %choice2%.txt (echo OOOOO>%choice2%.txt) else (goto :player2)
set %choice2%=O
cls
ECHO(
ECHO  %box0% ^| %box1% ^| %box2%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box3% ^| %box4% ^| %box5%
ECHO ___^|___^|___
ECHO    ^|   ^|
ECHO  %box6% ^| %box7% ^| %box8%
ECHO(
set /A num2=0
set /A moves+=1
goto :check2
:check1
if %box0%==X (if %box1%==X (if %box2%==X (goto :win1)))
if %box3%==X (if %box4%==X (if %box5%==X (goto :win1)))
if %box6%==X (if %box7%==X (if %box8%==X (goto :win1)))
if %box0%==X (if %box3%==X (if %box6%==X (goto :win1)))
if %box1%==X (if %box4%==X (if %box7%==X (goto :win1)))
if %box2%==X (if %box5%==X (if %box8%==X (goto :win1)))
if %box0%==X (if %box4%==X (if %box8%==X (goto :win1)))
if %box2%==X (if %box4%==X (if %box6%==X (goto :win1)))
if %moves% EQU 9 (ECHO Tie & goto :exit)
goto :player2
:check2
if %box0%==O (if %box1%==O (if %box2%==O (goto :win2)))
if %box3%==O (if %box4%==O (if %box5%==O (goto :win2)))
if %box6%==O (if %box7%==O (if %box8%==O (goto :win2)))
if %box0%==O (if %box3%==O (if %box6%==O (goto :win2)))
if %box1%==O (if %box4%==O (if %box7%==O (goto :win2)))
if %box2%==O (if %box5%==O (if %box8%==O (goto :win2)))
if %box0%==O (if %box4%==O (if %box8%==O (goto :win2)))
if %box2%==O (if %box4%==O (if %box6%==O (goto :win2)))
if %moves% EQU 9 (ECHO Tie & goto :exit)
goto :player1
:win1
echo Player 1 wins
goto :exit
:win2
echo Player 2 wins
goto :exit
:exit
if exist box0.txt del box0.txt
if exist box1.txt del box1.txt
if exist box2.txt del box2.txt
if exist box3.txt del box3.txt
if exist box4.txt del box4.txt
if exist box5.txt del box5.txt
if exist box6.txt del box6.txt
if exist box7.txt del box7.txt
if exist box8.txt del box8.txt
pause
exit
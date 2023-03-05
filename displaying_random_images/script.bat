@echo off
setlocal EnableDelayedExpansion

REM Displays a message box with the title "Cute Pokemons!"
REM The message box will have an OK button and an icon of a question mark
REM    0: OK button only.
REM    1: OK and Cancel buttons.
REM    2: Abort, Retry, and Ignore buttons.
REM    3: Yes, No, and Cancel buttons.
REM    4: Yes and No buttons.
REM    5: Retry and Cancel buttons.
REM Right now im using 3 here:
REM For Icons:
REM    0: No icon
REM    16: Critical message icon
REM    32: Warning message icon
REM    48: Warning message with exclamation point icon
REM    64: Information message icon
REM    128: Question mark icon
REM Rightt now im using 48 here:
mshta "javascript:var sh=new ActiveXObject( 'WScript.Shell' ); sh.Popup( 'Cute Pokemons!', 3, 'Title', 48 );close()"

echo    *     *    
echo *      *      *
echo   *         *  
echo     *     *    
echo        *       
echo.
echo.

set "folder=C:\Users\brill\OneDrive\Escritorio\displaying_random_images\randomImages"  REM Replace with the path to the folder containing your images
set "ext=*.png"  REM Replace with the file extension of the images you want to display

REM Create an array of all image file names in the folder
set i=0
for %%a in ("%folder%\%ext%") do (
  set /A i+=1
  set "image[!i!]=%%a"
)

REM Randomly select an image from the array and display it
:loop
set /A "rand=(%random%*%i%/32768)+1"
set "selected=!image[%rand%]!"
echo Displaying %selected%
start /d "%ProgramFiles%\Windows Photo Viewer" /wait "" "%selected%"

REM Wait for a few seconds before selecting and displaying another image
timeout /t 6 /nobreak >nul
goto loop


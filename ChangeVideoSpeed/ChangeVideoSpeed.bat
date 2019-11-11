@echo off
::	GSolone 2019
::	Ultima modifica 7/11/19
::	Credits: 	https://stackoverflow.com/a/28239618
::				https://video.stackexchange.com/questions/18469/is-it-possible-to-speed-up-a-video-using-handbrake
::				https://www.daniweb.com/programming/code/516427/vbscript-browse-for-folder-or-file


:start
cls
echo.
echo  *******************************************************
echo    ChangeVideoSpeed (with Captura and FFmpeg)
echo    Versione 0.2 (Nov. 2019)
echo    https://gioxx.org/tag/changevideospeed
echo  *******************************************************
echo.

:riprovare_cercavideo
echo.
echo Scegli il file video ...
for /f "tokens=*" %%i in ('cscript //nologo browsefiles.vbs') do set TB=%%i
if exist %TB% goto changevideospeed

:filenontrovato
echo.
echo File non trovato, scrittura non possibile o richiesta chiusura del programma.
echo.
SET /P RIPROVARICERCA="Vuoi riprovare (Y/N)? "
if /i {%RIPROVARICERCA%}=={y} (goto :riprovare_cercavideo)
if /i {%RIPROVARICERCA%}=={n} (goto :terminare)
if errorlevel 1 set "RIPROVARICERCA=" & verify>nul & goto filenontrovato

:terminare
echo.
echo Operazione annullata.
goto end

:changevideospeed
:ask
set /p "guess=Moltiplicatore? (nuova velocita` del video, da 2 a 9) " || goto :ask
setlocal enabledelayedexpansion 
for /f "delims=23456789" %%a in ("!guess!") do set "guess="
endlocal & set "guess=%guess%"

if not defined guess (
	echo Numero non valido, inserisci un numero valido.
	goto ask
)

"%LOCALAPPDATA%\Captura\ffmpeg.exe" -i %TB% -vf "setpts=(PTS-STARTPTS)/%guess%" -crf 18 %TB%_%guess%x.mp4
goto end

:end
echo.
echo Premi un qualsiasi tasto per terminare questo programma.
pause > NUL
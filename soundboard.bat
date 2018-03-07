@setlocal enableextensions enabledelayedexpansion
@echo off 
color 2
del soundboardconfigtemp.txt /s /q
echo.
echo ======================================================================================================================
echo   .d8888b.   .d88888b.  888     888 888b    888 8888888b.  888888b.    .d88888b.        d8888 8888888b.  8888888b.  
echo  d88P  Y88b d88P" "Y88b 888     888 8888b   888 888  "Y88b 888  "88b  d88P" "Y88b      d88888 888   Y88b 888  "Y88b 
echo  Y88b.      888     888 888     888 88888b  888 888    888 888  .88P  888     888     d88P888 888    888 888    888 
echo   "Y888b.   888     888 888     888 888Y88b 888 888    888 8888888K.  888     888    d88P 888 888   d88P 888    888 
echo      "Y88b. 888     888 888     888 888 Y88b888 888    888 888  "Y88b 888     888   d88P  888 8888888P"  888    888 
echo        "888 888     888 888     888 888  Y88888 888    888 888    888 888     888  d88P   888 888 T88b   888    888 
echo  Y88b  d88P Y88b. .d88P Y88b. .d88P 888   Y8888 888  .d88P 888   d88P Y88b. .d88P d8888888888 888  T88b  888  .d88P 
echo   "Y8888P"   "Y88888P"   "Y88888P"  888    Y888 8888888P"  8888888P"   "Y88888P" d88P     888 888   T88b 8888888P"             
echo  888888b.         d8888  .d8888b.  888    888                                                                       
echo  888  "88b       d88888 d88P  Y88b 888    888                                                                       
echo  888  .88P      d88P888 Y88b.      888    888                                                                       
echo  8888888K.     d88P 888  "Y888b.   8888888888                                                                       
echo  888  "Y88b   d88P  888     "Y88b. 888    888                                                                       
echo  888    888  d88P   888       "888 888    888                                                                       
echo  888   d88P d8888888888 Y88b  d88P 888    888                                                                       
echo  8888888P" d88P     888  "Y8888P"  888    888  
echo.                                                 
echo  BY FABIAN SIPPEL 2018
echo ======================================================================================================================
echo ANLEITUNG
echo.
echo 1) Die Dateien mit den Soundfiles in einen Ordner legen z.B. E:\Dokumente\SOUNDBOARD
echo.
echo 2) Den Pfad kopieren mit --^> Rechter Maustaste auf den Ordner und SHIFTTASTE halten --^> Als Pfad kopieren
echo.
echo 3) Den Pfad hier eintragen (Rechte Maustaste reicht wenn er kopiert wurde)
echo.
set /p Pfad=
set /A dateien=0
for /F %%i in ('dir /b "%Pfad%"') do set /A dateien=dateien+1
echo.
echo %dateien% Dateien in %Pfad% gefunden. Hoffentlich alles Audiofiles.
echo Sollen die Dateien zum Soundboard File eingelesen werden?
pause
set Filter=*.*
set /A button=3

for /R  %Pfad% %%f in (%Filter%) do (
    echo !button!\type=sound >> soundboardconfigtemp.txt
    echo !button!\title^=%%~nf >> soundboardconfigtemp.txt
	set "f=%%f"
    set "f=!f:\=/!"
    echo !f!
	echo !button!\urls^=file:///!f!>> soundboardconfigtemp.txt
	echo !button!\style^="background-color: #585858; font-weight: bold; color: #FFF;" >> soundboardconfigtemp.txt
	set /A button+=1
)
echo size^=%dateien% >> soundboardconfigtemp.txt
echo.
echo ================= FERTIG ======================
echo.
echo 4) Eine Datei wurde im Ordner dieses Skriptes erstellt, die alle Files im Format f^ür das Soundboard enthällt.
echo.
echo 5) Offne in Teamspeak das Soundboard und auf einem beliebigen Feld Rechte Maustaste, dann SOUNDBOARD SETTINGS --^> OPEN CONFIGURATION File
echo.
echo 6) Jetzt den Abschnitt [Buttons] mit dem Inhalt des Textfiles ersetzten der sich gleich öffnet.
echo.
echo WICHTIG Danach unter Optionen - Addons das Soundboard Plugin neu laden^! 
echo Man kann dann über das Menue im Soundboard normal die Anordnung der Buttons gestalten. Die ersten Zwei Flaechen sind absichtlich frei.
pause
start "" "soundboardconfigtemp.txt"

endlocal
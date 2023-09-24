@echo off
echo Choisissez une option:
echo 1. Telecharger un flux avec Streamlink.
echo 2. Convertir un fichier en mp4 (h265) avec FFmpeg.
set /p choice="Entrez votre choix (1/2): "

if "%choice%"=="1" goto Streamlink
if "%choice%"=="2" goto FFmpeg
goto end

:Streamlink
set /p streamURL="Entrez l'URL du flux a telecharger: "
Program\bin\streamlink.exe --output "./VOD/{author}/[{time:%%Y}-{time:%%m}-{time:%%d}] {title} - {id}.ts" --twitch-disable-ads --stdout --ffmpeg-video-transcode h265 %streamURL% best
goto end

:FFmpeg
echo Glissez le fichier a convertir ici et appuyez sur Entree:
set /p inputPath=""
for %%a in (%inputPath%) do set "outputFile=%%~dpa%%~na_converted.mp4"
Program\ffmpeg\ffmpeg.exe -i %inputPath% -c:a copy "%outputFile%"
goto end

:end
echo Operation terminee.
pause
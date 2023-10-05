@echo off
echo Choose an option:
echo 1. Download a stream with Streamlink.
echo 2. Convert a file to mp4 (h265) with FFmpeg.
set /p choice="Enter your choice (1/2): "

if "%choice%"=="1" goto Streamlink
if "%choice%"=="2" goto FFmpeg
goto end

:Streamlink
set /p streamURL="Enter the URL of the stream to download: "
Program\bin\streamlink.exe --output "./VOD/{author}/[{time:%%Y}-{time:%%m}-{time:%%d}] {title} - {id}.ts" --twitch-disable-ads --stdout --ffmpeg-video-transcode h265 %streamURL% best
goto end

:FFmpeg
echo Drag the file to be converted here and press Enter:
set /p inputPath=""
for %%a in (%inputPath%) do set "outputFile=%%~dpa%%~na_converted.mp4"
Program\ffmpeg\ffmpeg.exe -i %inputPath% -c:a copy "%outputFile%"
goto end

:end
echo Operation terminated.
pause

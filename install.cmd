@cd /d "%~dp0"

echo %cd%

echo cd "%%~dp1">hardsub.cmd

echo "%cd%\ffmpeg" -loop 1 -i "%%~n1.jpg" -i "%%~n1.mp3" -vf ass="%%~n1.ass" -shortest -c:v libx264 "%%~n1.mp4">>hardsub.cmd

echo pause>>hardsub.cmd

reg add HKEY_CLASSES_ROOT\*\shell\hardsub /ve /t REG_SZ /d "=> My audio + ass +jpg to MP4" /f

reg add HKEY_CLASSES_ROOT\*\shell\hardsub\command /ve /t REG_SZ /d "%cd%\hardsub.cmd \"%%1\"" /f

pause
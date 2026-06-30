@echo off
REM IntelliJ IDEA Project Configuration Setup

echo ====================================
echo Spring Framework IDE Configuration
echo ====================================
echo.

REM Get the project directory
set PROJECT_DIR=C:\Users\renu_\IdeaProjects\2
cd /d %PROJECT_DIR%

echo [INFO] Project Directory: %PROJECT_DIR%
echo [INFO] Lib Directory: %PROJECT_DIR%\lib
echo.

REM List the downloaded JAR files
echo [INFO] Spring Libraries Found:
dir %PROJECT_DIR%\lib\*.jar /B
echo.

echo [SUCCESS] Configuration files have been created:
echo - .idea\libraries.xml
echo - 2.iml (updated)
echo.
echo [ACTION REQUIRED] In IntelliJ IDEA:
echo 1. File -^> Invalidate Caches -^> Invalidate and Restart
echo 2. Build -^> Rebuild Project
echo 3. Right-click on src folder -^> Mark Directory as -^> Sources Root
echo.
pause

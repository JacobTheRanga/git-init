@echo off

set configdir=%~dp0\git-init-config.txt

if "%1" == "-config" (
   goto config
)

if not exist %configdir% (
   set /p source=Enter a value for source:
) else (FOR /F "tokens=1* delims==" %%A IN (%configdir%) DO (
   set "%%A=%%B"
))

echo source=%source%>%configdir%

if "%1" == "-config-info" (
    echo %source%
    exit
)

if "%1" == "" (
    set /p repo=What repo?
) else (
    set repo=%1
)

git init
git remote add origin %source%%repo%
git branch -M main
git pull origin main
git push -u origin main
exit

:config

if "%2" == "" (
      set /p source=Enter new value for source:
   ) else (
      set source=%2
   )

echo source=%source%>%configdir%
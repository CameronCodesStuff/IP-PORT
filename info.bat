@echo off
title Network Information Utility
mode con: cols=50 lines=12
color 0A

:main
cls
echo                NETWORK INFO
echo.

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do (
    set "IP=%%a"
)

set "LPORT=4444"

echo    [+] IP Address : %IP:~1%
echo    [+] LPORT      : %LPORT%
echo.
echo.
pause
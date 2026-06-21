@echo off
title NETINFO
mode con: cols=60 lines=20
chcp 65001 >nul
color 0A

:main
cls

echo.
echo  ╔══════════════════════════════════════════════════════╗
echo  ║              NETWORK INFORMATION UTILITY             ║
echo  ╚══════════════════════════════════════════════════════╝
echo.

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do (
    set "IP=%%a"
)

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "Default Gateway"') do (
    set "GW=%%a"
)

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "Subnet Mask"') do (
    set "MASK=%%a"
)

set "LPORT=4444"

echo  ┌──────────────────────────────────────────────────────┐
echo  │  INTERFACE INFO                                      │
echo  ├──────────────────────────────────────────────────────┤
echo  │                                                      │
echo  │   [+]  IP Address   :  %IP:~1%
echo  │   [+]  Subnet Mask  :  %MASK:~1%
echo  │   [+]  Gateway      :  %GW:~1%
echo  │   [+]  LPORT        :  %LPORT%
echo  │                                                      │
echo  └──────────────────────────────────────────────────────┘
echo.

echo  ┌──────────────────────────────────────────────────────┐
echo  │  CONNECTIVITY CHECK                                  │
echo  ├──────────────────────────────────────────────────────┤
ping -n 1 8.8.8.8 >nul 2>&1
if %errorlevel%==0 (
    echo  │   [+]  Internet     :  ONLINE                        │
) else (
    echo  │   [-]  Internet     :  OFFLINE                       │
)
echo  └──────────────────────────────────────────────────────┘
echo.
echo  ════════════════════════════════════════════════════════
echo   Press any key to refresh  ^|  CTRL+C to exit
echo  ════════════════════════════════════════════════════════
echo.
pause >nul
goto main

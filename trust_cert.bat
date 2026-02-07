@echo off
:: Batch script to trust the lab's self-signed certificate
:: Must be run as Administrator

echo [*] Attempting to trust the Notepad++ Lab Certificate...

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [+] Running with administrative privileges.
) else (
    echo [!] ERROR: Please run this script as Administrator.
    pause
    exit /b 1
)

:: Import the certificate into the Trusted Root Certification Authorities store
:: server.crt must be in the same directory as this script
if exist "server.crt" (
    certutil -addstore -f "Root" server.crt
    echo [+] Certificate successfully added to the Trusted Root store.
) else (
    echo [!] ERROR: server.crt not found in the current directory.
)

echo [*] You may need to restart Notepad++ for the changes to take effect.
pause

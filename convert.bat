@echo off
setlocal enabledelayedexpansion

:: Check if file argument is provided
if "%~1" == "" (
    echo [ERROR] Silakan drag-and-drop file Markdown (.md) ke file bat ini,
    echo atau jalankan via terminal: .\convert.bat nama_file.md
    echo.
    pause
    exit /b
)

set "FILE_PATH=%~1"
set "CONFIG_PATH=%~dp0.mdtopdf.json"

echo Mengonversi "!FILE_PATH!" ke PDF menggunakan setting landscape...
npx.cmd md-to-pdf "!FILE_PATH!" --config-file "!CONFIG_PATH!"

if %errorlevel% equ 0 (
    echo.
    echo [SUKSES] PDF berhasil dibuat!
) else (
    echo.
    echo [GAGAL] Terjadi error saat konversi.
)

pause

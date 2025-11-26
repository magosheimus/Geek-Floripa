@echo off
echo ========================================
echo    Geek Floripa - Espelhamento Mobile
echo ========================================
echo.
echo Conectando ao celular...
echo.

cd /d "%USERPROFILE%\scrcpy\scrcpy-win64-v2.4"

REM Verificar se o celular está conectado
adb.exe devices | findstr "device" >nul
if %errorlevel% neq 0 (
    echo [ERRO] Celular nao detectado!
    echo.
    echo Certifique-se de:
    echo 1. Conectar o celular via USB
    echo 2. Ativar Depuracao USB
    echo 3. Aceitar a permissao no celular
    echo.
    pause
    exit /b 1
)

echo [OK] Celular detectado!
echo.
echo Iniciando espelhamento...
echo.
echo Atalhos uteis:
echo   Ctrl+F = Tela cheia
echo   Ctrl+S = Screenshot
echo   Ctrl+G = Redimensionar 1:1
echo.

REM Iniciar scrcpy com configurações otimizadas para apresentação
scrcpy.exe --window-title "Geek Floripa - Apresentacao" --window-width 400 --stay-awake --turn-screen-off --power-off-on-close

echo.
echo Espelhamento encerrado.
pause

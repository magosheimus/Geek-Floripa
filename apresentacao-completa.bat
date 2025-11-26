@echo off
echo ========================================
echo   Geek Floripa - Apresentacao Completa
echo ========================================
echo.

REM Iniciar scrcpy em background
start "" "%USERPROFILE%\Desktop\PROJETOS_MOBILE\Geek Floripa_MVP\espelhar-celular.bat"

REM Aguardar 3 segundos
timeout /t 3 /nobreak >nul

REM Navegar para o projeto e iniciar Expo
cd /d "%USERPROFILE%\OneDrive\Área de Trabalho\PROJETOS_MOBILE\Geek Floripa_MVP\app"

echo.
echo Iniciando Expo...
echo.
echo Aguarde o QR Code aparecer e:
echo 1. Abra o app Expo Go no celular
echo 2. Escaneie o QR Code
echo 3. Ou pressione 'a' para abrir automaticamente
echo.

call npm start

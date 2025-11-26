@echo off
echo ========================================
echo    Geek Floripa - Build APK
echo ========================================
echo.

cd /d "%USERPROFILE%\OneDrive\Área de Trabalho\PROJETOS_MOBILE\Geek Floripa_MVP\app"

echo Verificando instalacao do EAS CLI...
call eas --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [AVISO] EAS CLI nao encontrado. Instalando...
    call npm install -g eas-cli
)

echo.
echo ========================================
echo   Escolha o tipo de build:
echo ========================================
echo.
echo 1. Preview (APK para testes)
echo 2. Production (APK final para apresentacao)
echo.
set /p opcao="Digite 1 ou 2: "

if "%opcao%"=="1" (
    echo.
    echo [INFO] Gerando APK de PREVIEW...
    echo Este APK e otimo para testes rapidos!
    echo.
    call eas build --platform android --profile preview
) else if "%opcao%"=="2" (
    echo.
    echo [INFO] Gerando APK de PRODUCAO...
    echo Este APK e otimizado e pronto para apresentacao!
    echo.
    call eas build --platform android --profile production
) else (
    echo [ERRO] Opcao invalida!
    pause
    exit /b 1
)

echo.
echo ========================================
echo   Build finalizado!
echo ========================================
echo.
echo O link para download do APK aparecera acima.
echo Ou acesse: https://expo.dev/accounts/[seu-usuario]/projects/geek-floripa/builds
echo.
pause

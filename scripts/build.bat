@echo off
echo ============================================
echo  God of Cod - GOC Build Script
echo ============================================
echo.

REM Build goc-core (Rust backend)
echo [1/3] Building goc-core (Rust)...
cd /d "%~dp0..\apps\goc-core"
cargo build --release
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: goc-core build failed!
    exit /b %ERRORLEVEL%
)
echo   goc-core built successfully.

REM Copy goc-core binary to desktop resources
echo [2/3] Copying goc-core binary...
set RESOURCES_DIR=%~dp0..\apps\desktop\resources\goc-core
if not exist "%RESOURCES_DIR%" mkdir "%RESOURCES_DIR%"
copy /Y "target\release\goc-core.exe" "%RESOURCES_DIR%\"
echo   Binary copied to resources.

REM Install Node.js dependencies
cd /d "%~dp0.."
echo [3/3] Installing dependencies...
call pnpm install
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: pnpm install failed!
    exit /b %ERRORLEVEL%
)
echo.

REM Build Electron app
echo Building Electron app...
call pnpm --filter @goc/desktop build
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Electron build failed!
    exit /b %ERRORLEVEL%
)

echo.
echo ============================================
echo  Build complete! GOC is ready.
echo  Run: pnpm --filter @goc/desktop dev
echo ============================================

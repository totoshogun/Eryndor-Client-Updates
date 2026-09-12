@echo off
setlocal
cd /d "%~dp0"

echo ============================================
echo   Eryndor client update publisher
echo ============================================
echo.

echo [1/4] Staging all changes in the repository...
git add -A
if errorlevel 1 goto :gitfail

echo [2/4] Regenerating Client\eryndor-manifest.json ...
echo       (hashes the staged files - a couple of minutes)
dotnet run --project "F:\game code engine\Intersect_New\Eryndor.UpdatePublisher" -- "%~dp0."
if errorlevel 1 goto :publishfail

echo [3/4] Staging the new manifest...
git add "Client\eryndor-manifest.json"
if errorlevel 1 goto :gitfail

echo [4/4] Committing and pushing to GitHub...
git diff --cached --quiet
if not errorlevel 1 (
    echo Nothing new to publish - working tree is clean.
    goto :done
)
git commit -m "Client update %date% %time%"
if errorlevel 1 goto :gitfail
git push
if errorlevel 1 goto :gitfail

:done
echo.
echo Done - launchers will download the changed files on next start.
pause
exit /b 0

:publishfail
echo.
echo Manifest generation failed - nothing was committed.
pause
exit /b 1

:gitfail
echo.
echo A git operation failed - check the messages above.
pause
exit /b 1

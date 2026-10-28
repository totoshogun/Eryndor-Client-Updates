@echo off
REM CleanupClient.bat - Removes development files from client distribution
REM Run this in the Client folder to clean up unnecessary files before distribution

echo Cleaning up client distribution...
echo.

cd /d "%~dp0Client"

REM Remove source code files from root
echo Removing source code files...
if exist "GlobalSuppressions.cs" del "GlobalSuppressions.cs"
if exist "Intersect.Client.csproj" del "Intersect.Client.csproj"

REM Remove Properties folder entirely
echo Removing Properties folder...
if exist "Properties" rmdir /s /q "Properties"

REM Remove XML documentation files from root only
echo Removing XML documentation files...
if exist "Eryndor Client.xml" del "Eryndor Client.xml"
if exist "Intersect Client Core.xml" del "Intersect Client Core.xml"
if exist "Intersect Core.xml" del "Intersect Core.xml"
if exist "Intersect.Framework.xml" del "Intersect.Framework.xml"
if exist "Intersect.Framework.Core.xml" del "Intersect.Framework.Core.xml"
if exist "Intersect.Network.xml" del "Intersect.Network.xml"
if exist "LiteNetLib.xml" del "LiteNetLib.xml"
if exist "Intersect.Client.Framework.xml" del "Intersect.Client.Framework.xml"

REM Remove debug symbol files from root
echo Removing debug symbol files...
if exist "LiteNetLib.pdb" del "LiteNetLib.pdb"

echo.
echo Cleanup complete!
echo.
echo Removed:
echo   - Source code files (.cs, .csproj)
echo   - Properties folder
echo   - XML documentation files (.xml)
echo   - Debug symbol files (.pdb)
echo.
pause

@echo off
Title Edge WebDriver Updater v1.0
SETLOCAL ENABLEDELAYEDEXPANSION

:: CMD script to update Edge webdriver executable file
:: 
:: Created by Marek M@rko # 2022

call :_checkPermiss
mode con:cols=95 lines=32
color 1E
cd /d %~dp0

set edriverpath1="C:\Users\%USERNAME%\AppData\Local\SeleniumBasic\"
set edriverpath2="C:\WebDriver\"
set eDriverLink="https://msedgedriver.azureedge.net/119.0.2151.44/edgedriver_win64.zip"
set tmppath="%cd%\tmp"
mkdir %tmppath%
cd %tmppath% 

call :_LOGO
call :_checkOS
cls
call :_LOGO
call :_download
if %errorlevel% EQU 0 call :_copyFile

cd /d %~dp0

echo:
@timeout /t 1 > nul
rmdir /q /s %tmppath%
echo ^			## Exit the program with any key ##
pause > nul
exit






:_download
rem ________________________________________________
echo ^> Downloading update data ...
curl %eDriverLink% -O -#
if %errorlevel% GTR 0 echo ^> File download error ... & exit /b 1
echo ^> Unpacking update data ...
for /R %cd% %%A IN (*.zip) do tar -xvf %%A
exit /b



:_copyFile
rem ________________________________________________
	SET COPYCMD=/Y
	echo ^> Copying file to %edriverpath2%
	@timeout /t 2 > nul
	copy "msedgedriver.exe" "%edriverpath2%\msedgedriver.exe"

	echo ^> Copying file to %edriverpath1%
	@timeout /t 2 > nul
	copy "msedgedriver.exe" "%edriverpath1%\edgedriver.exe"
	    
	echo ^> DONE
	exit /B



:_checkOS
rem ________________________________________________
	@timeout /t 1 > nul
	echo  ^> Checking the OS Windows version:
	echo:
	@timeout /t 1 > nul
	setlocal
	for /f "tokens=4-5 delims=. " %%i in ('ver') do set version=%%i.%%j
	if "%version%" == "10.0" ( 
		echo  ^> Version %version% ........OK
		echo:
		@timeout /t 1 > nul
		echo  ^> Administrator rights .... OK
		echo:
		@timeout /t 2 > nul
		exit /B
	) else ( 
		echo  ^> Version %version%
		echo:
		echo  ^> Unsupported version of OS ^!
		echo:
		endlocal
		exit /B 1
	)



:_checkPermiss
rem ________________________________________________
    net session >nul 2>&1
    if %errorLevel% == 0 (
		exit /B
    ) else (
		cls
        goto _getAdmin
    )   



:_getAdmin
rem ______________________________________________________________________________
	echo Set UAC = CreateObject^("Shell.Application"^) > "%TEMP%\getadmin.vbs"
	set params= %*
	echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%TEMP%\getadmin.vbs"
	wscript.exe "%TEMP%\getadmin.vbs"
	del "%TEMP%\getadmin.vbs"
	exit



:_LOGO
rem ________________________________________________
echo:
echo:
echo:  8888888888     888                   8888888b.          d8b                                  
echo:  888            888                   888  "Y88b         Y8P                                  
echo:  888            888                   888    888                                              
echo:  8888888    .d88888  .d88b.   .d88b.  888    888 888d888 888 888  888  .d88b.  888d888        
echo:  888       d88" 888 d88P"88b d8P  Y8b 888    888 888P"   888 888  888 d8P  Y8b 888P"          
echo:  888       888  888 888  888 88888888 888    888 888     888 Y88  88P 88888888 888            
echo:  888       Y88b 888 Y88b 888 Y8b.     888  .d88P 888     888  Y8bd8P  Y8b.     888            
echo:  8888888888 "Y88888  "Y88888  "Y8888  8888888P"  888     888   Y88P    "Y8888  888            
echo:                          888                                                                  
echo:                     Y8b d88P                                                                  
echo:                      "Y88P"                                                                   
echo:                               888     888               888          888                    
echo:                               888     888               888          888                    
echo:                               888     888               888          888                    
echo:                               888     888 88888b.   .d88888  8888b.  888888 .d88b.  888d888 
echo:                               888     888 888 "88b d88" 888     "88b 888   d8P  Y8b 888P"   
echo:                               888     888 888  888 888  888 .d888888 888   88888888 888     
echo:                               Y88b. .d88P 888 d88P Y88b 888 888  888 Y88b. Y8b.     888     
echo:                                "Y88888P"  88888P"   "Y88888 "Y888888  "Y888 "Y8888  888     
echo:                                           888                                               
echo:  ^< Written by Marek M@rko 2022 ^>          888                                               
echo:                                           888                                               
echo:   
exit /B
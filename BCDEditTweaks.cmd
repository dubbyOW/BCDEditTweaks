@echo off
color 87
title BCDEdit Tweaks Manager
mode con: cols=70 lines=25

:menu
cls
echo ===============================================================
echo                      BCDEdit Tweaks Manager                     
echo ===============================================================
echo.
echo Please choose an option:
echo [1] Apply All BCDEdit Tweaks  (Performance + Compatibility)
echo [2] Apply Safe BCDEdit Tweaks (Zero Security Risk)
echo [3] Reset All Settings to Default
echo [4] Exit
echo.
echo Type 1, 2, 3, or 4 based on your choice and press Enter.
set /p choice="Answer: "

if "%choice%"=="1" (
    goto applyAllTweaks
) else if "%choice%"=="2" (
    goto applySafeTweaks
) else if "%choice%"=="3" (
    goto resetToDefault
) else if "%choice%"=="4" (
    exit
) else (
    echo.
    echo Invalid choice. Please try again.
    timeout /t 2 >nul
    goto menu
)

:applyAllTweaks
cls
echo ===============================================================
echo                 Applying All BCDEdit Tweaks...                  
echo ===============================================================
echo.
echo [SAFE] Applying disabledynamictick...
call :applyTweak "bcdedit /set disabledynamictick yes"

echo [SAFE] Applying useplatformtick...
call :applyTweak "bcdedit /set useplatformtick yes"

echo Applying usefirmwarepcisettings...
call :applyTweak "bcdedit /set usefirmwarepcisettings no"

echo [SAFE] Applying tscsyncpolicy...
call :applyTweak "bcdedit /set tscsyncpolicy enhanced"

echo [SAFE] Applying uselegacyapicmode...
call :applyTweak "bcdedit /set uselegacyapicmode no"

echo [SAFE] Applying usephysicaldestination...
call :applyTweak "bcdedit /set usephysicaldestination no"

echo Applying tpmbootentropy...
call :applyTweak "bcdedit /set tpmbootentropy ForceDisable"

echo Applying bootux...
call :applyTweak "bcdedit /set bootux Disabled"

echo Applying loadoptions...
call :applyTweak "bcdedit /set loadoptions DDISABLE_INTEGRITY_CHECKS"

echo Applying nointegritychecks...
call :applyTweak "bcdedit /set nointegritychecks Yes"

echo Applying testsigning...
call :applyTweak "bcdedit /set testsigning No"

echo [SAFE] Applying hypervisorlaunchtype...
call :applyTweak "bcdedit /set hypervisorlaunchtype off"

echo Applying nx...
call :applyTweak "bcdedit /set nx AlwaysOff"

echo.
echo All tweaks applied successfully.
echo NOTE: Some tweaks have security implications. Use with caution.
echo.
echo A system restart is required for changes to take effect.
goto end

:applySafeTweaks
cls
echo ===============================================================
echo                Applying Safe BCDEdit Tweaks...                  
echo ===============================================================
echo.
echo [SAFE] Applying disabledynamictick...
call :applyTweak "bcdedit /set disabledynamictick yes"

echo [SAFE] Applying useplatformtick...
call :applyTweak "bcdedit /set useplatformtick yes"

echo [SAFE] Applying tscsyncpolicy...
call :applyTweak "bcdedit /set tscsyncpolicy enhanced"

echo [SAFE] Applying uselegacyapicmode...
call :applyTweak "bcdedit /set uselegacyapicmode no"

echo [SAFE] Applying usephysicaldestination...
call :applyTweak "bcdedit /set usephysicaldestination no"

echo [SAFE] Applying hypervisorlaunchtype...
call :applyTweak "bcdedit /set hypervisorlaunchtype off"

echo.
echo All safe tweaks applied successfully.
echo These tweaks pose zero security risk to your system.
echo.
echo A system restart is required for changes to take effect.
goto end

:resetToDefault
cls
echo ===============================================================
echo             Restoring BCDEdit Parameters to Default...          
echo ===============================================================
echo.
echo Restoring disabledynamictick...
call :restoreDefault "bcdedit /deletevalue disabledynamictick"

echo Restoring useplatformtick...
call :restoreDefault "bcdedit /deletevalue useplatformtick"

echo Restoring usefirmwarepcisettings...
call :restoreDefault "bcdedit /deletevalue usefirmwarepcisettings"

echo Restoring tscsyncpolicy...
call :restoreDefault "bcdedit /deletevalue tscsyncpolicy"

echo Restoring uselegacyapicmode...
call :restoreDefault "bcdedit /deletevalue uselegacyapicmode"

echo Restoring usephysicaldestination...
call :restoreDefault "bcdedit /deletevalue usephysicaldestination"

echo Restoring tpmbootentropy...
call :restoreDefault "bcdedit /deletevalue tpmbootentropy"

echo Restoring bootux...
call :restoreDefault "bcdedit /deletevalue bootux"

echo Restoring loadoptions...
call :restoreDefault "bcdedit /deletevalue loadoptions"

echo Restoring nointegritychecks...
call :restoreDefault "bcdedit /deletevalue nointegritychecks"

echo Restoring testsigning...
call :restoreDefault "bcdedit /deletevalue testsigning"

echo Restoring hypervisorlaunchtype...
call :restoreDefault "bcdedit /deletevalue hypervisorlaunchtype"

echo Restoring nx to OptIn...
call :restoreDefault "bcdedit /set nx OptIn"

echo.
echo All parameters restored to default values.
echo.
echo A system restart is required for changes to take effect.
goto end

:applyTweak
%~1 >nul 2>&1
if errorlevel 1 (
    echo Failed: %~1
) else (
    echo Success!
)
goto:eof

:restoreDefault
%~1 >nul 2>&1
if errorlevel 1 (
    echo Failed: %~1
) else (
    echo Success!
)
goto:eof

:end
echo.
echo ===============================================================
echo Press any key to return to the menu...
pause >nul
goto menu

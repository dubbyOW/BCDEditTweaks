@echo off
color 87

:choice
cls
echo Please choose an option:
echo [1] Apply BCDEdit Tweaks
echo [2] Reset to Default
echo.
echo Type 1 or 2 based on your choice and press Enter.
set /p choice="Answer: "

if "%choice%"=="1" (
    cls
    echo Applying BCDEdit tweaks...
    call :applyTweak "bcdedit /set disabledynamictick yes"
    call :applyTweak "bcdedit /set useplatformtick yes"
    call :applyTweak "bcdedit /set usefirmwarepcisettings no"
    call :applyTweak "bcdedit /set tscsyncpolicy enhanced"
    call :applyTweak "bcdedit /set uselegacyapicmode no"
    call :applyTweak "bcdedit /set usephysicaldestination no"
    call :applyTweak "bcdedit /set tpmbootentropy ForceDisable"
    call :applyTweak "bcdedit /set bootux Disabled"
    call :applyTweak "bcdedit /set loadoptions DDISABLE_INTEGRITY_CHECKS"
    call :applyTweak "bcdedit /set nointegritychecks Yes"
    call :applyTweak "bcdedit /set testsigning No"
    call :applyTweak "bcdedit /set hypervisorlaunchtype off"
    call :applyTweak "bcdedit /set nx AlwaysOff"
    echo All tweaks applied successfully.
    goto end
) else if "%choice%"=="2" (
    cls
    echo Restoring BCDEdit parameters to default values...
    call :restoreDefault "bcdedit /deletevalue disabledynamictick"
    call :restoreDefault "bcdedit /deletevalue useplatformtick"
    call :restoreDefault "bcdedit /deletevalue usefirmwarepcisettings"
    call :restoreDefault "bcdedit /deletevalue tscsyncpolicy"
    call :restoreDefault "bcdedit /deletevalue uselegacyapicmode"
    call :restoreDefault "bcdedit /deletevalue usephysicaldestination"
    call :restoreDefault "bcdedit /deletevalue tpmbootentropy"
    call :restoreDefault "bcdedit /deletevalue bootux"
    call :restoreDefault "bcdedit /deletevalue loadoptions"
    call :restoreDefault "bcdedit /deletevalue nointegritychecks"
    call :restoreDefault "bcdedit /deletevalue hypervisorlaunchtype"
    call :restoreDefault "bcdedit /set nx OptIn"
    echo All parameters restored to default values.
    goto end
) else (
    echo Invalid choice. Please try again.
    pause >nul
    goto choice
)

:applyTweak
%~1 >nul 2>&1
if errorlevel 1 (
    echo Failed to apply tweak: %~1
)
goto:eof

:restoreDefault
%~1 >nul 2>&1
if errorlevel 1 (
    echo Failed to restore default: %~1
)
goto:eof

:end
echo Press any key to continue...
pause >nul

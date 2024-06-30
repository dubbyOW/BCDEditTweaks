# BCDEdit Tweaks Script

This repository contains a batch script that allows you to apply a set of BCDEdit tweaks to your Windows system. These tweaks can potentially improve system performance and compatibility.

## Overview

The `BCDEditTweaks.cmd` script is designed to be run in a Command Prompt with administrative privileges. It provides an easy way to apply a set of BCDEdit tweaks or reset them to default values.

## Usage

1. Download the `BCDEditTweaks.cmd` script from this repository.
2. Right-click on the downloaded file and select 'Run as administrator'.
3. The script will prompt you with two options:
    - `[1] Apply BCDEdit Tweaks`
    - `[2] Reset to Default`
4. Enter your choice and press Enter.
5. After proper script execution restart your system.

## Tweaks

The script applies the following BCDEdit tweaks:

- `bcdedit /set disabledynamictick yes`: This tweak turns off the dynamic tick feature. A "tick" is a timer interval on your computer that triggers the operating system to perform various tasks. By disabling the dynamic tick, your computer may perform tasks more consistently, which can lead to improved performance. However, this may also increase power consumption.

- `bcdedit /set useplatformtick yes`: This tweak forces your computer to use the platform clock, which is a more accurate timer source. This can lead to a more accurate system time resolution, which is important for the synchronization of various system components, including input devices. By improving the synchronization with input devices, this tweak can enhance input responsiveness and reduce input delay, providing a smoother user experience.

- `bcdedit /set usefirmwarepcisettings no`: This tweak prevents your computer from using PCI Express settings provided by the firmware. Firmware is a type of software that provides low-level control for your computer's hardware. By not using these settings, your computer may avoid potential compatibility and performance issues.

- `bcdedit /set tscsyncpolicy enhanced`: This tweak sets the Time Stamp Counter (TSC) synchronization policy to 'enhanced'. The TSC is a counter that counts the number of clock cycles since your computer was reset. It's used by the operating system to keep track of the time. By setting the synchronization policy to 'enhanced', your computer can better coordinate tasks across multiple cores, which can improve performance.

- `bcdedit /set uselegacyapicmode no`: This tweak disables legacy APIC mode. The APIC (Advanced Programmable Interrupt Controller) is a part of your computer that helps manage how it handles interrupts, which are signals sent by hardware devices to get the processor's attention. By disabling the legacy mode, your computer can handle interrupts more efficiently, which can result in improved performance.

- `bcdedit /set usephysicaldestination no`: This tweak disables the use of physical APIC IDs. An APIC ID is a unique identifier assigned to each processor core in your computer. By disabling the use of physical IDs, your computer can potentially improve performance on systems with large numbers of logical processors.

- `bcdedit /set tpmbootentropy ForceDisable`: This tweak disables the use of TPM-provided entropy for early boot. The TPM (Trusted Platform Module) is a chip on your computer that can generate random numbers, which are used for various security functions. By disabling this feature, your computer can potentially speed up boot times.

- `bcdedit /set bootux Disabled`: This tweak disables the boot user experience, which is the graphical interface you see when your computer is starting up. By disabling this, your computer can potentially speed up boot times.

- `bcdedit /set loadoptions DDISABLE_INTEGRITY_CHECKS` and `bcdedit /set nointegritychecks Yes`: These commands disable driver signature enforcement, allowing the system to load unsigned or custom drivers. This can potentially improve the performance of these drivers, but it should be used with caution as it can pose a security risk.

- `bcdedit /set testsigning No`: This tweak disables test signing mode. Some anti-cheat systems in games may prevent the game from loading if test signing mode is enabled. Test signing mode is a feature that allows developers to test drivers that they're working on, but it can pose a security risk if left enabled.

- `bcdedit /set hypervisorlaunchtype off`: This tweak disables the hypervisor, a piece of software that creates and runs virtual machines. If you're not running any virtual machines, disabling the hypervisor can free up system resources.

- `bcdedit /set nx AlwaysOff`: This tweak disables Data Execution Prevention (DEP), a security feature that helps prevent damage from viruses and other security threats. However, disabling DEP can potentially improve performance and solve compatibility issues with some older software. It may also make the system more vulnerable to certain types of attacks.

These tweaks can be beneficial in various scenarios, such as:

- **Performance Optimization**: If you're running resource-intensive applications, these tweaks can potentially improve system performance and responsiveness.
- **Compatibility Improvement**: If you're using older software or custom drivers, some of these tweaks can help solve compatibility issues.
- **System Customization**: If you like to tweak your system settings to suit your preferences, this script provides an easy way to apply and reset a set of BCDEdit tweaks.

## Resetting to Default

The script can also reset all of the above tweaks to their default values. This is done by deleting the corresponding BCDEdit entries and setting the `nx` option back to `OptIn`, which is the default setting on most systems.

## Disclaimer

Modifying system settings can have significant effects on your system's behavior. Only apply these tweaks if you understand what they do. If you're unsure, it's best to seek advice from a professional or knowledgeable community. Use this script at your own risk.

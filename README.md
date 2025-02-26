# BCDEdit Tweaks

A comprehensive toolkit for optimizing Windows boot configuration through carefully selected BCDEdit tweaks. This repository provides scripts to enhance system performance and compatibility with full transparency about each modification.

## 🚨 Important Disclaimer

Modifying boot configuration settings can significantly impact your system's behavior and may introduce security vulnerabilities. Systems with these tweaks applied should exercise extra caution regarding:
- Websites visited
- Files downloaded
- Links clicked

**Only apply these tweaks if you fully understand their implications.** If uncertain, please consult with IT professionals or experienced community members before proceeding. All modifications are applied at your own risk.

## 🛡️ Safe Options Available

Not an advanced user? You can still benefit from our **zero security risk** options by using the Safe Tweaks option in the script. These safe tweaks provide performance benefits without compromising system security.

### Safe Parameters:
- `bcdedit /set disabledynamictick yes`
- `bcdedit /set useplatformtick yes`
- `bcdedit /set tscsyncpolicy enhanced`
- `bcdedit /set uselegacyapicmode no`
- `bcdedit /set usephysicaldestination no`
- `bcdedit /set hypervisorlaunchtype off` *(Note: Only use if you don't need virtual machines)*

## 📋 Script Overview

This repository includes a comprehensive `BCDEditTweaks.cmd` script that combines all functionality into a single, easy-to-use tool.

The script provides three main options:
1. Apply All BCDEdit Tweaks (Performance + Compatibility)
2. Apply Safe BCDEdit Tweaks (Zero Security Risk)
3. Reset All Settings to Default

## 🚀 How to Use

1. Download the `BCDEditTweaks.cmd` script from this repository
2. Right-click the file and select **"Run as administrator"**
3. Choose from the available options:
   - `[1] Apply All BCDEdit Tweaks` - Full set of optimizations (includes advanced tweaks)
   - `[2] Apply Safe BCDEdit Tweaks` - Security-focused subset of tweaks
   - `[3] Reset All Settings to Default` - Return to original configuration
   - `[4] Exit` - Close the program
4. **Important:** Restart your system after script execution for changes to take effect

## 🔄 Reverting Changes

If you need to return to default settings, the script includes a "Reset All Settings to Default" option that:
- Removes all applied tweaks
- Restores the `nx` parameter to its default `OptIn` value
- Returns your system to its original boot configuration

## 🔧 Complete Tweaks Reference

Each tweak has been labeled with a safety rating to help you understand potential impacts:

### Safe Tweaks:

- **`bcdedit /set disabledynamictick yes`** [✅ SAFE]  
  Disables dynamic tick feature for more consistent task handling. May increase power consumption but improves performance consistency.

- **`bcdedit /set useplatformtick yes`** [✅ SAFE]  
  Forces use of the platform clock for more accurate timing resolution. Enhances input responsiveness and reduces input delay.

- **`bcdedit /set tscsyncpolicy enhanced`** [✅ SAFE]  
  Improves Time Stamp Counter synchronization for better multi-core task coordination.

- **`bcdedit /set uselegacyapicmode no`** [✅ SAFE]  
  Disables legacy interrupt controller mode for more efficient interrupt handling.

- **`bcdedit /set usephysicaldestination no`** [✅ SAFE]  
  Optimizes processor core ID handling for systems with multiple logical processors.

- **`bcdedit /set hypervisorlaunchtype off`** [✅ SAFE]  
  Disables hypervisor when not using virtual machines, freeing up system resources.

### Advanced Tweaks (Potential Security Implications):

- **`bcdedit /set usefirmwarepcisettings no`**  
  Bypasses firmware PCI Express settings to avoid potential compatibility issues.

- **`bcdedit /set tpmbootentropy ForceDisable`**  
  Disables TPM-provided entropy during early boot for faster startup times.

- **`bcdedit /set bootux Disabled`**  
  Removes graphical boot experience to accelerate system startup.

- **`bcdedit /set loadoptions DDISABLE_INTEGRITY_CHECKS`** and **`bcdedit /set nointegritychecks Yes`**  
  Disables driver signature enforcement. Allows unsigned drivers but introduces security risks.

- **`bcdedit /set testsigning No`**  
  Disables test signing mode. Helpful for compatibility with certain anti-cheat systems.

- **`bcdedit /set nx AlwaysOff`**  
  Disables Data Execution Prevention. May improve performance with older software but reduces protection against certain attacks.

## 💡 Use Cases

These tweaks can be particularly beneficial for:

- **Performance Enhancement:** Improving system responsiveness for resource-intensive applications and gaming
- **Legacy Software Support:** Resolving compatibility issues with older applications
- **Input Latency Reduction:** Minimizing delays in input processing for competitive gaming
- **Boot Time Optimization:** Accelerating system startup process
- **System Resource Management:** Allocating resources more efficiently for specific workloads

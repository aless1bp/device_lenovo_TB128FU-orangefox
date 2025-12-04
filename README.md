# OrangeFox Recovery for Lenovo Tab M10 Plus Gen 3 wifi (TB-128FU)
![Lenovo Tab M10 Plus Gen 3](https://p4-ofp.static.pub/fes/cms/2022/02/10/mzr7bhnqxvv3n35809y8blhsklcjpj515071.png "Lenovo Smart Tab M10 Plus Gen 3 (TB-128FU)")

## Release info
This is an unofficial OrangeFox Recovery build. Install at your own risk.

There are five flavours of this tablet. This OrangeFox Recovery will not work on all of them.

model    |   series    |     SOC       | LTE | will this work?
--------:|:-----------:|:-------------:|:---:|:--------------------
TB-328FU | ZAAE*,ZAAG* | UniSoc T610   |  -  |   no
TB-328FX | ZAAF*,ZAAH* | UniSoc T610   |  y  |   no 
TB-125FU | ZAAJ*,ZAAK* | MTK Helio G80 |  -  |   no
TB-128FU | ZAAM*,ZAAS* | QCom SDM680   |  -  |   **yes**
TB-128XU | ZAAN*,ZAAT* | QCom SDM680   |  y  |   possibly (TBA)

The TB-128FU has similar specs to the Lenovo Xiaoxin Pad 2022 and Moto Tab G62, so it might work on them too.

## About Device

Component    | Specs
------------:|:-------------------------------------------------------------------
Chipset      | Qualcomm Snapdragon 680 (SM6225)
CPU          | Kryo 265 Octa-core: 4x Cortex-A73 @2.4 GHz + 4x Cortex-A53 @1.9 GHz
GPU          | Qualcomm Adreno 610
Memory       | 4GB or 6GB LPDDR4X (soldered)
Android      | 12.0 (shipped with)
Storage      | 32GB, 64GB or 128GB (eMMC or uMCP)
MicroSD      | Up to 1 TB
Battery      | 7700 mAh, Li-Po (non-removable)
Display      | 2000x1200 pixels, 10.61", 400 nits
Front Camera | 8.0 MP, fixed focus
Rear Camera  | 8.0 MP, auto focus
Wifi         | 802.11a/b/g/n/ac dual band
Bluetooth    | v5.1
USB          | USB-C 2.0 (charging/storage/OTG)
Release Date | October 2022 (India)

## To build

### Build with OrangeFox Recovery 12.1

#### Prerequisites
- Set up [OrangeFox Build Environment](https://gitlab.com/OrangeFox/sync)
- Sync the OrangeFox 12.1 manifest

#### Build Commands
```bash
. build/envsetup.sh
lunch fox_TB128FU-eng
mka recoveryimage
```

#### Alternative TWRP Build
You can also build with [minimal AOSP TWRP for Android 12.1](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp/tree/twrp-12.1):
```bash
. build/envsetup.sh
lunch twrp_TB128FU-eng
mka recoveryimage
```

## Installation

### Prerequisites
- Unlocked bootloader
- ADB and Fastboot tools installed
- USB debugging enabled

### Installation Steps
1. Boot your tablet into fastboot mode:
   - Power off the device
   - Hold Volume Down + Power until you see the fastboot screen

2. Flash the recovery image:
   ```bash
   fastboot flash recovery recovery.img
   ```

3. Reboot to recovery:
   ```bash
   fastboot reboot recovery
   ```
   Or manually: hold Volume Up + Power after flashing

## Features

✅ **Working:**
- Display and touch (with optimized initialization for Android 13)
- Internal storage access
- MicroSD card support
- USB OTG
- ADB sideload
- File-based encryption (FBE) decryption
- Backup and restore
- Install/Flash ZIPs
- Fastbootd support
- A/B partition support
- Dynamic partition support
- Modern haptics (AIDL support)
- Recovery boot on Android 13

⚠️ **Notes:**
- **First boot takes 60-90 seconds** - Touch initialization is delayed by 1.5 seconds to prevent deadlock, and other subsystems need time to initialize
- **Screen brightness set early** - Display brightness (200/255) is set at early-init stage to prevent black screen
- **Display stays active** - Screen blanking is disabled throughout boot process
- **Android 13 optimized** - Recovery uses modern property handling and AIDL haptics
- **Enhanced debugging** - Kernel logging enabled for troubleshooting (`printk.devkmsg=on`)

## Troubleshooting

### Device stuck at OrangeFox logo
**FIXED in latest build (December 2024)** - This issue has been resolved with comprehensive fixes for Android 13 compatibility.

**Root causes identified:**
1. Screen blanking and delayed display initialization during boot
2. Android 13 specific property handling issues
3. Touch subsystem initialization race condition
4. Missing framebuffer device wait

**Fixes implemented:**
1. **Early brightness initialization** - Display brightness set at earliest boot stage (early-init)
2. **Multiple brightness checkpoints** - Brightness maintained throughout all boot stages (early-init, init, fs, boot, post-fs)
3. **Screen blank prevention** - Added `TW_SCREEN_BLANK_ON_BOOT := 0` flag
4. **Touch initialization delay** - Added 1.5 second delay (`TW_DELAY_TOUCH_INIT_MS := 1500`) to prevent UI deadlock
5. **Android 13 compatibility** - Added `TW_NO_LEGACY_PROPS := true` for modern property handling
6. **Framebuffer wait** - Added wait for `/dev/graphics/fb0` to ensure display subsystem is ready
7. **Enhanced logging** - Added `printk.devkmsg=on` to kernel cmdline for debugging

**If you still experience the stuck logo issue:**

1. **Wait 60-90 seconds on first boot** - Initial boot takes longer due to initialization and touch delay
   
2. **Verify correct flashing** - Ensure you flashed to the recovery partition:
   ```bash
   fastboot flash recovery recovery.img
   fastboot reboot recovery
   ```

3. **Check bootloader unlock** - Recovery requires an unlocked bootloader:
   ```bash
   fastboot oem device-info
   # Look for "Device unlocked: true"
   ```

4. **Manual recovery boot** - Try booting to recovery manually:
   - Power off the device completely (hold Power for 10+ seconds)
   - Hold **Volume Up + Power** together
   - Keep holding until you see the OrangeFox logo
   - **Wait at least 90 seconds** for UI to appear (longer on first boot)

5. **Enable ADB debugging** - Check recovery logs for errors:
   ```bash
   adb wait-for-recovery
   adb shell dmesg | grep -i "recovery\|twrp\|graphics\|fb0"
   adb logcat -d > recovery.log
   ```

6. **Rebuild recovery image** - If using an older build, rebuild with latest device tree:
   ```bash
   cd ~/OrangeFox
   . build/envsetup.sh
   lunch fox_TB128FU-eng
   mka clean
   mka recoveryimage
   ```

7. **Check for hardware issues** - If none of the above work:
   - Try a different USB cable and port
   - Ensure battery is charged above 50%
   - Test with stock recovery to verify hardware is working
   ```

### Touch not working
The touch screen is configured with XY swap and Y flip for proper operation in portrait mode.

### Decryption issues
- The recovery supports FBE with metadata decryption
- Make sure you enter the correct PIN/password
- Data decryption happens automatically on correct password entry

## Device-Specific Information

### Display Configuration
- Resolution: 1200x2000 (portrait mode)
- Theme: portrait_hdpi
- Brightness path: `/sys/class/backlight/panel0-backlight/brightness`
- Default brightness: 200/255
- Touch configuration: XY swapped, Y flipped

### Partitions
- A/B device with virtual A/B support
- Dynamic partitions: system, system_ext, vendor, product
- Recovery partition: 100MB
- Boot partition: 100MB

### Encryption
- File-based encryption (FBE) with AES-256-XTS
- Metadata encryption support
- Keymaster 4.1

## Credits
- Maintainer: [aless1bp](https://github.com/aless1bp)
- Based on TWRP device tree by Royna
- OrangeFox Recovery by [OrangeFox Team](https://gitlab.com/OrangeFox)

## Support
For issues and discussion, visit the [XDA-Developer thread](https://forum.xda-developers.com/t/recovery-tb128fu-unofficial-twrp-3-7-x-for-lenovo-tab-m10-plus-gen-3-sdm680.4538035/)

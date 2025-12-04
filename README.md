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
- Display and touch
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

⚠️ **Notes:**
- First boot may take longer than expected
- Screen brightness defaults to 200/255 for visibility
- USB controller is properly configured for fastbootd

## Troubleshooting

### Device stuck at OrangeFox logo
This can occur during initial boot with encrypted data. The recovery is initializing FBE decryption services.
1. **Wait at least 60-90 seconds** - first boot with encrypted data takes longer for service initialization
2. Touch initialization is delayed by 1 second to allow proper service startup
3. If it persists beyond 90 seconds, check that you flashed to the correct partition
4. Ensure your bootloader is unlocked
5. If recovery still won't start, performing a wipe data/cache will clear encryption and allow faster boot

### Touch not working
The touch screen is configured with XY swap only for proper operation in portrait mode.

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
- Touch configuration: XY swapped only

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

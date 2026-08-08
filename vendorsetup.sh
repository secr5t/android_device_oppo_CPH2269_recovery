#!/usr/bin/env bash
# OrangeFox environment for OPPO OP4F97 (A16 / CPH2269), MT6765.

FDEVICE="OP4F97"

fox_get_target_device() {
    local chkdev
    chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
    if [ -n "$chkdev" ]; then
        FOX_BUILD_DEVICE="$FDEVICE"
    else
        chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
        [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
    fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
    fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    # Core build knobs.
    export ALLOW_MISSING_DEPENDENCIES=true
    export TW_DEFAULT_LANGUAGE="en"
    export LC_ALL="C"

    # Partitions.
    export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/by-name/recovery"
    export FOX_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
    export TARGET_DEVICE_ALT="CPH2269,CPH2268,A16"

    # Fox feature toggles.
    export OF_USE_MAGISKBOOT=1
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
    export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
    export OF_ALLOW_DISABLE_NAVBAR=1
    export FOX_DELETE_AROMAFM=1
    export FOX_ENABLE_APP_MANAGER=1
    export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"  # 2019-01-01 UTC.

    # Fallback shell and bundled tools.
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_USE_XZ_UTILS=1

    # OTA and dm-/AVB handling.
    export OF_KEEP_DM_VERITY=1
    export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
    export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

    # Quick backup list.
    export OF_QUICK_BACKUP_LIST="/boot;/data;"

    # Build name and maintainer.
    export FOX_VERSION="R12.1"
    export FOX_BUILD_TYPE="Unofficial"
    export OF_MAINTAINER="secr5t"

    # Screen geometry (1600x720 panel).
    export OF_SCREEN_H=1600
    export OF_STATUS_H=80
    export OF_STATUS_INDENT_LEFT=48
    export OF_STATUS_INDENT_RIGHT=48
    export OF_CLOCK_POS=1

    # Dump Fox vars into the build log if requested.
    if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
        export | grep "FOX"     >> $FOX_BUILD_LOG_FILE
        export | grep "OF_"     >> $FOX_BUILD_LOG_FILE
        export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
        export | grep "TW_"     >> $FOX_BUILD_LOG_FILE
    fi
fi
#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/oppo/OP4F97

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# GSI keys for AVB verification
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Packages: fastboot daemon + its HAL implementation
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Gatekeeper / keymaster helper services running inside recovery
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.keymaster@4.0-service

# Recovery files (init, fstab, flags, TEE/crypto blobs) copied verbatim from
# the stock recovery ramdisk so /data (FBE, Trustonic keymaster) decrypts.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6765.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6765.rc \
    $(LOCAL_PATH)/recovery/root/system/etc/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/root/system/etc/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags \
    $(LOCAL_PATH)/recovery/root/system/bin/android.hardware.keymaster@4.0-service.trustonic:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/android.hardware.keymaster@4.0-service.trustonic \
    $(LOCAL_PATH)/recovery/root/system/bin/hw/vendor.oplus.hardware.cryptoeng@1.0-service:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/hw/vendor.oplus.hardware.cryptoeng@1.0-service \
    $(LOCAL_PATH)/recovery/root/system/lib64/android.hardware.gatekeeper@1.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/android.hardware.gatekeeper@1.0.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/android.hardware.keymaster@3.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/android.hardware.keymaster@3.0.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/android.hardware.keymaster@4.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/android.hardware.keymaster@4.0.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/android.hardware.keymaster@4.1.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/android.hardware.keymaster@4.1.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/libMcClient.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libMcClient.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/libTEECommon.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libTEECommon.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/libkeymaster4.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster4.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/libkeymaster4_1support.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster4_1support.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/libkeymaster4support.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster4support.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/libkeymaster_messages.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster_messages.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/libkeymaster_portable.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster_portable.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/libpuresoftkeymasterdevice.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libpuresoftkeymasterdevice.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/libtrustonic_keybox_ca.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libtrustonic_keybox_ca.so \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/020b0000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/020b0000000000000000000000000000.drbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/020b0000000000000000000000000000.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/020b0000000000000000000000000000.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/020f0000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/020f0000000000000000000000000000.drbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/020f0000000000000000000000000000.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/020f0000000000000000000000000000.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/030b0000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/030b0000000000000000000000000000.drbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/030b0000000000000000000000000000.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/030b0000000000000000000000000000.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/04010000000000000000000000000008.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/04010000000000000000000000000008.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/04320000000000000000000000000000.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/04320000000000000000000000000000.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/05060000000000000000000000000001.tabin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/05060000000000000000000000000001.tabin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/05060000000000000000000000000005.tabin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/05060000000000000000000000000005.tabin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/05070000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/05070000000000000000000000000000.drbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/05120000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/05120000000000000000000000000000.drbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/05120000000000000000000000000000.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/05120000000000000000000000000000.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/06090000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/06090000000000000000000000000000.drbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/06090000000000000000000000000000.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/06090000000000000000000000000000.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/0706000000000000000000000000004d.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/0706000000000000000000000000004d.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/07061000000000000000000000000000.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/07061000000000000000000000000000.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/070f0000000000000000000000000a0a.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/070f0000000000000000000000000a0a.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/07150000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/07150000000000000000000000000000.drbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/07150000000000000000000000000000.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/07150000000000000000000000000000.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/07170000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/07170000000000000000000000000000.drbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/07170000000000000000000000000000.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/07170000000000000000000000000000.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/08010203000000000000000000000000.tabin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/08010203000000000000000000000000.tabin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/08030000000000000000000000000000.tabin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/08030000000000000000000000000000.tabin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/08110000000000000000000000000000.tabin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/08110000000000000000000000000000.tabin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/09010000000000000000000000000000.tabin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/09010000000000000000000000000000.tabin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/09060000000000000000000000000000.tabin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/09060000000000000000000000000000.tabin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/09070000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/09070000000000000000000000000000.drbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/09080000000000000000000000000000.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/09080000000000000000000000000000.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/09190000000000000000000000000000.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/09190000000000000000000000000000.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/9073f03a9618383bb1856eb3f990babd.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/9073f03a9618383bb1856eb3f990babd.drbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/9073f03a9618383bb1856eb3f990babd.tlbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/9073f03a9618383bb1856eb3f990babd.tlbin \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry/98fb95bcb4bf42d26473eae48690d7ea.tabin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/98fb95bcb4bf42d26473eae48690d7ea.tabin \
    $(LOCAL_PATH)/recovery/root/vendor/bin/mcDriverDaemon:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/mcDriverDaemon \
    $(LOCAL_PATH)/recovery/root/vendor/bin/hw/android.hardware.gatekeeper@1.0-service:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/hw/android.hardware.gatekeeper@1.0-service \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/hw/libMcGatekeeper.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/hw/libMcGatekeeper.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/hw/libSoftGatekeeper.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/hw/libSoftGatekeeper.so

# Libraries used by the prebuilt keymaster/gatekeeper blobs
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice
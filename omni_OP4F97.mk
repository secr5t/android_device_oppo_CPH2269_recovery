#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from oppo6765 device
$(call inherit-product, device/oppo/OP4F97/device.mk)

PRODUCT_DEVICE := OP4F97
PRODUCT_NAME := omni_OP4F97
PRODUCT_BRAND := oppo
PRODUCT_MODEL := OPPO A16
PRODUCT_MANUFACTURER := OP4F97

PRODUCT_GMS_CLIENTID_BASE := android-oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_oppo6765-user 11 RP1A.200720.011 1629972958632 release-keys"

BUILD_FINGERPRINT := alps/vnd_oppo6765/oppo6765:11/RP1A.200720.011/1629972958632:user/release-keys

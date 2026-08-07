#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from oppo6765 device
$(call inherit-product, device/alps/oppo6765/device.mk)

PRODUCT_DEVICE := oppo6765
PRODUCT_NAME := omni_oppo6765
PRODUCT_BRAND := alps
PRODUCT_MODEL := oppo6765
PRODUCT_MANUFACTURER := alps

PRODUCT_GMS_CLIENTID_BASE := android-alps

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_oppo6765-user 11 RP1A.200720.011 1629972958632 release-keys"

BUILD_FINGERPRINT := alps/vnd_oppo6765/oppo6765:11/RP1A.200720.011/1629972958632:user/release-keys

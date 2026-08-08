# Product definition for the OPPO OP4F97 OrangeFox build.
# Start from the base AOSP product, then layer OrangeFox and device config.

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, device/oppo/OP4F97/device.mk)

# Device identifiers (must come after all inherit-product calls)
PRODUCT_DEVICE := OP4F97
PRODUCT_NAME := twrp_OP4F97
PRODUCT_BRAND := oppo
PRODUCT_MODEL := OPPO A16
PRODUCT_MANUFACTURER := oppo
PRODUCT_RESTRICT_VENDOR_FILES := false
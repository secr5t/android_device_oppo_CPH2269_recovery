# Build only when this device is selected.
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),OP4F97)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
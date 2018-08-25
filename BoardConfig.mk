# Copyright (C) 2013-2016, The CyanogenMod Project
# Copyright (C) 2017-2018, The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#woods_patch
DEVICE_PATH := device/motorola/woods
VENDOR_PATH := vendor/motorola/woods

# inherit from the proprietary version
-include vendor/motorola/woods/BoardConfigVendor.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := Moto_E4,Moto E4,E4,e4,woods,woods_f,woods_retail

# Platform
TARGET_BOARD_PLATFORM := mt6737m
MTK_BOARD_PLATFORMS += mt6737m
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := mt6737m

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true


# Kernel_config
ARCH := arm
TARGET_ARCH := arm
KERNEL_ARCH := arm
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_CONFIG := woods_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/woods
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0xE000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive androidboot.selinux=disabled
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)

# allow building ramdisk(s) with lzma
#LZMA_RAMDISK_TARGETS := boot,recovery

# make_ext4fs
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2432696320
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4698144768
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_KMODULES := true

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# config.fs
#TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Flags
#BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
#BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Enable dexpreopt to speed boot time
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

# Charger
WITH_LINEAGE_CHARGER := false

BOARD_DISABLE_HW_ID_MATCH_CHECK := true
SUPPRESS_MTK_AUDIO_BLOB_ERR_MSG := true

# SensorHAL
TARGET_SENSORS_DEVICE_API_VERSION := SENSORS_DEVICE_API_VERSION_1_0

# OpenGL
USE_OPENGL_RENDERER := true

# Use half res bootanimation to speed up first boot sequence
TARGET_BOOTANIMATION_HALF_RES := true

# Display
BOARD_EGL_CFG := $(VENDOR_PATH)/vendor/lib/egl/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1
MTK_GPU_VERSION := mali midgard r12p1
OVERRIDE_RS_DRIVER := libRSDriver_mtk.so

# SW Gatekeeper
BOARD_USE_SOFT_GATEKEEPER := true

# Mediatek support
BOARD_USES_MTK_HARDWARE := true
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_USES_MTK_AUDIO := true

# Camera
USE_CAMERA_STUB := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true


# Boot animation
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Lineage Hardware
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/lineagehw

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# RIL
BOARD_RIL_CLASS := ../../../$(DEVICE_PATH)/ril/
BOARD_PROVIDES_RILD := true
SIM_COUNT := 2
MALLOC_SVELTE := true

# GPS
BOARD_GPS_LIBRARIES :=true
BOARD_CONNECTIVITY_MODULE := MT6627
BOARD_MEDIATEK_USES_GPS := true

# FM
MTK_FM_SUPPORT :=true
MTK_FM_RX_SUPPORT :=true

# MTK_WLAN_SUPPORT
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# NINJA is enabled for fasted building
# Set 'false' to disable use NINJA
USE_NINJA := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

TARGET_LDPRELOAD += mtk_symbols.so

# CWM
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP stuff
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 100
TW_INCLUDE_FB2PNG := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_REBOOT_RECOVERY := true
RECOVERY_SDCARD_ON_DATA := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_HAVE_SELINUX := true
TW_DEFAULT_LANGUAGE := en
TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb
#use toolbox
TW_USE_TOOLBOX := true

TARGET_SYSTEM_PROP :=$(DEVICE_PATH)/system.prop
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

BOARD_SEPOLICY_DIRS := \
       $(DEVICE_PATH)/sepolicy

#HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/hidl/manifest.xml
#DEVICE_MATRIX_FILE := $(DEVICE_PATH)/hidl/compatibility_matrix.xml

#allow missing dependencies
ALLOW_MISSING_DEPENDENCIES ?= true

# force_Symbols
LINKER_FORCED_SHIM_LIBS := /system/lib/libcam_utils.so|libshim_atomic.so
LINKER_FORCED_SHIM_LIBS += /system/lib/librilmtk.so|libshim_ril.so

# Thermal
#USE_DEVICE_SPECIFIC_THERMAL := true

# Use old sepolicy version
#POLICYVERS := 30

# parse all SELINUX NEVERALLOWS
#SELINUX_IGNORE_NEVERALLOWS := true

# Build a separate vendor.img { to be enabled when OS be stable }
#TARGET_COPY_OUT_VENDOR := vendor

# off PGO
#ANDROID_PGO_NO_PROFILE_USE := false

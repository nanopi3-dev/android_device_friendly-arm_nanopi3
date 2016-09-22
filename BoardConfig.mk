#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PLATFORM_PATH := device/friendly-arm/nanopi3

TARGET_BOARD_INFO_FILE := $(PLATFORM_PATH)/board-info.txt

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := nanopi3

# Platform
TARGET_BOARD_PLATFORM  := slsiap

# Architecture
TARGET_ARCH     := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP  := true
TARGET_CPU_VARIANT  := cortex-a9
ARCH_ARM_HAVE_TLS_REGISTER := true

# chip variation
TARGET_CPU_VARIANT2  := s5p6818

TARGET_NO_RECOVERY := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_IS_2ND := false

TARGET_PROVIDES_INIT_RC  := true

# U-Boot
BOARD_USES_UBOOT := true
TARGET_UBOOT_SOURCE := uboot/friendly-arm/s5p6818
TARGET_UBOOT_CONFIG := s5p6818_nanopi3_config
TARGET_UBOOT_CROSS_COMPILE_PREFIX := arm-eabi-

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(PLATFORM_PATH)/mkbootimg.mk
BOARD_KERNEL_CMDLINE := console=ttySAC0,115200n8 androidboot.console=ttySAC0 androidboot.serialno=0123456789abcdef androidboot.selinux=permissive initrd=0x49000000,0x100000 init=/init
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_IMAGE_NAME := uImage

TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/friendly-arm/s5p6818
TARGET_KERNEL_CONFIG := nanopi3_android_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-

# Recovery
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/recovery.fstab
TARGET_RELEASETOOLS_EXTENSIONS := $(PLATFORM_PATH)
# TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_nanopi3

# opengl
BOARD_EGL_CFG := $(PLATFORM_PATH)/egl.cfg

USE_OPENGL_RENDERER := true
IGN_EGL_BUFFERCOUNT := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO    := false
BOARD_USES_CARD_SPDIF    := false

# Bluetooth
BOARD_HAVE_BLUETOOTH     := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/bluetooth

# camera
BOARD_HAS_CAMERA := true
BOARD_CAMERA_BACK:= true

# v4l2
BOARD_USES_HDMI  := true
BOARD_USES_RESOL := true

# sensor
BOARD_HAS_SENSOR := false
BOARD_SENSOR_TYPE := general

# ffmpeg
EN_FFMPEG_EXTRACTOR := false
EN_FFMPEG_AUDIO_DEC := false

# Nexell Dual Audio
EN_DUAL_AUDIO := false

# wifi
BOARD_WIFI_VENDOR := ap6212

# Wi-Fi related defines
ifeq ($(BOARD_WIFI_VENDOR),ap6212)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcm43438a0.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcm43438a0_apsta.bin"
endif

# RIL
BOARD_HAS_RIL := false

# HWC
SLSIAP_HWC_VERSION := 2

# ART
ART_USE_HSPACE_COMPACT := true

# packaging for emmc, sd
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE     := 67108864   #  64MB
BOARD_BOOTIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672   #  22MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 790626304  # 754MB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2466250752 # 2.3GB
BOARD_CACHEIMAGE_PARTITION_SIZE    := 448790528  # 428MB
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_FLASH_BLOCK_SIZE := 4096

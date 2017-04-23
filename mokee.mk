#
# Copyright 2013 The Android Open-Source Project
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

include device/friendly-arm/nanopi3/BoardConfig.mk

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit device configuration
$(call inherit-product, device/friendly-arm/nanopi3/device.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/mk/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := mk_nanopi3
PRODUCT_DEVICE := nanopi3
PRODUCT_BRAND := FriendlyARM
PRODUCT_MODEL := NanoPi 3
PRODUCT_MANUFACTURER := FriendlyARM

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_PRODUCT=NanoPi3 \
    TARGET_DEVICE=NanoPi3

# AAPT
PRODUCT_AAPT_CONFIG := normal large xlarge hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_CHARACTERISTICS := tablet

# Resolution of boot animation
TARGET_SCREEN_WIDTH := 405
TARGET_SCREEN_HEIGHT := 720

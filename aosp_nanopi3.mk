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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit device configuration
$(call inherit-product, device/friendly-arm/nanopi3/device.mk)

PRODUCT_NAME := aosp_nanopi3
PRODUCT_DEVICE := nanopi3
PRODUCT_MANUFACTURER := FriendlyARM
PRODUCT_BRAND := FriendlyARM
PRODUCT_MODEL := NanoPi 3

PRODUCT_GMS_CLIENTID_BASE := android-friendlyarm

TARGET_VENDOR_PRODUCT_NAME := NanoPi3
TARGET_VENDOR_DEVICE_NAME := NanoPi3

PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=NanoPi3 PRODUCT_NAME=NanoPi3

TARGET_VENDOR := FriendlyARM

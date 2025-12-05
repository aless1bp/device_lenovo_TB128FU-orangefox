#
# Copyright (C) 2019 The Android Open Source Project
# Copyright (C) 2019 The TWRP Open Source Project
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
#

# setup environment for minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from device.mk
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit some common OrangeFox stuff
$(call inherit-product, vendor/recovery/config/common.mk)

# Release name
PRODUCT_RELEASE_NAME := TB128FU

# Device identifier. This must come after all inclusions
PRODUCT_NAME := fox_$(PRODUCT_RELEASE_NAME)
PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Lenovo TB128FU
PRODUCT_MANUFACTURER := LENOVO

# Additional device identifiers for OTA compatibility
TARGET_OTA_ASSERT_DEVICE := TB128FU,qssi

# OrangeFox settings
OF_HIDE_NOTCH := 1
OF_USE_GREEN_LED := 0
OF_FLASHLIGHT_ENABLE := 0
OF_ALLOW_DISABLE_NAVBAR := 0

OF_AB_DEVICE_WITH_RECOVERY_PARTITION := 1
FOX_VIRTUAL_AB_DEVICE := 1

# Maximum permissible splash image size (in kilobytes); do *NOT* increase
OF_SPLASH_MAX_SIZE := 130

# Custom pic for maintainer about section info
OF_MAINTAINER := aless1bp

# OrangeFox GUI settings
OF_SCREEN_H := 2000
OF_STATUS_H := 100
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_CLOCK_POS := 1
OF_OPTIONS_LIST_NUM := 6


#
# Copyright 2015 The Android Open Source Project
# Copyright 2017 Modified by Jakdillard
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the long list of APNs
PRODUCT_COPY_FILES := device/lge/bullhead/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_NAME := aosp_bullhead
PRODUCT_DEVICE := bullhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5X
PRODUCT_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := true

PRODUCT_COPY_FILES += device/lge/bullhead/fstab.aosp_bullhead:root/fstab.bullhead

$(call inherit-product, device/lge/bullhead/device.mk)
$(call inherit-product-if-exists, vendor/lge/bullhead/bullhead-vendor.mk)

PRODUCT_PACKAGES += \
    Launcher3

# AOSP MODIFICATIONS
# Include Clean configuration
$(call inherit-product-if-exists, vendor/jakdillard/config/config.mk)

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
PRODUCT_NAME=bullhead \
BUILD_FINGERPRINT=google/bullhead/bullhead:7.1.1/N4F26I/3532671:user/release-keys \
PRIVATE_BUILD_DESC="bullhead-user 7.1.1 N4F26I 3532671 release-keys"

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver \
    CarrierConfig

# Additional Props

# facelock properties
PRODUCT_PROPERTY_OVERRIDES += \
ro.facelock.black_timeout=700 \
ro.facelock.det_timeout=2500 \
ro.facelock.rec_timeout=3500 \
ro.facelock.est_max_time=600

# Mobile Data provision prop
PRODUCT_PROPERTY_OVERRIDES += \
ro.com.android.prov_mobiledata=false

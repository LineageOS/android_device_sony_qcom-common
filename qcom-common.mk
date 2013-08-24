# Copyright (C) 2013 The CyanogenMod Project
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

COMMON_PATH := device/sony/qcom-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml

# Camera wrapper
PRODUCT_PACKAGES += \
    camera.qcom

# Omx
PRODUCT_PACKAGES += \
    libc2dcolorconvert

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# Qualcomm random numbers generated
PRODUCT_PACKAGES += qrngd

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    debug.composition.type=dyn \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Include non-opensource parts
$(call inherit-product, vendor/sony/qcom-common/qcom-common-vendor.mk)

# qcom common
$(call inherit-product, device/qcom/qcom-common/qcom-common.mk)

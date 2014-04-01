$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
$(call inherit-product-if-exists, vendor/lge/e400/e400-vendor.mk)
$(call inherit-product, $(LOCAL_PATH)/mdpi-dalvik.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/e400/overlay

PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

# Test: Enable Low Ram Device flag
# This is new feature in KitKat, so why We not use it for L3? ;-)
PRODUCT_PROPERTY_OVERRIDES += ro.config.low_ram=true

# Test: Disable JIT
# JIT costs somewhere between 3M and 6M across a typical running system.
#  For the really low-memory devices (like L3 is), JIT be disabled entirely.
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.jit.codecachesize=0

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/ramdisk/init.e0.rc:root/init.e0.rc \
    $(LOCAL_PATH)/ramdisk/init.recovery.e0.rc:root/init.recovery.e0.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.e0.rc:root/ueventd.e0.rc \
    $(LOCAL_PATH)/ramdisk/init.e0.usb.rc:root/init.e0.usb.rc \
    $(LOCAL_PATH)/system.prop:root/system.prop \
    $(LOCAL_PATH)/twrp/twrp.fstab:root/etc/twrp.fstab 
#   $(LOCAL_PATH)/fstab.e0:root/fstab.e0
#   $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/configs/e0_keypad.kl:system/usr/keylayout/e0_keypad.kl \
    $(LOCAL_PATH)/configs/touch_mcs8000.idc:system/usr/idc/touch_mcs8000.idc \
    $(LOCAL_PATH)/configs/touch_mcs8000.kl:system/usr/keylayout/touch_mcs8000.idc \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/configs/AudioFilter.csv:system/etc/AudioFilter.csv


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/rmt_storage:system/bin/rmt_storage

$(call inherit-product, build/target/product/full.mk)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

PRODUCT_PACKAGES += \
    lgapversion

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/wlan.ko:system/lib/modules/wlan.ko \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
# BT
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# HW HALS
PRODUCT_PACKAGES += \
    libgenlock \
    liboverlay \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a \
    copybit.msm7x27a \
    camera.e400 \
    gps.e400 \
    audio.a2dp.default \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    charger \
    charger_res_images

# OMX 
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

# Common properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    com.qc.hardware=true \
    persist.sys.use_dithering=1 \
    wifi.interface=wlan0 \
    rild.libpath=/system/lib/libril-qc-1.so \
    ro.telephony.ril_class=LGEQualcommUiccRIL \
    ro.telephony.default_network=0 \
    persist.sys.usb.config=mtp,adb \
    hwui.render_dirty_regions=true \
    ro.max.fling_velocity=4000 \
    sys.mem.max_hidden_apps=3

# Enable Torch
PRODUCT_PACKAGES += Torch

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := lge
PRODUCT_NAME := full_e400
PRODUCT_DEVICE := e400
PRODUCT_MODEL := LG-E400

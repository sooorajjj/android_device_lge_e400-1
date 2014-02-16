USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/lge/e400/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_SMP := true
TARGET_BOOTLOADER_BOARD_NAME := e400
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_SPARROW_BIONIC_OPTIMIZATION := true
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a5
TARGET_BOOTLOADER_BOARD_NAME := e400

BOARD_KERNEL_CMDLINE := androidboot.hardware=e0 lge.signed_image=false

BOARD_KERNEL_BASE := 0x00200000
BOARD_BOARD_MKBOOTIMG_ARGS := 0x01300000
BOARD_KERNEL_PAGESIZE := 4096

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 392167424
BOARD_USERDATAIMAGE_PARTITION_SIZE := 164626432
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_KERNEL_CONFIG := cyanogen11_e0_defconfig

BOARD_USE_CUSTOM_RECOVERY_FONT := '"font_7x16.h"'

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := e400
QCOM_BSP := false

TARGET_USERIMAGES_USE_EXT4 := true

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_ROTATOR_KERNEL_FORMATS

TARGET_KERNEL_SOURCE := device/lge/e400/kernel
TARGET_SPECIFIC_HEADER_PATH := device/lge/e400/include

USE_OPENGL_RENDERER := true

# QCOM stuffs
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_OVERLAY := false
TARGET_HAVE_BYPASS  := false
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_GENLOCK := true
TARGET_QCOM_HDMI_OUT := false
TARGET_FORCE_CPU_UPLOAD := true
BOARD_USES_QCOM_LIBS := true
BOARD_USE_QCOM_PMEM := true
TARGET_GRALLOC_USES_ASHMEM := true
TARGET_USES_ION:=true

USE_OPENGL_RENDERER := true
## Camera
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
BOARD_CAMERA_NO_UNWANTED_MSG := true
TARGET_CAMERA_SENSOR_MP_SIZE := 3
TARGET_PREBUILT_LIBCAMERA := false
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# QCOM stuffs
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_OVERLAY := false
TARGET_HAVE_BYPASS  := false
TARGET_USES_GENLOCK := true
TARGET_QCOM_HDMI_OUT := false
TARGET_FORCE_CPU_UPLOAD := true
BOARD_USES_QCOM_LIBS := true
TARGET_USES_ION:=true
BOARD_EGL_CFG := device/lge/e400/egl.cfg
BOARD_HAVE_BLUETOOTH := true

# to enable the GPS HAL
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := e400
# AMSS version to use for GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000


BOARD_WLAN_DEVICE := wext
WIFI_EXT_MODULE_PATH := /system/lib/modules/librasdioif.ko
WIFI_DRIVER_MODULE_PATH := /system/lib/modules/wlan.ko
WIFI_EXT_MODULE_NAME := librasdioif
WIFI_DRIVER_MODULE_NAME := wlan
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WEXT_NO_COMBO_SCAN := true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_PARAM := "/data/misc/wifi/fwpath"

BOARD_VOLD_MAX_PARTITIONS := 22

## Mass Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun/file

## Browser & WebKit
ENABLE_WEBGL := true

## TEMPORARY HACK: skip building external/chromium_org/
#PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

#recovery resolution fix
DEVICE_RESOLUTION := 240x320
HAVE_SELINUX := true

## ATV
ifeq ($(PRODUCT_IS_ATV),true)
PRODUCT_PACKAGES += \
    DocumentsUI \
    LeanbackIME
endif

## ConsoleLauncher
PRODUCT_PACKAGES += \
    ConsoleLauncher

## GMS
ifeq ($(WITH_GMS), true)
ifeq ($(PRODUCT_IS_ATV),true)
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
$(call inherit-product-if-exists, vendor/gapps_tv/arm64/arm64-vendor.mk)
else
$(call inherit-product-if-exists, vendor/gapps_tv/arm/arm-vendor.mk)
endif # TARGET_SUPPORTS_64_BIT_APPS
else
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)
else
$(call inherit-product-if-exists, vendor/gapps/arm/arm-vendor.mk)
endif # TARGET_SUPPORTS_64_BIT_APPS
endif # PRODUCT_IS_ATV
endif # WITH_GMS

## ih8sn
$(call inherit-product, external/ih8sn/product.mk)

## Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/switchroot/overlay-tab

## Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.vendor.recovery_update=true

## Signing
ifeq ($(EXPERIMENTAL_BUILD),true)
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey
endif

## Soong
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

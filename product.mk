## ATV
ifeq ($(PRODUCT_IS_ATV),true)
PRODUCT_PACKAGES += \
    DocumentsUI
endif

## ConsoleLauncher
PRODUCT_PACKAGES += \
    ConsoleLauncher

## ih8sn
PRODUCT_PACKAGES += ih8sn
PRODUCT_COPY_FILES += \
    vendor/switchroot/configs/ih8sn/ih8sn_generic.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/ih8sn.conf

## Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/switchroot/overlay-tab

## Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.vendor.recovery_update=true

## Updater
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += lineage.updater.uri=https://ota.switchroot.org/api/v1/{device}/{type}/{incr}

## Signing
ifeq ($(EXPERIMENTAL_BUILD),true)
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey
endif

## Soong
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

## System Artifacts
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/ih8sn \
    system/etc/ih8sn.conf \
    system/etc/init/ih8sn.rc

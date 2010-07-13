LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifneq (, $(filter msm7201a_ffa msm7201a_surf msm7627_ffa msm7627_surf msm7627_7x_ffa msm7627_7x_surf qsd8250_ffa qsd8250_surf qsd8650a_st1x, $(TARGET_PRODUCT)))
LOCAL_SRC_FILES := \
    stagefright_surface_output_msm72xx.cpp \
    QComHardwareRenderer.cpp
endif

ifneq (, $(filter msm7630_surf, $(TARGET_PRODUCT)))
LOCAL_SRC_FILES := \
    stagefright_surface_output_msm7x30.cpp \
    QComHardwareOverlayRenderer.cpp
endif

LOCAL_CFLAGS := $(PV_CFLAGS_MINUS_VISIBILITY)

LOCAL_C_INCLUDES:= \
        $(TOP)/external/opencore/extern_libs_v2/khronos/openmax/include

LOCAL_SHARED_LIBRARIES :=       \
        libbinder               \
        libutils                \
        libcutils               \
        libui                   \
        libsurfaceflinger_client \
        libhardware             \

LOCAL_MODULE := libstagefrighthw

LOCAL_PRELINK_MODULE:= false

include $(BUILD_SHARED_LIBRARY)


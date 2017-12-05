LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE:= false

# This variable determines the OpenGL ES API version to use:
# If set to true, OpenGL ES 1.1 is used, otherwise OpenGL ES 2.0.

USE_OPENGL_ES_1_1 := false

# Set OpenGL ES version-specific settings.

ifeq ($(USE_OPENGL_ES_1_1), true)
    OPENGLES_LIB  := -lGLESv1_CM
	OPENGLES_DEF  := -DUSE_OPENGL_ES_1_1
else
    OPENGLES_LIB  := -lGLESv2
	OPENGLES_DEF  := -DUSE_OPENGL_ES_2_0
endif

# An optional set of compiler flags that will be passed when building
# C ***AND*** C++ source files.
#
# NOTE: flag "-Wno-write-strings" removes warning about deprecated conversion
#       from string constant to 'char*'

LOCAL_CFLAGS := -Wno-write-strings $(OPENGLES_DEF)

# The list of additional linker flags to be used when building your
# module. This is useful to pass the name of specific system libraries
# with the "-l" prefix.

LOCAL_LDLIBS := \
     -llog $(OPENGLES_LIB) -lfastcv

LOCAL_MODULE    := libfastcvUtils
LOCAL_CFLAGS    := -Werror
LOCAL_SRC_FILES := \
	FPSCounter.cpp \
	CameraRendererRGB565GL2.cpp \
	CameraUtil.cpp \
	FastCVSampleRenderer.cpp \
	FastCVUtil.cpp

LOCAL_STATIC_LIBRARIES := libfastcv
LOCAL_SHARED_LIBRARIES := liblog libGLESv2
LOCAL_C_INCLUDES += $(JNI_DIR)/fastcv
LOCAL_C_INCLUDES += $(UTILS_DIR)
#LOCAL_C_INCLUDES += $(JNI_DIR)

include $(BUILD_STATIC_LIBRARY)


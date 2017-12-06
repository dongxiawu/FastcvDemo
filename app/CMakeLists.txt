#指定 cmake 的最小版本，确保能使用某些新特性构建项目
cmake_minimum_required(VERSION 3.4.1)

# 输出详细信息
set(CMAKE_VERBOSE_MAKEFILE on)

# 设置头文件目录
set(INCLUDE_DIR "${CMAKE_SOURCE_DIR}/src/main/cpp/include")
# 设置源文件目录
set(SOURCE_DIR "${CMAKE_SOURCE_DIR}/src/main/cpp/source")
# 设置库目录
set(LIBRARY_DIR "${CMAKE_SOURCE_DIR}/src/main/jniLibs")

# 包含头文件
include_directories(${INCLUDE_DIR})

# 添加 fastcv 静态库
add_library(fastcv-lib STATIC IMPORTED)
set_target_properties( fastcv-lib
                       PROPERTIES IMPORTED_LOCATION
                       "${LIBRARY_DIR}/libfastcv.a"
                      )

# 添加 log 库
find_library( # Sets the name of the path variable.
                log-lib

              # Specifies the name of the NDK library that
              # you want CMake to locate.
              log )

find_path(GLES2_INCLUDE_DIR GLES2/gl2.h
    HINTS ${ANDROID_NDK})
include_directories(${GLES2_INCLUDE_DIR})

find_library(GLES2_LIBRARY libGLESv2.so
    HINTS ${GLES2_INCLUDE_DIR}/../lib)

#包含子目录
add_subdirectory(${SOURCE_DIR})

#指定 cmake 的最小版本，确保能使用某些新特性构建项目
cmake_minimum_required(VERSION 3.4.1)

# 输出详细信息
set(CMAKE_VERBOSE_MAKEFILE on)


add_library(fastcv STATIC src/main/jni/libfastcv.a)
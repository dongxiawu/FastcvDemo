# aux_source_directory(. SOURCE_DIR)

include_directories(${INCLUDE_DIR}/utils)

add_library( # Specifies the name of the library.
             fastcvUtils

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
             # ${SOURCE_DIR}
             FPSCounter.cpp
             CameraRendererRGB565GL2.cpp
             CameraUtil.cpp
             FastCVSampleRenderer.cpp
             FastCVUtil.cpp
           )

target_link_libraries( # Specifies the target library.
                       fastcvUtils

                       fastcv-lib
                       ${log-lib}
                       ${GLES2_LIBRARY}
                     )

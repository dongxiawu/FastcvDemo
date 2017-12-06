# aux_source_directory(. SOURCE_DIR)

include_directories(${INCLUDE_DIR}/apis/imageTransformation)

add_library( # Specifies the name of the library.
             fastcvImgTransform

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
             # ${SOURCE_DIR}
             Affine.cpp
             Rotate.cpp
             Scale.cpp
             ScaleDownMN.cpp
             Warp.cpp
             ../About.cpp
           )

target_link_libraries( # Specifies the target library.
                       fastcvImgTransform

                       fastcv-lib
                       ${log-lib}
                       ${GLES2_LIBRARY}
                       fastcvUtils
                     )

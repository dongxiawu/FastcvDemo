# aux_source_directory(. SOURCE_DIR)

include_directories(${INCLUDE_DIR}/apis/featureDetection)

add_library( # Specifies the name of the library.
             fastcvFeatDetect

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
             # ${SOURCE_DIR}
             Corner.cpp
             ../About.cpp
           )

target_link_libraries( # Specifies the target library.
                       fastcvFeatDetect

                       fastcv-lib
                       ${log-lib}
                       ${GLES2_LIBRARY}
                       fastcvUtils
                     )

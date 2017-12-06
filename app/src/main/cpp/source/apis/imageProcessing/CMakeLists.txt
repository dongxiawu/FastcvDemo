# aux_source_directory(. SOURCE_DIR)

include_directories(${INCLUDE_DIR}/apis/imageProcessing)

add_library( # Specifies the name of the library.
             fastcvImgProc

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
             # ${SOURCE_DIR}
             Filter.cpp
             FilterCorr.cpp
             ImageGradient.cpp
             ImgDiff.cpp
             ../About.cpp
           )

target_link_libraries( # Specifies the target library.
                       fastcvImgProc

                       fastcv-lib
                       ${log-lib}
                       ${GLES2_LIBRARY}
                       fastcvUtils
                     )

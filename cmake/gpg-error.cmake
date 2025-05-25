cmake_minimum_required(VERSION 3.10)
set(GPG_ERROR_PLATFORM_BUILD_AND_HOST
        "--build=${CMAKE_HOST_SYSTEM_PROCESSOR}"
        "--host=aarch64-linux"
        "--target=${CMAKE_C_COMPILER_TARGET}"
)
ExternalProject_Add(ep_gpg_error
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}
        SOURCE_SUBDIR "src/gpg-error"
        INSTALL_DIR ${CMAKE_BINARY_DIR}
        CONFIGURE_COMMAND
            ${CMAKE_COMMAND} -E env ${PLATFORM_CONFIGURE_ENV}
            <SOURCE_DIR>/<SOURCE_SUBDIR>/configure --host=aarch64-linux -prefix=<INSTALL_DIR> --enable-static --disable-shared --disable-nls
        BUILD_COMMAND make 
        INSTALL_COMMAND make install
)
include_directories(${CMAKE_BINARY_DIR}/include)
link_directories(${CMAKE_BINARY_DIR}/lib)
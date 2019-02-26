cmake_minimum_required(VERSION 2.8)

project(LaTeX4Ei NONE)
include(UseLATEX)

add_subdirectory(doc)
add_subdirectory(template-files)

add_custom_target(
    writegitid ALL
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/write-gitid.sh
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)

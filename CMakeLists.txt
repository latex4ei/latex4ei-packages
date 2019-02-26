cmake_minimum_required(VERSION 2.8)

project(LaTeX4Ei NONE)
include(UseLATEX)

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/template-files/latex4ei
    DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
)

add_custom_target(
    writegitid ALL
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/write-gitid.sh
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)

add_latex_document(
    template-files/cheatsheet_template.tex
    FORCE_PDF
    IMAGE_DIRS template-files/img
    DEPENDS writegitid
)

add_latex_document(
    template-files/cheatsheet_example.tex
    FORCE_PDF
    IMAGE_DIRS template-files/img
    DEPENDS writegitid
)

add_latex_document(
    template-files/report_example.tex
    FORCE_PDF
    IMAGE_DIRS template-files/img
    DEPENDS writegitid
)

add_latex_document(
    doc/LaTeX4EI-Template-Documentation.tex
    FORCE_PDF
    IMAGE_DIRS template-files/img
    DEPENDS writegitid
)

add_latex_document(
    doc/Scientific-Package-Documentation.tex
    FORCE_PDF
    IMAGE_DIRS template-files/img
    DEPENDS writegitid
)

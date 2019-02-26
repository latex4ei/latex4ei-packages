file(COPY ${PROJECT_SOURCE_DIR}/template-files/latex4ei
    DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
)

add_latex_document(
    LaTeX4EI-Template-Documentation.tex
    FORCE_PDF
    IMAGE_DIRS img
    DEPENDS writegitid
)

add_latex_document(
    Scientific-Package-Documentation.tex
    FORCE_PDF
    IMAGE_DIRS img
    DEPENDS writegitid
)

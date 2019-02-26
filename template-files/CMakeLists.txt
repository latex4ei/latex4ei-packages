file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/latex4ei
    DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
)

add_latex_document(
    cheatsheet_template.tex
    FORCE_PDF
    IMAGE_DIRS img
    DEPENDS writegitid
)

add_latex_document(
    cheatsheet_example.tex
    FORCE_PDF
    IMAGE_DIRS img
    DEPENDS writegitid
)

add_latex_document(
    report_example.tex
    FORCE_PDF
    IMAGE_DIRS img
    DEPENDS writegitid
)

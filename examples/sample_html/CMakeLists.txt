file (GLOB_RECURSE LATEX_SAMPLE_SRC *.cpp *.cxx *.cc *.C *.c *.h *.hpp)
set (LATEX_SAMPLE_BIN latexpp_html_sample)
set (CALIB_LIBS ${PROJECT_NAME})

set(Boost_USE_STATIC_LIBS OFF)
set(Boost_USE_MULTITHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)
#
# External Packages
#

find_package(Boost REQUIRED COMPONENTS program_options filesystem system)
find_package(V8 REQUIRED)
find_package(WKHTMLTOX REQUIRED)

include_directories(${Boost_INCLUDE_DIRS})

# configure the executable
link_directories(${MAINFOLDER}/lib)
add_executable(${LATEX_SAMPLE_BIN} ${LATEX_SAMPLE_SRC})
target_link_libraries(${LATEX_SAMPLE_BIN} ${CALIB_LIBS})
target_link_libraries(${LATEX_SAMPLE_BIN} ${Boost_PROGRAM_OPTIONS_LIBRARY})
target_link_libraries(${LATEX_SAMPLE_BIN} ${Boost_FILESYSTEM_LIBRARY})
target_link_libraries(${LATEX_SAMPLE_BIN} ${Boost_SYSTEM_LIBRARY})
target_link_libraries(${LATEX_SAMPLE_BIN} ${V8_LIBS})
target_link_libraries(${LATEX_SAMPLE_BIN} ${WKHTMLTOX_LIBS})

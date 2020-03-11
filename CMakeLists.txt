# Guillermo Garcia Bunster. Copyright (C) 2020. GPLv3


#
# Project Properties
#
cmake_minimum_required (VERSION 2.8)
project (latexpp)
set (APPLICATION_NAME "latexpp")
set (APPLICATION_CODENAME "${PROJECT_NAME}")
set (APPLICATION_COPYRIGHT_YEARS "2020")
set (APPLICATION_VERSION_MAJOR 0)
set (APPLICATION_VERSION_MINOR 1)
set (APPLICATION_VERSION_PATCH 0)
set (APPLICATION_VERSION_TYPE SNAPSHOT)
set (APPLICATION_VERSION_STRING "${APPLICATION_VERSION_MAJOR}.${APPLICATION_VERSION_MINOR}.${APPLICATION_VERSION_PATCH}-${APPLICATION_VERSION_TYPE}")
set (APPLICATION_VENDOR_ID "TISA")
set (APPLICATION_VENDOR_NAME "Tecnologia Integral S.A.")
set (APPLICATION_VENDOR_URL "tecintegral.cl")
set (APPLICATION_ID "${APPLICATION_VENDOR_ID}.${PROJECT_NAME}")

#
# Debugging Options
#
set (CMAKE_VERBOSE_MAKEFILE 0) # Use 1 for debugging, 0 for release

if (NOT CMAKE_BUILD_TYPE)
    set (CMAKE_BUILD_TYPE Debug)
    # set (CMAKE_BUILD_TYPE Release)
endif()

#
# Project Output Paths
#
set (MAINFOLDER ${PROJECT_SOURCE_DIR})
set (EXECUTABLE_OUTPUT_PATH "${MAINFOLDER}/bin")
set (LIBRARY_OUTPUT_PATH "${MAINFOLDER}/lib")
set (CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -Wall")


add_definitions(-DRSRC_PATH="${RESOURCES_PATH}")
#
# Project Search Paths
#
list (APPEND CMAKE_PREFIX_PATH "${MAINFOLDER}")
include_directories("${MAINFOLDER}/include")

#
# Add Build Targets
#
add_subdirectory(src)

# TODO: Add CMakeList.txt to examples
# add_subdirectory(examples/sample)
# add_subdirectory(examples/image)
# add_subdirectory(examples/style)
# add_subdirectory(examples/html)

#
# Add Install Targets
#
if (EXISTS "${MAINFOLDER}/include/${PROJECT_NAME}" AND IS_DIRECTORY "${MAINFOLDER}/include/${PROJECT_NAME}")
    install(DIRECTORY "${MAINFOLDER}/include/${PROJECT_NAME}" DESTINATION "include")
endif (EXISTS "${MAINFOLDER}/include/${PROJECT_NAME}" AND IS_DIRECTORY "${MAINFOLDER}/include/${PROJECT_NAME}")

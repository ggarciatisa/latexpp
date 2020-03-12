# - Find WKHTMLTOX
#
#  WKHTMLTOX_INCLUDE - Where to find pdf.h
#  WKHTMLTOX_LIBS    - List of libraries when using WKHTMLTOX.
#  WKHTMLTOX_FOUND   - True if WKHTMLTOX found.

get_filename_component(module_file_path ${CMAKE_CURRENT_LIST_FILE} PATH)

# Look for the header file.
find_path(WKHTMLTOX_INCLUDE NAMES pdf.h image.h PATHS $ENV{WKHTMLTOX_ROOT}/include /opt/local/include/wkhtmltox /usr/local/include/wkhtmltox /usr/include/wkhtmltox DOC "Path in which the file pdf.h is located." )
mark_as_advanced(WKHTMLTOX_INCLUDE)

# Look for the library.
# Does this work on UNIX systems? (LINUX)
find_library(WKHTMLTOX_LIBS NAMES wkhtmltox PATHS /usr/lib /usr/lib64 $ENV{WKHTMLTOX_ROOT}/lib DOC "Path to wkhtmltox library." )
mark_as_advanced(WKHTMLTOX_LIBS)

# Copy the results to the output variables.
if (WKHTMLTOX_INCLUDE AND WKHTMLTOX_LIBS)
  message(STATUS "Found wkhtmltox in ${WKHTMLTOX_INCLUDE} ${WKHTMLTOX_LIBS}")
  set(WKHTMLTOX_FOUND 1)
  include(CheckCXXSourceCompiles)
  set(CMAKE_REQUIRED_LIBRARIES ${WKHTMLTOX_LIBS} pthread)
  set(CMAKE_REQUIRED_INCLUDES ${WKHTMLTOX_INCLUDE})

 else ()
   set(WKHTMLTOX_FOUND 0)
 endif ()

 # Report the results.
 if (NOT WKHTMLTOX_FOUND)
   set(WKHTMLTOX_DIR_MESSAGE "WKHTMLTOX was not found. Make sure WKHTMLTOX_LIBS and WKHTMLTOX_INCLUDE are set.")
   if (WKHTMLTOX_FIND_REQUIRED)
     message(FATAL_ERROR "${WKHTMLTOX_DIR_MESSAGE}")
   elseif (NOT WKHTMLTOX_FIND_QUIETLY)
     message(STATUS "${WKHTMLTOX_DIR_MESSAGE}")
   endif ()
 endif ()

cmake_minimum_required(VERSION 3.10)
project(TaskEngine)

# If ../XmlConfig is a CMake project that defines a target named XmlConfig:
# add_subdirectory(${CMAKE_SOURCE_DIR}/../XmlConfig ${CMAKE_BINARY_DIR}/XmlConfig_build)

add_library(TaskEngine SHARED TaskEngine.cpp TaskFactory.cpp)

target_compile_options(TaskEngine PRIVATE "-m32")
target_link_libraries(TaskEngine PRIVATE "-m32")

# find_library(XMLCONFIG_LIB
#     NAMES XMLConfig
#     HINTS ${CMAKE_SOURCE_DIR}/../XmlConfig/build ${CMAKE_SOURCE_DIR}/XmlConfig/build
#     NO_DEFAULT_PATH
# )
# message(STATUS "Found XmlConfig: ${XMLCONFIG_LIB}")
# target_link_libraries(TaskEngine PRIVATE ${XMLCONFIG_LIB})

target_include_directories(TaskEngine PRIVATE
  ${CMAKE_SOURCE_DIR}/XmlConfig
  ${CMAKE_SOURCE_DIR}/
)
set_property(TARGET TaskEngine PROPERTY CXX_STANDARD 11)
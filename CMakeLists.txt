cmake_minimum_required(VERSION 3.10)

project(TaskEngine)

add_library(TaskEngine SHARED TaskEngine.cpp TaskFactory.cpp )

target_link_libraries(TaskEngine PRIVATE ${CMAKE_SOURCE_DIR}/../XmlConfig/build/libXmlConfig.dylib)
target_include_directories(TaskEngine PRIVATE ${CMAKE_SOURCE_DIR}/../XmlConfig)
target_include_directories(TaskEngine PRIVATE ${CMAKE_SOURCE_DIR}/../)

set_property(TARGET TaskEngine PROPERTY CXX_STANDARD 11)

file( GLOB all_headers "*.h")
install(TARGETS TaskEngine DESTINATION lib)
install(FILES ${all_headers} DESTINATION include/TaskEngine)

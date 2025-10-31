# Sources: list explicitly (recommended) or use a glob if you prefer
file( GLOB XMLCONFIG_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")
file( GLOB XMLCONFIG_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/*.h" )


# OBJECT library (used to compose the combined lib)
add_library(TaskEngine_obj OBJECT ${XMLCONFIG_SOURCES} ${XMLCONFIG_HEADERS})
target_include_directories(TaskEngine_obj PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/ ${CMAKE_SOURCE_DIR}/ )
target_link_libraries(TaskEngine_obj PUBLIC XmlConfig)

# Actual library for this component
if(BUILD_SHARED_LIBS)
  add_library(TaskEngine SHARED $<TARGET_OBJECTS:TaskEngine_obj>)
else()
  add_library(TaskEngine STATIC $<TARGET_OBJECTS:TaskEngine_obj>)
endif()
target_include_directories(TaskEngine PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/ ${CMAKE_SOURCE_DIR}/)
target_link_libraries(TaskEngine PUBLIC XmlConfig)

cmake_minimum_required(VERSION 3.6)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

project(arm-semihosting)

add_library(arm-semihosting STATIC)
target_include_directories(arm-semihosting PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/inc
)
target_compile_definitions(arm-semihosting PUBLIC
    ARM_SEMIHOSTING_COMPILE_DEFINITIONS
)
target_link_libraries(arm-semihosting PUBLIC
    m
)
target_sources(arm-semihosting PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src/monitor_handles.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/fcvtf.c
)

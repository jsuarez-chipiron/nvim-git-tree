cmake_minimum_required(VERSION 3.1)

project(CHANGEME)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++20")

add_executable(main main.cpp)
# target_link_libraries(main -ltimer)
# target_link_libraries(main /usr/local/lib/libtimer.a) 

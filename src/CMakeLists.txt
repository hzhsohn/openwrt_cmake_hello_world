cmake_minimum_required(VERSION 2.6)
PROJECT(hello_world)

SET(SOURCES	hello_world.cpp)

ADD_EXECUTABLE(hello_world ${SOURCES})

INSTALL(TARGETS hello_world RUNTIME DESTINATION bin)

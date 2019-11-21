
message(^^^^^^  开始编译咯...  ^^^^^^^)

#设置工程名称
PROJECT(xmap-webui)

#设置CMAKE最小版本
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

message(^^^^^^  设置头文件目录  ^^^^^^^)
INCLUDE_DIRECTORIES(
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}/src
	${CMAKE_CURRENT_SOURCE_DIR}/lib
)

message(^^^^^^  链接库搜索路径  ^^^^^^^)
LINK_DIRECTORIES(
${CMAKE_CURRENT_SOURCE_DIR}/lib
)

message(^^^^^^  添加子目录  ^^^^^^^)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src)


message(^^^^^^  添加要编译的可执行文件  ^^^^^^^)
ADD_EXECUTABLE(${PROJECT_NAME} 
  main.cpp
)

#编译选项
set(CMAKE_BUILD_TYPE "Release")
if( CMAKE_BUILD_TYPE STREQUAL "Debug" )
    set(ADD_DEFAULT "-g -Wall -Wno-unused-variable -pthread")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${ADD_DEFAULT}")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${ADD_DEFAULT} -std=c++11")

else( CMAKE_BUILD_TYPE STREQUAL "Debug" )  
    set(CMAKE_BUILD_TYPE "Release")
    set(ADD_DEFAULT "-O1 -pthread")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${ADD_DEFAULT}")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${ADD_DEFAULT} -std=c++11")

endif( CMAKE_BUILD_TYPE STREQUAL "Debug" )
message("Build Type:"${CMAKE_BUILD_TYPE} ${CMAKE_CXX_FLAGS})


#执行文件链接属性
TARGET_LINK_LIBRARIES(${PROJECT_NAME} 
	src #项目代码一定要放在最前面,不然会编译时找不到其它库
)

INSTALL(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin)

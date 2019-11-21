message(-> print_msg库)

#所有的路径变量都不允许重名
AUX_SOURCE_DIRECTORY(. TURLENCODE_SRC_LIST)
#设置成静态库
ADD_LIBRARY(print_msg ${TURLENCODE_SRC_LIST})
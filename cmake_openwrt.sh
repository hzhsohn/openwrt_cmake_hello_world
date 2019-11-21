#!/bin/sh
#by han.zhihong


workpath=$(cd $(dirname $0); pwd)

#判断文件夹是否存在 -d
OPENWRT_PATH="/home/hx-kong/openwrt"
if [ ! -d "$OPENWRT_PATH" ]; then
    echo "\"$OPENWRT_PATH\" 源码文件夹不存在,";
else
    echo "进入openwrt编译"

    if [ ! -d "$OPENWRT_PATH/package/hx-kong" ]; then
            echo "创建hx-kong目录";
            mkdir "$OPENWRT_PATH/package/hx-kong"
    fi;

    echo "删除openwrt-xmap-webui软件"
    rm -rf "$OPENWRT_PATH/package/hx-kong/openwrt-xmap-webui"
    
    echo "重新复制openwrt-xmap-webui软件"
    cp -r "./openwrt-xmap-webui" "$OPENWRT_PATH/package/hx-kong"
    
    cd "$OPENWRT_PATH"
    echo "进入openwrt固件编译选项" 
    make menuconfig
    
    read -p "是否编译生成IPK(y/n): " number
    if [ "$number" = "y" ]; then
       echo "编译openwrt固件";
       make V=99;
    fi;

    echo "回到工作目录 \"$workpath\"";
    cd $workpath
fi;

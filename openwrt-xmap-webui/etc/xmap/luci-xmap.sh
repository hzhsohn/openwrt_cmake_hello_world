#!/bin/sh

echo luci for luci-xmap
local vt_enabled=`uci get luci-xmap.@dtrs[0].enabled 2>/dev/null`
echo "vt_enabled=" $vt_enabled
if [ "$vt_enabled" = 1 ]; then
logger -t alex restarting xmap
 echo "restarting xmap"
/etc/init.d/xmap enable
/etc/init.d/xmap restart
else
logger -t alex stopping xmap
echo "stopping xmap"
/etc/init.d/xmap disable
/etc/init.d/xmap stop
fi

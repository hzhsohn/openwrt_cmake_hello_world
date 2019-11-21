#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=xmap-webui
PKG_VERSION:=1
PKG_BASE_NAME:=$(PKG_NAME)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_BASE_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/$(PKG_NAME)
  SECTION:=base
  CATEGORY:=hx-kong
  TITLE:= xmap web ui
  URL:=http://xmap.hx-kong.com/
  MAINTAINER:=hx-kong
  DEPENDS:=+libstdcpp +libpthread
  TARGET_LDFLAGS:= -lpthread
endef

define Package/$(PKG_NAME)/description
   Application for smart gateway device
endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)
	$(CP) ./etc/* $(PKG_BUILD_DIR)
	$(CP) ./usr/* $(PKG_BUILD_DIR)
endef


define Build/Clean
	rm -rf $(PKG_BUILD_DIR)
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/bin
	#
  #C++编译附加文件,SDK编译抽筋时用
	#$(CP) $(STAGING_DIR_HOST)/lib/libstdc++.so.6 $(1)/bin
	#$(CP) $(STAGING_DIR_HOST)/lib/libc.so.6 $(1)/bin
	#$(CP) $(STAGING_DIR_HOST)/lib/libm.so.6 $(1)/bin
	#
	#C++编译附加文件,源码编译抽筋时用
  #$(INSTALL_DATA) $(TOOLCHAIN_DIR)/lib/libstdc++.so.6 $(1)/usr/lib/libstdc++.so.6
  #$(INSTALL_DATA) $(TOOLCHAIN_DIR)/lib/libm.so $(1)/usr/lib/libm.so.6
  #$(INSTALL_DATA) $(TOOLCHAIN_DIR)/lib/libc.so $(1)/usr/lib/libc.so.6
	#
	#编译打包	
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/bin/$(PKG_NAME)
	
	#执行指令,装配配置文件,和开机启动
	$(INSTALL_DIR) $(1)/etc
	#mkdir -p $(1)/etc/config
	#mkdir -p $(1)/etc/xmap	
	$(CP) -r ./etc/* $(1)/etc	
	chmod 0755 $(1)/etc/xmap/*
		
	$(INSTALL_DIR) $(1)/usr
	mkdir -p $(1)/usr/lib
	mkdir -p $(1)/usr/lib/lua
	mkdir -p $(1)/usr/lib/lua/luci
	mkdir -p $(1)/usr/lib/lua/luci/controller
	
	mkdir -p $(1)/usr/lib/lua/luci/model
	mkdir -p $(1)/usr/lib/lua/luci/model/cbi
	mkdir -p $(1)/usr/lib/lua/luci/model/cbi/admin_xmap
	
	$(CP) -r ./usr/* $(1)/usr
	#$(CP) ./usr/lib/lua/luci/model/cbi/admin_xmap/luci-xmap.lua $(1)/usr/lib/lua/luci/model/cbi/admin_xmap/luci-xmap.lua
	#$(CP) ./usr/lib/lua/luci/model/cbi/admin_xmap/luci-xmap-collect.lua $(1)/usr/lib/lua/luci/model/cbi/admin_xmap/luci-xmap-collect.lua
	
endef

#无视C++编译成IPK的警告,编译抽筋时用
#define Package/$(PKG_NAME)/extra_provides
#    echo 'libstdc++.so.6'; \
#    echo 'libm.so.6'; \
#    echo 'libc.so.6';
#endef

$(eval $(call BuildPackage,$(PKG_NAME)))

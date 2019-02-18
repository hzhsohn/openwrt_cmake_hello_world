#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=hello_world
PKG_VERSION:=1
PKG_BASE_NAME:=$(PKG_NAME)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_BASE_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/$(PKG_NAME)
  SECTION:=base
  CATEGORY:=Utilities
  TITLE:= Smart gateway application
  URL:=http://www.hx-kong.com/
  MAINTAINER:=Utilities
  DEPENDS:=+libstdcpp
endef

define Package/$(PKG_NAME)/description
   Application for smart gateway device
endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)
endef


define Build/Clean
	rm -rf $(PKG_BUILD_DIR)
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/bin

	#C++编译附加文件,SDK编译时用
	#$(CP) $(STAGING_DIR_HOST)/lib/libstdc++.so.6 $(1)/bin
	#$(CP) $(STAGING_DIR_HOST)/lib/libc.so.6 $(1)/bin
	#$(CP) $(STAGING_DIR_HOST)/lib/libm.so.6 $(1)/bin
	
	#C++编译附加文件,源码编译时用
    #$(INSTALL_DATA) $(TOOLCHAIN_DIR)/lib/libstdc++.so.6 $(1)/usr/lib/libstdc++.so.6
    #$(INSTALL_DATA) $(TOOLCHAIN_DIR)/lib/libm.so $(1)/usr/lib/libm.so.6
    #$(INSTALL_DATA) $(TOOLCHAIN_DIR)/lib/libc.so $(1)/usr/lib/libc.so.6
	#
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/bin/$(PKG_NAME)
endef

#无视C++编译成IPK的警告
#define Package/$(PKG_NAME)/extra_provides
#    echo 'libstdc++.so.6'; \
#    echo 'libm.so.6'; \
#    echo 'libc.so.6';
#endef

$(eval $(call BuildPackage,$(PKG_NAME)))

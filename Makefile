#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_VENDOR:=upointech
PKG_NAME:=hello_world
PKG_VERSION:=1
PKG_BASE_NAME:=hello_world
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_BASE_NAME)-$(PKG_VERSION)



include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/$(PKG_NAME)
  SECTION:=base
  CATEGORY:=Upointech
  TITLE:= Smart gateway demo application
  URL:=http://www.upointech.com/
  MAINTAINER:=Upointech
  #DEPENDS:=glib2 libcapi libubox
endef

define Package/$(PKG_NAME)/description
  Demo Application for smart gateway device
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
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hello_world $(1)/bin/$(PKG_NAME)
endef

$(eval $(call BuildPackage,$(PKG_NAME)))

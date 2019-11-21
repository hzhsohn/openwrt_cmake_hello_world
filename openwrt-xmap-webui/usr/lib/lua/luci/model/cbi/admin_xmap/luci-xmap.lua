local fs = require "nixio.fs"


m=Map("luci-xmap",translate("中控管理"),translate("XMap 物联网中控系统, 参考文档 <a href=http://xmap.hx-kong.com/doc target=_blank>http://xmap.hx-kong.com/doc</a>"))
s=m:section(TypedSection,"dtrs","")
s.addremove=false
s.anonymous=true

  --中控系统是否启用
	xmap_enable = s:option(Flag,"enabled","XMap服务  " .. translate("Enable")," 设备UUID : "..nixio.fs.readfile("/root/secr/kit-uuid") or "")

	--中控名称
  dn_cfg = s:option(Value, "1", "中控名称")
	dn_cfg.rmempty = false
	dn_cfg.rows = 1
	
	function dn_cfg.cfgvalue()
		return nixio.fs.readfile("/root/secr/my-name") or ""
	end
	function dn_cfg.write(self, section, value)
      value=value:gsub(" ", "")
      value=value:gsub("\r\n?", "")
      value=value:gsub("\n", "")
      nixio.fs.writefile("/root/secr/my-name", value)
	end
		
  -- dpid配置
	dpid_cfg = s:option(Value, "2", "DPID联网授权码","清空输入空格保存")
	dpid_cfg.rmempty = true
	dpid_cfg.rows = 1
	
	function dpid_cfg.cfgvalue()
		return nixio.fs.readfile("/root/secr/dpid") or ""
	end
	function dpid_cfg.write(self, section, value)
      value=value:gsub(" ", "")
      value=value:gsub("\r\n?", "\n")
      value=value:gsub("\n", "")
      nixio.fs.writefile("/root/secr/dpid", value)
	end
	
  -- caid配置
	caid_cfg = s:option(Value, "3", "CAID区域码","清空输入空格保存")
	caid_cfg.rmempty = true
	caid_cfg.rows = 1
	
	function caid_cfg.cfgvalue()
		return nixio.fs.readfile("/root/secr/caid") or ""
	end
	function caid_cfg.write(self, section, value)
      value=value:gsub(" ", "")
      value=value:gsub("\r\n?", "\n")
      value=value:gsub("\n", "")
      nixio.fs.writefile("/root/secr/caid", value)
	end

  --保存事件
  local apply = luci.http.formvalue("cbi.apply")
  if apply then
        io.popen("/etc/xmap/luci-xmap.sh")
  end
return m
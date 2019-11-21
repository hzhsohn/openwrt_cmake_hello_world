
module("luci.controller.luci-xmap", package.seeall)


function index()
        if not nixio.fs.access("/etc/config/luci-xmap") then
                return
        end
        entry({"admin", "services", "luci-xmap"}, cbi("admin_xmap/luci-xmap"), _("中控管理")).dependent = true
end

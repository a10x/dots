local M = {}

function M.install_pkg(pkg_name, setup)
	local registry = require("mason-registry")
	local pkg = registry.get_package(pkg_name)
	if pkg:is_installed() then
		if setup then setup() end
		return
	end
	pkg:install():once("closed", function()
		if setup then setup() end
	end)
end

return M


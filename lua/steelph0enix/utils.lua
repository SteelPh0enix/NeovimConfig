function PATH_SEPARATOR()
	if vim.loop.os_uname().sysname == "Windows_NT" then
		return "\\"
	else
		return "/"
	end
end

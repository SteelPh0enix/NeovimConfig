function USING_WINDOWS()
	return vim.loop.os_uname().sysname == "Windows_NT"
end

function PATH_SEPARATOR()
	if USING_WINDOWS() then
		return "\\"
	else
		return "/"
	end
end

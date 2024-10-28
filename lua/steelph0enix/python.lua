if vim.loop.os_uname().sysname == "Windows_NT" then
	vim.g.python3_host_prog = "C:\\Users\\phoen\\AppData\\Local\\Programs\\Python\\Python312\\python.exe"
else
	vim.g.python3_host_prog = "/usr/bin/python3"
end

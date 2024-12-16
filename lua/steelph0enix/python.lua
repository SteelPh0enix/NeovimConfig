require("steelph0enix.utils")

if USING_WINDOWS() then
	vim.g.python3_host_prog = "C:\\Users\\phoen\\AppData\\Local\\Programs\\Python\\Python312\\python.exe"
else
	vim.g.python3_host_prog = "/usr/bin/python3"
end

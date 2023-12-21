vim.o.shell = "pwsh.exe"
vim.o.shellcmdflag =
"-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
vim.o.shellredir = '2>&1 | %% { "$_" } | Out-File %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | %% { "$_" } | tee %s; exit $LastExitCode'
vim.opt.shellquote = ''
vim.opt.shellxquote = ''

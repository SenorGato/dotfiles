vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<cr>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil,nil, vim.fn.input('Log point message: '))<cr>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<cr>")

local dap = require('dap')

require("dapui").setup()














--dap.adapters.firefox = {
    --type = 'executable',
    --command = 'node',
    --args = {'/nix/store/4sfmznxj9cv005752s1whr6d0njjikx1-vscode-extension-firefox-devtools-vscode-firefox-debug-2.9.8/share/vscode/extensions/firefox-devtools.vscode-firefox-debug/dist/adapter.bundle.js'},
--}
--
--dap.configurations.typescript = {
    --{
    --name = 'Debug with Firefox',
    --type = 'firefox',
    --request = 'launch',
    --reAttach = true,
    --url = 'http://localhost:3000/',
    --webRoot = '${workspaceFolder}',
    --firefoxExecutable = '/nix/store/vpjaaamkj5cv6v12xy61kkl7pd3117a4-user-environment/bin/firefox',
    --}
--}








dap.adapters.lldb = {
  type = 'executable',
  command = '/nix/store/w83qccsvplv3brqs5cnirs3x0c45pq76-system-path/bin/lldb', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

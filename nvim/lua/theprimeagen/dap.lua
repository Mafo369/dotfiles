local dap = require("dap")
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/mafo/dotfiles/extension/debugAdapters/bin/OpenDebugAD7',
}

require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp'}})
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
  {
    name = 'Attach to gdbserver :2345',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:2345',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

require("dapui").setup({
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "watches", size = 0.25 },
      "stacks",
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "console" },
    size = 11,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  }
})

require("nvim-dap-virtual-text").setup {}

local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  print('Session started')
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  print('Session terminated')
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  print('Session exited')
  dapui.close()
end

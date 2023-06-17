local M = {}

local function configure()
  -- TODO this? not sure why it's not working
  -- local dap_install = require "dap-install"
  -- dap_install.setup {
  --   installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
  -- }

  vim.api.nvim_exec([[
    highlight DapBreakpoint ctermbg=0 guifg='#993939' guibg='#31353f'
  ]], false)

  vim.api.nvim_exec([[
    highlight DapLogPoint ctermbg=0 guifg='#61afef' guibg='#31353f'
  ]], false)

  vim.api.nvim_exec([[
    highlight DapStopped ctermbg=0 guifg='#98c379' guibg='#31353f'
  ]], false)

  vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint' })
  vim.fn.sign_define('DapBreakpointCondition',
    { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
  vim.fn.sign_define('DapBreakpointRejected',
    { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
  vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
  vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
end

local function configure_exts()
  require("nvim-dap-virtual-text").setup {
    commented = true,
  }

  local dap, dapui = require "dap", require "dapui"
  dapui.setup {} -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

local function configure_debuggers()
  -- require("config.dap.lua").setup()
  require("config.dap.python").setup()
  -- require("config.dap.rust").setup()
  -- require("config.dap.go").setup()
end

function M.setup()
  configure()                           -- Configuration
  configure_exts()                      -- Extensions
  configure_debuggers()                 -- Debugger
  require("config.dap.keymaps").setup() -- Keymaps
end

configure_debuggers()

require('dap.ext.vscode').load_launchjs(nil, {})

return M

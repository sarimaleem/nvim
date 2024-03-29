local M = {}

local function configure()
  vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939'})
  vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef'})
  vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

  vim.fn.sign_define('DapBreakpoint', { text = '●', numhl = 'DapBreakpoint', texthl = 'DapBreakpoint'})
  vim.fn.sign_define('DapBreakpointCondition', { text = '', numhl = 'DapBreakpoint', texthl = 'DapBreakpoint'})
  vim.fn.sign_define('DapBreakpointRejected', { text = '', numhl = 'DapBreakpoint', texthl = 'DapBreakpoint'})
  vim.fn.sign_define('DapLogPoint', { text = '', numhl = "DapLogPoint", texthl = 'DapLogPoint'})
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
  require("config.dap.python").setup()
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

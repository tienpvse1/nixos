local M = {}

local opts = {
  layouts = {
    {
      elements = {
        "watches",
        "breakpoints",
        "stacks",
        "scopes",
      },
      position = "left",
      size = 40,
    },
    {
      elements = {
        {
          id = "console",
          size = 1,
        },
      },
      position = "bottom",
      size = 15,
    },
  },
}

M.config = function()
  local dapui = require "dapui"
  local dap = require "dap"

  dap.listeners.before.attach.dapui_config = dapui.open
  dap.listeners.before.launch.dapui_config = dapui.open
  dap.listeners.before.event_terminated.dapui_config = dapui.close
  dap.listeners.before.event_exited.dapui_config = dapui.close

  dapui.setup(opts)
end

return M

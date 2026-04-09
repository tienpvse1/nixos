local dap = require "dap"

require("dap-vscode-js").setup {
  debugger_path = "/home/tienpvse/.local/share/nvim/lazy/vscode-js-debug",
}

dap.adapters.firefox = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

dap.adapters["pwa-chrome"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

local function getLaunchCmd()
  local cmd = vim.fn.input("npm script", "dev")
  return { cmd }
end

local function getUrl()
  local url = vim.fn.input("Host URL: ", "http://localhost:")
  return url
end

for _, language in ipairs { "typescript", "svelte", "typescriptreact" } do
  require("dap").configurations[language] = {

    {
      type = "pwa-node",
      request = "launch",
      name = "Launch NestJS app",
      cwd = "${workspaceFolder}",
      runtimeArgs = { "run", "start:debug" },
      program = "${file}",
      runtimeExecutable = "npm",
      sourceMaps = true,
      port = "${port}",
      console = "integratedTerminal",
      skipFiles = {
        "**/node_modules/**",
        "<node_internals>/**",
      },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Svelte server",
      cwd = "${workspaceFolder}",
      runtimeArgs = { "run", "dev" },
      runtimeExecutable = "npm",
      console = "integratedTerminal",
      sourceMaps = true,
      skipFiles = {
        "**/node_modules/**",
        "<node_internals>/**",
      },
      port = "${port}",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Debug with Chrome",
      url = getUrl,
      webRoot = "${workspaceFolder}",
      skipFiles = {
        "**/node_modules/**",
        "<node_internals>/**",
        "**/.svelte-kit/**",
        "**/@vite/**",
      },
    },
    {
      type = "firefox",
      request = "launch",
      name = "Debug with Firefox",
      url = getUrl,
      webRoot = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      skipFiles = {
        "<node_internals>/**",
      },
    },
  }
end

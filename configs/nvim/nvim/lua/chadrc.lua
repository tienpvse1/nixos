---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula-evondev",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.term = {
  float = {
    height = 0.85,
    width = 0.9,
    row = 0.05,
    col = 0.05,
  },
}
-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
  cmp = {
    style = "atom",
  },
}

return M

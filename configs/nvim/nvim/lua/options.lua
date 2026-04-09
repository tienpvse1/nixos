require("nvchad.options")

-- add yours here!

local o = vim.o
o.mouse = ""
o.cursorlineopt = "both" -- to enable cursorline!
-- enable relative number
o.relativenumber = true
o.number = true
o.signcolumn = "yes"
o.scrolloff = 8
o.sidescrolloff = 8
o.showmode = false -- disable showmode, use lualine instead
o.showtabline = 2 -- always show tabline
o.splitbelow = true -- split below
o.splitright = true -- split right
o.termguicolors = true -- enable 24-bit RGB colors
o.timeoutlen = 300 -- time to wait for a mapped sequence to complete
o.updatetime = 300 -- time to wait before triggering CursorHold event
o.backupcopy = "yes" -- use copy instead of rename for backups

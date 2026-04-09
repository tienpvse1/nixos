local map = vim.keymap.set

local function try_fallback_notify(opts)
  local success, _ = pcall(opts.try)
  if success then
    return
  end
  success, _ = pcall(opts.fallback)
  if success then
    return
  end
  vim.notify(opts.notify, vim.log.levels.INFO)
end

local function cleft()
  try_fallback_notify {
    try = vim.cmd.cprev,
    fallback = vim.cmd.clast,
    notify = "Quickfix list is empty!",
  }
end

local function cright()
  try_fallback_notify {
    try = vim.cmd.cnext,
    fallback = vim.cmd.cfirst,
    notify = "Quickfix list is empty!",
  }
end

map("n", "<A-j>", cright, { desc = "Quickfix Next item" })

map("n", "<A-k>", cleft, { desc = "Quickfix Previous item" })

map("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Quickfix Open" })

map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Quickfix Close" })

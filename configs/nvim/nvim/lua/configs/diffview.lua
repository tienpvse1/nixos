return {
  "sindrets/diffview.nvim",
  config = function()
    local actions = require "diffview.actions"
    local commonMappings = {
      { "n", "q", actions.close, { desc = "Git Close diffview" } },
      { "n", "<c-u>", actions.scroll_view(-0.25), { desc = "Scroll the view up" } },
      { "n", "<c-d>", actions.scroll_view(0.25), { desc = "Scroll the view down" } },
    }
    require("diffview").setup {
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
      hooks = {},
      keymaps = {
        view = commonMappings,
        diff1 = commonMappings,
        diff2 = commonMappings,
        diff3 = commonMappings,
        diff4 = commonMappings,
        file_panel = commonMappings,
        file_history_panel = commonMappings,
      },
    }
  end,
}

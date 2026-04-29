local wk = require("which-key")
local neogit = require('neogit')

wk.add({
  { "<leader>g", group = "git" },
  { "<leader>gg", neogit.open, desc = "neogit status" },
  { "<leader>gd", "<Cmd>DiffviewOpen<CR>", desc = "diff working tree" },
  { "<leader>gD", "<Cmd>DiffviewClose<CR>", desc = "close diffview" },
  { "<leader>gf", "<Cmd>DiffviewFileHistory %<CR>", desc = "file history" },
  { "<leader>gh", "<Cmd>DiffviewFileHistory<CR>", desc = "branch history" },
  { "<leader>gr", "<Cmd>DiffviewRefresh<CR>", desc = "refresh diffview" },
  { "<leader>gt", "<Cmd>DiffviewToggleFiles<CR>", desc = "toggle diff files" },
})

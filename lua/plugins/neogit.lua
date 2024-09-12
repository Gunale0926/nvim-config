local wk = require("which-key")
local neogit = require('neogit')

wk.add({
  { "<leader>g",  group = "neogit" },
  { "<leader>gg", neogit.open,     desc = "neogit open" },
}
)

local wk = require("which-key")
local neogit = require('neogit')
wk.register({
    g = {
      name = "Neogit",
      g = { neogit.open, "Open Neogit" }
    }
  },
  { prefix = "<leader>" }
)

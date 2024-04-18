local wk = require("which-key")
local builtin = require('telescope.builtin')
wk.register({
  f = {
    name = "telescope",
    f = { builtin.find_files, "Find Files" },
    g = { builtin.live_grep, "Live Grep" },
    b = { builtin.buffers, "Buffers" },
    h = { builtin.help_tags, "Help Tags" }
  },
}, { prefix = "<leader>" })

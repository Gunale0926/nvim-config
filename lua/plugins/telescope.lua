local wk = require("which-key")
local builtin = require('telescope.builtin')

wk.add({
  { "<leader>f",  group = "telescope" },
  { "<leader>ff", builtin.find_files,  desc = "find files" },
  { "<leader>fb", builtin.buffers,     desc = "buffers" },
  { "<leader>fg", builtin.live_grep,   desc = "live grep" },
  { "<leader>fh", builtin.help_tags,   desc = "help tags" },
}
)

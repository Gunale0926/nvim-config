local wk = require("which-key")
require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  }
})

wk.add({
  { "<leader>n", "<Cmd>NvimTreeToggle<CR>", desc = "toggle nvim-tree" },
}
)

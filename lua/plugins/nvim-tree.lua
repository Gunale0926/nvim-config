local wk = require("which-key")
require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  }
})

wk.add({
  { "<leader>e", group = "explorer" },
  { "<leader>ee", "<Cmd>NvimTreeToggle<CR>", desc = "toggle explorer" },
  { "<leader>ef", "<Cmd>NvimTreeFindFile<CR>", desc = "reveal current file" },
  { "<leader>er", "<Cmd>NvimTreeRefresh<CR>", desc = "refresh explorer" },
  { "<leader>ec", "<Cmd>NvimTreeCollapse<CR>", desc = "collapse folders" },
})

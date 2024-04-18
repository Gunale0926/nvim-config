local wk = require("which-key")
require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  }
})
wk.register({
  n = { "<Cmd>NvimTreeToggle<CR>", "Nvim-tree Toggle" },
}, { prefix = "<leader>" })

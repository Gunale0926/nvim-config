local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  'arzg/vim-colors-xcode',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  -- 'mfussenegger/nvim-jdtls',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'github/copilot.vim',
  'nvim-tree/nvim-web-devicons',
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    config = true,
  },
  -- 'romgrk/barbar.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-treesitter/nvim-treesitter',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  }, {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true,   -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end
  }
})

vim.opt.termguicolors = true
vim.cmd.colorscheme('xcodedarkhc')
vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
vim.api.nvim_set_hl(0, "NonText", { guibg = NONE, ctermbg = NONE })
vim.api.nvim_set_hl(0, "EndOfBuffer", { guibg = NONE, ctermbg = NONE })
vim.g.mapleader = ' '
vim.cmd.syntax('enable')
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.ai = true
vim.o.clipboard = 'unnamedplus'
vim.g.mouse = auto
vim.o.autochdir = true
vim.o.number = true
vim.o.relativenumber = true

vim.g.python3_host_prog = "/opt/homebrew/anaconda3/bin/python3"

require("lsp")
require("plugins/nvim-tree")
require("plugins/neogit")
require("plugins/telescope")
-- require("plugins/jdtls")
-- require("plugins/neorg")
-- require("plugins/barbar")

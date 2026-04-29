vim.g.mapleader = ' '
vim.g.maplocalleader = ','

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
  {
    "williamboman/mason.nvim",
    init = function()
      require("mason").setup()
    end,
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
      }
    }

  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
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
  'romgrk/barbar.nvim',
  'nvim-treesitter/nvim-treesitter',
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    lazy = false,
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      {
        "<leader>ee",
        "<cmd>Yazi<CR>",
        mode = { "n", "v" },
        desc = "open yazi at current file",
      },
      {
        "<leader>ec",
        "<cmd>Yazi cwd<CR>",
        desc = "open yazi in cwd",
      },
      {
        "<leader>er",
        "<cmd>Yazi toggle<CR>",
        desc = "resume yazi",
      },
    },
    opts = {
      open_for_directories = true,
      keymaps = {
        show_help = "<f1>",
      },
      integrations = {
        resolve_relative_path_application = "realpath",
      },
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    cmd = 'Org',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      })
      -- require('nvim-treesitter.configs').setup({
      --  ensure_installed = 'all',
      --  ignore_install = { 'org' },
      -- })
      end,
    },
    {
      "lervag/vimtex",
      lazy = false,     -- we don't want to lazy load VimTeX
      -- tag = "v2.15", -- uncomment to pin to a specific release
      init = function()
        vim.g.tex_flavor = 'latex'
        vim.g.vimtex_view_method = 'skim'
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_reading_bar = 1
        vim.g.vimtex_view_skim_no_select = 1
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_compiler_latexmk = {
          continuous = 1,
          callback = 1,
          executable = 'latexmk',
          options = {
            '-verbose',
            '-file-line-error',
            '-synctex=1',
            '-interaction=nonstopmode',
          },
        }
        vim.g.vimtex_quickfix_mode = 0
      end
    }
  })

  vim.opt.termguicolors = true
  vim.cmd.colorscheme('xcodedarkhc')
  vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
  vim.api.nvim_set_hl(0, "NonText", { guibg = NONE, ctermbg = NONE })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { guibg = NONE, ctermbg = NONE })
  vim.cmd.syntax('enable')
  vim.o.expandtab = true
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.ai = true
  vim.o.clipboard = 'unnamedplus'
  vim.o.mouse = 'a'
  vim.o.autochdir = true
  vim.o.number = true
  vim.o.relativenumber = true

  vim.g.python3_host_prog = "/opt/homebrew/anaconda3/bin/python3"

  require("lsp")
  require("keymaps")
  require("plugins/neogit")
  require("plugins/telescope")
  require("plugins/barbar")

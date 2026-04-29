local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config('*', {
  capabilities = capabilities,
})

local texlab_config = {
  settings = {
    texlab = {
      build = {
        executable = 'latexmk',
        args = {
          '-pdf',
          '-interaction=nonstopmode',
          '-synctex=1',
          '%f',
        },
        onSave = false,
        forwardSearchAfter = false,
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = false,
      },
      diagnosticsDelay = 300,
      latexFormatter = 'latexindent',
      latexindent = {
        modifyLineBreaks = false,
      },
    },
  },
}

vim.lsp.config('texlab', texlab_config)

require('mason-lspconfig').setup({
  automatic_enable = true,
})

if vim.fn.executable('texlab') == 1 then
  vim.lsp.enable('texlab')
end

local function lsp_health()
  vim.cmd('checkhealth vim.lsp')
end

local function lsp_restart()
  vim.cmd('LspRestart')
end

local function lsp_stop()
  vim.cmd('LspStop')
end

local function lsp_start()
  vim.cmd('LspStart')
end

local function previous_diagnostic()
  vim.diagnostic.jump({ count = -1, float = true })
end

local function next_diagnostic()
  vim.diagnostic.jump({ count = 1, float = true })
end

local function toggle_inlay_hints()
  local filter = { bufnr = 0 }
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter)
end

local wk = require("which-key")
wk.add({
  { "<leader>l", group = "lsp" },
  { "<leader>la", vim.lsp.buf.code_action, desc = "code action", mode = { "n", "v" } },
  { "<leader>lc", vim.lsp.codelens.run, desc = "run codelens" },
  { "<leader>lC", vim.lsp.codelens.refresh, desc = "refresh codelens" },
  { "<leader>ld", vim.lsp.buf.definition, desc = "definition" },
  { "<leader>lD", vim.lsp.buf.declaration, desc = "declaration" },
  { "<leader>le", vim.diagnostic.open_float, desc = "line diagnostics" },
  { "<leader>lf", vim.lsp.buf.format, desc = "format buffer", mode = { "n", "v" } },
  { "<leader>lh", vim.lsp.buf.hover, desc = "hover docs" },
  { "<leader>li", vim.lsp.buf.implementation, desc = "implementation" },
  { "<leader>lI", toggle_inlay_hints, desc = "toggle inlay hints" },
  { "<leader>ln", next_diagnostic, desc = "next diagnostic" },
  { "<leader>lp", previous_diagnostic, desc = "previous diagnostic" },
  { "<leader>lq", vim.diagnostic.setloclist, desc = "diagnostics loclist" },
  { "<leader>lQ", vim.diagnostic.setqflist, desc = "diagnostics quickfix" },
  { "<leader>lr", vim.lsp.buf.references, desc = "references" },
  { "<leader>lR", vim.lsp.buf.rename, desc = "rename symbol" },
  { "<leader>ls", vim.lsp.buf.signature_help, desc = "signature help" },
  { "<leader>lS", vim.lsp.buf.document_symbol, desc = "document symbols" },
  { "<leader>lt", vim.lsp.buf.type_definition, desc = "type definition" },
  { "<leader>lx", lsp_restart, desc = "restart lsp" },
  { "<leader>lX", lsp_stop, desc = "stop lsp" },
  { "<leader>lA", lsp_start, desc = "start lsp" },
  { "<leader>l?", lsp_health, desc = "lsp health" },

  { "<leader>lw", group = "workspace" },
  { "<leader>lwa", vim.lsp.buf.add_workspace_folder, desc = "add folder" },
  { "<leader>lwl", vim.lsp.buf.list_workspace_folders, desc = "list folders" },
  { "<leader>lwr", vim.lsp.buf.remove_workspace_folder, desc = "remove folder" },
  { "<leader>lws", vim.lsp.buf.workspace_symbol, desc = "workspace symbols" },

  { "gd", vim.lsp.buf.definition, desc = "definition" },
  { "gD", vim.lsp.buf.declaration, desc = "declaration" },
  { "gi", vim.lsp.buf.implementation, desc = "implementation" },
  { "gr", vim.lsp.buf.references, desc = "references" },
  { "K", vim.lsp.buf.hover, desc = "hover docs" },
  { "[d", previous_diagnostic, desc = "previous diagnostic" },
  { "]d", next_diagnostic, desc = "next diagnostic" },
})

-- luasnip setup
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
}

vim.api.nvim_create_augroup("TexSettings", { clear = true })
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = { "tex", "plaintex", "bib" },
    group = "TexSettings",
    callback = function()
      vim.opt_local.conceallevel = 2
      vim.opt_local.linebreak = true
      vim.opt_local.spell = true
      vim.opt_local.spelllang = "en_us"
      vim.opt_local.wrap = true
    end,
  }
)

-- Black autoformat on save
vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    pattern = "*.py",
    group = "AutoFormat",
    callback = function()
      vim.cmd("silent !black --quiet %")
      vim.cmd("edit")
    end,
  }
)

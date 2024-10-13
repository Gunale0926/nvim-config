local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright', 'ts_ls', 'eslint', 'cssls', 'cssmodules_ls', 'tailwindcss', 'lua_ls' }

-- jdtls

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

local wk = require("which-key")
wk.add({
  { "<leader>l", vim.lsp.buf.format, desc = "format buffer" },
  { "gd", vim.lsp.buf.definition, desc = "go to definition" },
  { "gD", vim.lsp.buf.declaration, desc = "go to declaration" },
  { "gr", vim.lsp.buf.references, desc = "go to references" },
  { "gi", vim.lsp.buf.implementation, desc = "go to implementation" },
  { "K", vim.lsp.buf.hover, desc = "show hover" },
  { "<C-k>", vim.lsp.buf.signature_help, desc = "show signature help" },
  { "<leader>rn", vim.lsp.buf.rename, desc = "rename symbol" },
  { "<leader>ca", vim.lsp.buf.code_action, desc = "code action" },
  { "<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "add workspace folder" },
  { "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "remove workspace folder" },
  { "<leader>wl", vim.lsp.buf.list_workspace_folders, desc = "list workspace folders" },
  { "<leader>D", vim.lsp.buf.type_definition, desc = "go to type definition" },
  { "<leader>q", vim.lsp.diagnostic.set_loclist, desc = "set loclist" },
  { "[d", vim.lsp.diagnostic.goto_prev, desc = "go to previous diagnostic" },
  { "]d", vim.lsp.diagnostic.goto_next, desc = "go to next diagnostic" },
  { "<leader>l", vim.lsp.diagnostic.show_line_diagnostics, desc = "show line diagnostics" },
  { "<leader>q", vim.lsp.diagnostic.set_loclist, desc = "set loclist" },
}
)

-- luasnip setup
local luasnip = require 'luasnip'

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
  },
}

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

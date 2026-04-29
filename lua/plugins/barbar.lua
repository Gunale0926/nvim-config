local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', vim.tbl_extend('force', opts, { desc = 'previous buffer' }))
map('n', '<A-.>', '<Cmd>BufferNext<CR>', vim.tbl_extend('force', opts, { desc = 'next buffer' }))

map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', vim.tbl_extend('force', opts, { desc = 'move buffer left' }))
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', vim.tbl_extend('force', opts, { desc = 'move buffer right' }))

for i = 1, 9 do
  map('n', ('<A-%d>'):format(i), ('<Cmd>BufferGoto %d<CR>'):format(i), vim.tbl_extend('force', opts, {
    desc = ('go to buffer %d'):format(i),
  }))
end

map('n', '<A-0>', '<Cmd>BufferLast<CR>', vim.tbl_extend('force', opts, { desc = 'go to last buffer' }))
map('n', '<A-p>', '<Cmd>BufferPin<CR>', vim.tbl_extend('force', opts, { desc = 'pin buffer' }))
map('n', '<A-c>', '<Cmd>BufferClose<CR>', vim.tbl_extend('force', opts, { desc = 'close buffer' }))
map('n', '<A-S-c>', '<Cmd>BufferRestore<CR>', vim.tbl_extend('force', opts, { desc = 'restore buffer' }))

map('n', '<C-p>', '<Cmd>BufferPick<CR>', vim.tbl_extend('force', opts, { desc = 'pick buffer' }))
map('n', '<C-S-p>', '<Cmd>BufferPickDelete<CR>', vim.tbl_extend('force', opts, { desc = 'pick buffer to close' }))

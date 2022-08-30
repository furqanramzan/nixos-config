vim.opt.number = true

-- Enable mouse
vim.opt.mouse = "a"

-- Set space as a leader.
vim.g.mapleader = " "

-- Enables 24-bit RGB color
vim.opt.termguicolors = true

-- Sign column along side number column.
-- yes: 2 columns will always be displayed.
-- auto: editor would jank to the right or left depending on whether signs exist or not.
-- number: display signs in the number column.
vim.opt.signcolumn = "yes"

vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
vim.keymap.set('n', '<leader>qq', '<cmd>q<cr>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.number = true

vim.keymap.set('n', '<space>', ':')
vim.keymap.set('n', '<c-f>', ':Files<cr>')
vim.keymap.set('n', '<c-t>', ':FloatermNew<cr>')
vim.keymap.set('i', '<c-x>', '<esc>')
vim.keymap.set('i', '\'', '\'\'<left>')
vim.keymap.set('i', '\"', '\"\"<left>')
vim.keymap.set('i', '(', '()<left>')
vim.keymap.set('i', '[', '[]<left>')
vim.keymap.set('i', '{', '{}<left>')
vim.keymap.set('i', '{<cr>', '{<cr>}<esc>O')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<space>', ':')
vim.keymap.set('i', '<c-x>', '<esc>')
vim.keymap.set('i', '\'', '\'\'<left>')
vim.keymap.set('i', '\"', '\"\"<left>')
vim.keymap.set('i', '(', '()<left>')
vim.keymap.set('i', '[', '[]<left>')
vim.keymap.set('i', '{', '{}<left>')
vim.keymap.set('i', '{<cr>', '{<cr>}<esc>O')

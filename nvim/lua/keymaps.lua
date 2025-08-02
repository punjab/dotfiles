vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", '<cmd>write<cr>', {desc = 'Save'} )

vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", {desc = 'Toggle File Explorer'})
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", {desc = 'Toggle File Explorer on Current file'})

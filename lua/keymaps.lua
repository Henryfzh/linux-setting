-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keymaps for plugins
-- Define the leader key as space
vim.g.mapleader = ' '

-- Load nvim-tree
require'nvim-tree'.setup{}

-- Key mappings
local map = vim.api.nvim_set_keymap

-- Open nvim-tree with space+ft
map('n', '<leader>ft', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<leader>ff', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
map('n', '<A-l>', ':BufferNext<CR>', { noremap = true, silent = true })
map('n', '<A-h>', ':BufferPrevious<CR>', { noremap = true, silent = true })
map('n', '<M-t>', ':ToggleTerm<CR>', { noremap = true, silent = true })
map('n', '<M-f>', '<cmd>ToggleTerm direction=float<CR>', {noremap = true, silent = true})
map('t', '<M-c>', '<C-\\><C-n>:q<CR>', { noremap = true, silent = true })

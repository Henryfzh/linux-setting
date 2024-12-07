-- Define the path to lazy.nvim and clone it if not already present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Set up lazy.nvim and configure plugins
require("lazy").setup({
    "tanvirtin/monokai.nvim",
    "williamboman/mason.nvim", -- Mason for managing LSPs and tools
    "williamboman/mason-lspconfig.nvim", -- Integration between Mason and nvim-lspconfig
    "jose-elias-alvarez/null-ls.nvim", -- null-ls for integrating linters and formatters
    "neovim/nvim-lspconfig",
    {
        'akinsho/toggleterm.nvim', version = "*", config = true
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "c", "lua", "vim", "vimdoc", "query",
                    "elixir", "heex", "javascript", "html"
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
})

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "rust_analyzer" },
    automatic_installation = true,
})
require('lspconfig')['pyright'].setup{}


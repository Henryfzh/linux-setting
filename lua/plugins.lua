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

require("lazy").setup({
    "tanvirtin/monokai.nvim",
    "williamboman/mason.nvim", -- Mason for managing LSPs and tools
    "williamboman/mason-lspconfig.nvim", -- Integration between Mason and nvim-lspconfig
    "jose-elias-alvarez/null-ls.nvim", -- null-ls for integrating linters and formatters
    "neovim/nvim-lspconfig", 
    "williamboman/nvim-lsp-installer",
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "rust_analyzer", "tsserver" }, 
    automatic_installation = true,
})



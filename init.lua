require('plugins')
require('options')
require('colorscheme')
require('keymaps')
require'lspconfig'.pyright.setup{
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    }
}

vim.cmd [[
  augroup lsp
    autocmd!
    autocmd FileType python lua require('lspconfig').pyright.setup{}
  augroup END
]]


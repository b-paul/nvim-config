local M = {}

local opts = { silent = true }

M.general = function()

    vim.g.mapleader = ' '
    vim.g.localleader = '\\'

    vim.keymap.set("n", "<C-L>", ":noh<CR>:mode<CR>", opts)
    vim.keymap.set("n", "<leader>a", "$i", opts)
    vim.keymap.set("n", "<leader>x", "$x", opts)
    vim.keymap.set("n", "<leader>f", "1z=", opts)
end

M.lsp = function(_, bufnr)
    local lsp_opts = { silent = true, buffer = bufnr }
    vim.keymap.set("n", "<leader><leader>f", vim.lsp.buf.format, lsp_opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, lsp_opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, lsp_opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, lsp_opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, lsp_opts)
    vim.keymap.set("n", "<leader>d", vim.lsp.buf.type_definition, lsp_opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, lsp_opts)
    vim.keymap.set("n", "<leader><leader>r", vim.lsp.buf.rename, lsp_opts)
    vim.keymap.set("n", "<leader><leader>c", vim.lsp.buf.code_action, lsp_opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

M.telescope = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set("n", "<leader>C", builtin.colorscheme, opts)
    vim.keymap.set("n", "<leader>F", builtin.find_files, opts)
    vim.keymap.set("n", "<leader>G", builtin.live_grep, opts)
end

M.agda = function()
    vim.keymap.set("n", "<localleader>l", ":CornelisLoad<CR>", opts)
end

M.nvim_tree = function()
    vim.keymap.set("n", "<leader>T", require('nvim-tree.api').tree.open, opts)
end

return M

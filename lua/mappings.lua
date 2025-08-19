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
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
end

M.telescope = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set("n", "<leader>C", builtin.colorscheme, opts)
    vim.keymap.set("n", "<leader>F", builtin.find_files, opts)
    vim.keymap.set("n", "<leader>G", builtin.live_grep, opts)
end

M.nvim_tree = function()
    vim.keymap.set("n", "<leader>T", require('nvim-tree.api').tree.open, opts)
end

M.neogit = function()
    vim.keymap.set("n", "<leader><leader>N", require('neogit').open, opts)
end

M.gitsigns = function()
    vim.keymap.set("n", "<leader>hp", require('gitsigns').preview_hunk, opts)
end

return M

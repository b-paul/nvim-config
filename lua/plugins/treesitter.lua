return function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "rust",
            "lua",
            "haskell",
            "c",
            "vimdoc",
            "regex", -- ?
        },
        sync_install = false,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    })
end

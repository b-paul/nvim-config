return function()
    require("nvim-treesitter.configs").setup({
        auto_install = true,
        sync_install = false,
        highlight = {
            enable = true,
        },
    })
end

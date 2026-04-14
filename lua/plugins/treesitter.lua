return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "mks-h/treesitter-autoinstall.nvim"
        }
        build = ":TSUpdate",
        config = function()
            require("treesitter-autoinstall").setup({
                highlight = true,
            })
        end,
    },
}

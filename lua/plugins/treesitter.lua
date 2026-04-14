return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main", -- WHY IS THIS NEEDED?!?!?!
        dependencies = {
            "mks-h/treesitter-autoinstall.nvim"
        },
        build = ":TSUpdate",
        config = function()
            require("treesitter-autoinstall").setup({
                highlight = true,
            })
        end,
    },
}

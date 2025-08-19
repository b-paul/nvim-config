-- General git integration plugins
return {
    -- for `:G blame`!!!!! very useful command
    "tpope/vim-fugitive",
    -- apparently this is like magit which i heard is good (magit is for emacs)
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        config = function()
            require("mappings").neogit()
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("mappings").gitsigns()
        end,
    }
}

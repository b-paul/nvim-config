local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
	{
		"neovim/nvim-lspconfig",
		config = require("plugins/lsp"),
        dependencies = {
            "simrat39/rust-tools.nvim",
            "MrcJkb/haskell-tools.nvim",
        },
	},
    {
        "hrsh7th/nvim-cmp",
        config = require("plugins/cmp"),
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        }
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = require("plugins/telescope"),
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSInstall",
        config = require("plugins/treesitter"),
    },

    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = require("plugins/nvim-surround")
    },

    -- aaa i dont particularly like any colour schemes!! i might just make my own
    {
        "tiagovla/tokyodark.nvim",
        config = function()
            require("tokyodark").setup({
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    identifiers = { italic = false },
                    functions = {}, -- whaa why does it not complain when i put these two here
                    variables = {},
                }
            })
            vim.cmd("colorscheme tokyodark")
        end,
    },

    {
        "lervag/vimtex",
    },
})

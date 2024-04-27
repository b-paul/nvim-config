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
        build = ":TSUpdate",
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
        ft = "tex",
        init = function()
            vim.g.vimtex_view_method = 'zathura'
        end
    },

    {
        'scalameta/nvim-metals',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        ft = { 'scala', 'sbt', 'java' },
        opts = function()
            local metals_config = require('metals').bare_config()
            metals_config.on_attach = require('mappings').on_attach

            return metals_config
        end,
        config = function(self, metals_config)
            local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = self.ft,
                callback = function()
                    require('metals').initialize_or_attach(metals_config)
                end,
                group = nvim_metals_group,
            })
        end
    },

    {
        'nvim-tree/nvim-tree.lua',
		config = require("plugins/nvim-tree"),
    },
})

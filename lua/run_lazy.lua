-- Configuration of the lazy.nvim package manager

-- We install lazy using the code given in the installation guide (this is copy pasted)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
        {
            "tiagovla/tokyodark.nvim",
            lazy = false,
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

        --[[
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
        ]]--

        'tpope/vim-fugitive',
    },
})

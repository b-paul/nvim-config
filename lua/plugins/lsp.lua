local bindings = require("mappings").lsp

return {
	{
		"neovim/nvim-lspconfig",
        dependencies = {
            "mrcjkb/rustaceanvim",
            "MrcJkb/haskell-tools.nvim",
        },
		config = function()
            vim.lsp.enable("rust-analyzer")
            vim.lsp.enable("tinymist")
            vim.lsp.enable("dafny")
            vim.lsp.enable("texlab")
            vim.lsp.enable("jedi_language_server")
            vim.lsp.enable("ruff")
            vim.lsp.enable("ty")

            -- for some reason this doesn't work?!
            --[[
            vim.lsp.config("*", {
                on_attach = bindings
            })
            ]]--

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = bindings
            })
        end,
	},
}

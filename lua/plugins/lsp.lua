local bindings = require("mappings").lsp

return function()
    vim.g.rustaceanvim = {
        server = {
            on_attach = bindings
        },
    }

    vim.g.haskell_tools = {
        hls = {
            on_attach = bindings
        },
    }

    require("lspconfig").tinymist.setup({
        on_attach = bindings
    })

    require("lspconfig").dafny.setup({
        on_attach = bindings,
        cmd = {"dafny", "server", "--verify-on", "Save"},
    })

    require("lspconfig").texlab.setup({
        on_attach = bindings
    })

    --[[
    require("lspconfig").metals.setup({
        on_attach = bindings
    })
    ]]--

    vim.lsp.enable("jedi_language_server")
    vim.lsp.config("jedi_language_server", {
        on_attach = bindings
    })

    vim.lsp.enable("ruff")
    vim.lsp.config("ruff", {
        on_attach = bindings
    })

    vim.lsp.enable("ty")
    vim.lsp.config("ty", {
        on_attach = bindings
    })
end

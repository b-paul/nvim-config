local bindings = require("mappings").lsp

return function()
    require("rust-tools").setup({
        server = {
            on_attach = bindings
        },
    })

    vim.g.haskell_tools = {
        hls = {
            on_attach = bindings
        },
    }

    require("lspconfig").typst_lsp.setup({
        on_attach = bindings
    })

    require("lspconfig").dafny.setup({
        on_attach = bindings,
        cmd = {"dafny", "server", "--verify-on", "Save"},
    })

    require("lspconfig").texlab.setup({
        on_attach = bindings
    })

    require("lspconfig").metals.setup({
        on_attach = bindings
    })
end

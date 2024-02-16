local bindings = require("mappings").lsp

return function()
    require("rust-tools").setup({
        server = {
            on_attach = bindings
        },
    })

    require("lspconfig").typst_lsp.setup({
        on_attach = bindings
    })

    require("lspconfig").dafny.setup({
        on_attach = bindings
    })
end

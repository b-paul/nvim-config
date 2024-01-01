local bindings = require("mappings").lsp

return function()
    require("rust-tools").setup({
        server = {
            on_attach = bindings
        },
    })
end

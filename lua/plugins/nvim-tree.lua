return function()
    require('nvim-tree').setup({
        renderer = {
            icons = {
                show = {
                    file = false,
                    folder = false,
                    folder_arrow = false,
                    git = false,
                    modified = false,
                    diagnostics = false,
                    bookmarks = false,
                }
            }
        }
    })
    require('mappings').nvim_tree()
end

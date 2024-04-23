return function()
    require('nvim-tree').setup({
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
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
                },
            },
        }
    })
    require('mappings').nvim_tree()
end

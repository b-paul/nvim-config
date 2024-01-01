return function()
    require("mappings").telescope()
    require("telescope").setup({
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({}) -- idk what this is ahdbmuwighmbw
            }
        }
    })
    require("telescope").load_extension("ui-select")
end

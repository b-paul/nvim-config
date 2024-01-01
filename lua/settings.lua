vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true

vim.opt.hidden = true

vim.opt.spelllang = "en_au"

vim.opt.ruler = true
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"

vim.opt.wrap = false

vim.opt.colorcolumn = "+1"

-- idk if it's a thing yet
vim.filetype.add({
    extension = {
        typ = 'typst',
    },
})

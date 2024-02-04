vim.g.python3_host_prog = '~/.pyenv/versions/neovim/bin/python'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.colorcolumn = "80,120"
if vim.opt.filetype == "tex" then
    vim.opt.spell = true
end

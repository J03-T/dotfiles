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
vim.opt.termguicolors = true
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.guicursor="n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50"
vim.opt.background = 'light'
vim.opt.modeline = false  -- arbitrary code execution

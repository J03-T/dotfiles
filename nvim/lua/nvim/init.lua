require("nvim.comment")
require("nvim.variables")
require("nvim.keys")
require('nvim.commands')
if vim.g.neovide then
    require("nvim.neovide")
end
vim.cmd.source('~/.config/nvim/vimscript/color.vim')
vim.cmd.packadd('nvim-treesitter') -- treesitter needs this for some reason

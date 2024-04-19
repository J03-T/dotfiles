vim.api.nvim_create_user_command('Dark', function()
    vim.opt.background = 'dark'
    vim.cmd.source('~/.config/nvim/vimscript/color.vim')
end, {})
vim.api.nvim_create_user_command('Light', function()
    vim.opt.background = 'light'
    vim.cmd.source('~/.config/nvim/vimscript/color.vim')
end, {})

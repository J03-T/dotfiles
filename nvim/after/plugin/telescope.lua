local telescope = require('telescope.builtin');
vim.keymap.set('n', '<leader>pf', function() telescope.git_files({ disable_devicons = true }) end, { silent = true, desc = "Find git files" })
vim.keymap.set('n', '<leader>pF', function() telescope.find_files({ disable_devicons = true }) end,
    { silent = true, desc = "Find files" });
vim.keymap.set('n', '<leader>ps', function()
    telescope.live_grep({ prompt_title = 'Search String', grep_open_files = true, disable_devicons = true })
end, { silent = true, desc = "Search in files" });

--local telescope = require('telescope');
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>pf', function() builtin.git_files({}) end,
--    { silent = true, desc = "Search git files" })

--vim.keymap.set('n', '<leader>pF', function() builtin.find_files({}) end,
--    { silent = true, desc = "Search files" })
vim.keymap.set('n', '<leader>pF', ':find ', { desc = "Search files" })

vim.keymap.set('n', '<leader>pp', function() builtin.oldfiles({}) end,
    { silent = true, desc = "Search previously open files" })

--vim.keymap.set('n', '<leader>pg', function()
--    builtin.live_grep({ prompt_title = 'Grep String', grep_open_files = true, disable_devicons = false })
--end, { silent = true, desc = "Search file contents" });
vim.keymap.set('n', '<leader>pg', function()
    local query = vim.fn.input('Search > ')
    vim.cmd.vimgrep('/' .. query .. '/j', '**/*')
    vim.cmd.copen()
end, { desc = "Search file contents" });

vim.keymap.set('n', '<leader>ps', vim.lsp.buf.document_symbol, { desc = "Search code symbols in workspace" })
--vim.keymap.set('n', '<leader>ps', function()
--    builtin.lsp_document_symbols({})
--end, { silent = true, desc = "Search code symbols in current buffer" })

vim.keymap.set('n', '<leader>pS', vim.lsp.buf.workspace_symbol, { desc = "Search code symbols in workspace" })
--vim.keymap.set('n', '<leader>pS', function()
--    builtin.lsp_dynamic_workspace_symbols({})
--end, { silent = true, desc = "Search code symbols in workspace"})

--vim.keymap.set('n', '<leader>pt', function()
--    builtin.treesitter({})
--end, { silent = true, desc = "Search symbols using treesitter"})

--vim.keymap.set('n', '<leader>ph', function()
--    builtin.git_bcommits({})
--end, { silent = true, desc = "Search previous versions of file"})

--vim.keymap.set('v', '<leader>ph', function()
--    builtin.git_bcommits_range({})
--end, { silent = true, desc = "Search previous versions of selected range"})

--vim.keymap.set('n', '<leader>pH', function()
--    builtin.git_commits({})
--end, { silent = true, desc = "Search previous project commits"})

--vim.keymap.set('n', '<leader>pd', function()
--    builtin.diagnostics({ bufnr = 0 })
--end, { silent = true, desc = "Search current buffer diagnostics"})
vim.keymap.set('n', '<leader>pd', function()
    vim.fn.setqflist(vim.diagnostic.toqflist(vim.diagnostic.get(0)))
    vim.cmd.copen()
end, { silent = true, desc = "Search current buffer diagnostics" })

--vim.keymap.set('n', '<leader>pD', function()
--    builtin.diagnostics({})
--end, { silent = true, desc = "Search all buffer diagnostics"})
vim.keymap.set('n', '<leader>pD', function()
    vim.fn.setqflist(vim.diagnostic.toqflist(vim.diagnostic.get()))
    vim.cmd.copen()
end, { silent = true, desc = "Search all buffer diagnostics" })

--vim.keymap.set('n', '<leader>pk', function()
--    builtin.keymaps({})
--end, {silent = true, desc = "Search keymaps"})

--vim.keymap.set('n', '<leader>pb', function()
--    builtin.git_branches({})
--end, { silent = true, desc = "Search Git branches"})

--vim.keymap.set('n', '<leader>pr', function()
--    builtin.lsp_references({})
--end, { silent = true, desc = "Search references for symbol"})

--vim.keymap.set('n', '<leader>pvo', function()
--    builtin.vim_options({})
--end, { silent = true, desc = "Search Vim options"})

--vim.keymap.set('n', '<leader>pvh', function()
--    builtin.help_tags({})
--end, { silent = true, desc = "Search Vim help"})

--vim.keymap.set('n', '<leader>pw', function()
--    builtin.spell_suggest({})
--end, { silent = true, desc = "Search spelling suggestions"})

--vim.keymap.set('n', '<leader>pR', function()
--    builtin.registers({})
--end, { silent = true, desc = "Search registers"})

--vim.keymap.set('n', '<leader>pq', function()
--    builtin.quickfix({})
--end, { silent = true, desc = "Search quickfix list"})

--vim.keymap.set('n', '<leader>pQ', function()
--    builtin.quickfixhistory({})
--end, { silent = true, desc = "Search quickfix history"})

--vim.keymap.set('n', '<leader>pm', function()
--    builtin.man_pages({ sections = { "ALL" }})
--end, { silent = true, desc = "Search all manpages"})
vim.keymap.set('n', '<leader>pm', ':Man ', { desc = "Search all manpages" })

--vim.keymap.set('n', '<leader>pmc', function()
--    builtin.man_pages({ sections = { "3" }})
--end, { silent = true, desc = "Search C library function manpages"})

vim.keymap.set('n', '<leader>pmc', ':Man 3 ', { desc = "Search C library function manpages"})

--vim.keymap.set('n', '<leader>pms', function()
--    builtin.man_pages({ sections = { "2" }})
--end, { silent = true, desc = "Search Linux system call manpages"})

vim.keymap.set('n', '<leader>pms', ':Man 2 ', { desc = "Search Linux system call manpages"})

--vim.keymap.set('n', '<leader>pmf', function()
--    builtin.man_pages({ sections = { "2", "3" }})
--end, { silent = true, desc = "Search all C function manpages"})

--vim.keymap.set('n', '<leader>pmu', function()
--    builtin.man_pages({ sections = { "1" }})
--end, { silent = true, desc = "Search executable user program/command manpages"})
vim.keymap.set('n', '<leader>pmu', ':Man 1 ', { desc = "Search user program manpages"})

--vim.keymap.set('n', '<leader>pml', function()
--    builtin.man_pages({ sections = { "5" }})
--end, { silent = true, desc = "Search Linux conventions/file format manpages"})
vim.keymap.set('n', '<leader>pml', ':Man 5 ', { desc = "Search Linux convention/file manpages" })

--vim.keymap.set('n', '<leader>pmd', function()
--    builtin.man_pages({ sections = { "4" }})
--end, { silent = true, desc = "Search Linux /dev file manpages"})
vim.keymap.set('n', '<leader>pmd', ':Man 4 ', { desc = "Search Linux /dev manpages"})

--vim.keymap.set('n', '<leader>pma', function()
--    builtin.man_pages({ sections = { "8" }})
--end, { silent = true, desc = "Search administrative program/command manpages"})
vim.keymap.set('n', '<leader>pma', ':Man 8', { desc = "Search administrative program manpages" })

--vim.keymap.set('n', '<leader>pmp', function()
--    builtin.man_pages({ sections= { "1", "8" }})
--end, { silent = true, desc = "Search all program/command manpages"})

--vim.keymap.set('n', '<leader>pN', function()
--    builtin.live_grep({ search_dirs = { "/usr/include/x86_64-linux-gnu/asm/unistd_64.h" },
--                        disable_coordinates = true })
--end, { silent = true, desc = "Search linux syscall numbers"})
--
vim.keymap.set('n', '<leader>pN', function()
    local syscall = vim.fn.input('Syscall > ')
    vim.cmd.vimgrep('/'..syscall..'/j', '/usr/include/x86_64-linux-gnu/asm/unistd_64.h')
    if vim.fn.getqflist()[1] == nil then
        print("Syscall not found")
    elseif vim.fn.getqflist()[2] == nil then
        print("Syscall Number: "..vim.fn.getqflist()[1].text)
    else
        vim.cmd.copen()
    end
end)

--vim.keymap.set('n', '<leader>pvc', function()
--    builtin.colorscheme({})
--end, { silent = true, desc = "Search Vim colorschemes"})


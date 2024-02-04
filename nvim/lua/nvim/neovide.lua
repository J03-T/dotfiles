vim.g.neovide_cursor_trail_size = 0.1
vim.o.guifont="Cascadia Code:h13"
vim.keymap.set("n", "<F11>", ":let g:neovide_fullscreen=!g:neovide_fullscreen<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-+>", ":let g:neovide_scale_factor=g:neovide_scale_factor+0.1<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-->", ":let g:neovide_scale_factor=g:neovide_scale_factor-0.1<CR>", {noremap = true, silent = true})


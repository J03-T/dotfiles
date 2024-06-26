vim.keymap.set("n", "<leader>Ga", ":Git add %<CR>", { silent = true, desc = "Add current file to git" })
vim.keymap.set("n", "<leader>Gc", ":Git commit -a<CR>", { silent = true, desc = "Create new commit" })
vim.keymap.set("n", "<leader>Gp", ":Git push<CR>", { silent = true, desc = "Push to remote" })
vim.keymap.set("n", "<leader>Gl", ":Git pull<CR>", { silent = true, desc = "Pull from remote" })
vim.keymap.set("n", "<leader>Gs", ":Git status<CR>", { silent = true, desc = "Git status" })
vim.keymap.set("n", "<leader>Gf", ":Git fetch<CR>", { silent = true, desc = "Git fetch" })
vim.keymap.set("n", "<leader>Gb", ":Git blame<CR>", { silent = true, desc = "Git blame" })
vim.keymap.set("n", "<leader>GC", ":Git checkout", { desc = "Git checkout" })
vim.keymap.set("n", "<leader>Gd", ":Git diff<CR>", { silent = true, desc = "Git diff" })
vim.keymap.set("n", "<leader>GL", ":Git log<CR>", { silent = true, desc = "Git log" })

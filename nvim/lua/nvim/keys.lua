require('nvim.comment')

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":e .<CR>", { silent = true, desc = "Browse files in project root" })
vim.keymap.set("v", "<leader>tf", "!pandoc -t markdown-simple_tables<CR>",
    { silent = true, desc = "Format markdown table" })
vim.keymap.set("n", "<leader>id", '"=strftime(\'%d-%m-%Y\')<CR>p"', { silent = true, desc = "Insert current date" })
vim.keymap.set("n", "<leader>it", '"=strftime(\'%H:%M\')<CR>p"', { silent = true, desc = "Insert current time" })
vim.keymap.set("v", "<leader>ep",
    '<ESC>:redir @a<cr>|:\'<,\'>w !~/.config/nvim/scripts/python_persist.sh 1 | python > /tmp/tmpoutput && (grep . /tmp/tmpoutput > /dev/null || echo -n "None") && printf "\\%s" "$(< /tmp/tmpoutput)"<cr>|:redir END<cr>|\"ap|3dd|k|:s/$/ # <cr>|:noh<cr>|:join!<cr>',
    { silent = true, desc = "Evaluate python code" })
vim.keymap.set("n", "<leader>v", ":vsplit<CR>:wincmd l<CR>", { silent = true, desc = "Vertical split" })
vim.keymap.set("n", "<leader>s", ":split<CR>:wincmd j<CR>", { silent = true, desc = "Horizontal split" })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { silent = true, desc = "Move left" })
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", { silent = true, desc = "Move down" })
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", { silent = true, desc = "Move up" })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { silent = true, desc = "Move right" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true, desc = "Move left" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true, desc = "Move down" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true, desc = "Move up" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true, desc = "Move right" })
vim.keymap.set("n", "<M-+>", ":vertical resize +5<CR>", { silent = true, desc = "Increase width" })
vim.keymap.set("n", "<M-->", ":vertical resize -5<CR>", { silent = true, desc = "Decrease width" })
vim.keymap.set("n", "<M-]>", ":resize +5<CR>", { silent = true, desc = "Increase height" })
vim.keymap.set("n", "<M-[>", ":resize -5<CR>", { silent = true, desc = "Decrease height" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true, desc = "Save" })
vim.keymap.set("n", "<leader>t", ":term<CR>:set nonumber<CR>:set norelativenumber<CR>:startinsert<CR>",
    { silent = true, desc = "Open terminal" })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal" })
vim.keymap.set("n", "<leader>Vl", function()
    local line = vim.api.nvim_command_output("echo(line('.'))")
    local command = string.format(":! code . -g '%%':%s<CR>", line)
    vim.cmd(command)
end, { silent = true, desc = "Open current line in VS Code" })
vim.keymap.set("n", "<leader>Vo", ":!code . -g '%'<CR>", { silent = true, desc = "Open current file in CWD in VS Code" })
vim.keymap.set("n", "<leader>Vd", ":!code .<CR>", { silent = true, desc = "Open current directory in VS Code" })
vim.keymap.set("n", "<leader>Vf", ":!code '%'<CR>", { silent = true, desc = "Open only current file in VS Code" })
vim.keymap.set("n", "<leader>,", ":cd ~/.config/nvim<CR>:e .<CR>", { silent = true, desc = "Open ~/.config/nvim" })
vim.keymap.set("n", "<leader>/", commentLine, {silent = true, desc = "Comment current line"})
vim.keymap.set("v", "<leader>/", commentLine, {silent = true, desc = "Comment current range"})
vim.keymap.set("i", "<C-/>", commentLine, {silent = true, desc = "Comment current line"})
vim.keymap.set("n", "gq", ":cnext<CR>", { silent = true, desc = "Go to next quickfix item"})
vim.keymap.set("n", "gQ", ":cprevious<CR>", { silent = true, desc = "Go to previou quickfix item"})
vim.keymap.set("n", "qo", ":copen<CR>", { silent = true, desc = "Open quickfix window"})
vim.keymap.set("n", "qc", ":cclose<CR>", { silent = true, desc = "Close quickfix window"})
vim.keymap.set("n", "<leader>S", function()
    if vim.opt.laststatus:get() == 2 then
        vim.opt.laststatus = 0
    else
        vim.opt.laststatus = 2
    end
end, { silent = false, desc = "Toggle status bar" })

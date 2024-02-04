require('trouble').setup {
}

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, {silent=true, desc="Toggle trouble"})
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, {silent=true, desc="Toggle workspace diagnostics"})
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, {silent=true, desc="Toggle document diagnostics"})
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, {silent=true, desc="Toggle quickfix"})
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, {silent=true, desc="Toggle loclist"})
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, {silent=true, desc="Toggle lsp references"})

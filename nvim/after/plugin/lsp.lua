local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lspconfig.pylsp.setup {
    filetypes = { 'python' },
    on_attach = function(client, _)
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.completionProvider = false
        client.server_capabilities.documentSymbolProvider = false
        client.server_capabilities.definitionProvider = false
    end,
    settings = {
        pylsp = {
            plugins = {
                --- formatters
                yapf = { enabled = false },
                autopep8 = { enabled = false },
                --- linters
                flake8 = { enabled = true },
                pyflakes = { enabled = false },
                pylint = { enabled = true, executable = 'pylint' },
                pycodestyle = { enabled = false },
                --- completion
                jedi_completion = { enabled = false, fuzzy = true },
                -- mypy
                pyls_mypy = { enabled = false, live_mode = true },
            },
        }
    }
}

lspconfig.pyright.setup {
    filetypes = { 'python' },
    on_attach = function(client, _)
        client.server_capabilities.referencesProvider = false
    end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                typeCheckingMode = 'strict',
                autoImportCompletions = true
            }
        }
    }
}

lspconfig.rust_analyzer.setup {
    filetypes = { 'rust' },
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                    'cargo', 'clippy', '--all-features', '--all-targets', '--message-format=json'
                },
            },
        },
    }
}

lspconfig.clangd.setup {
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' }
}

lspconfig.texlab.setup {
    filetypes = { 'tex', 'bib', 'plaintex' },
    settings = {
        texlab = {
            chktex = {
                onEdit = true,
                onOpenAndSave = true
            }
        },
        build = {
            onSave = true
        },
        latexindent = {
            modifyLineBreaks = true,
            textWrapOptions = {
                columns = 80,
                huge = 'overflow'
            }
        }
    }
}

lspconfig.marksman.setup {
}

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gu', vim.lsp.buf.references, opts)
        vim.keymap.set('i', '<c-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', 'gP', '<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<cr>', opts)
        vim.keymap.set('n', 'gN', '<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<cr>', opts)
        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format,
            { buffer = event.buf, silent = true, desc = "Format code" })
    end
})


vim.keymap.set('i', '<C-n>', '<C-x><C-o>', { silent = true })

vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>",
    { noremap = true, silent = true, desc = "Show line diagnostics" })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = true,
        underline = true
    }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers['signature_help'], {
        border = 'single',
        close_events = {"CursorMoved", "BufHidden", "InsertCharPre", "InsertLeave"},
        focus = false,
        focusable = false,
        silent = true,
    }
)
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = 'single',
        focus = false,
        focusable = false
    }
)
vim.diagnostic.config({
    virtual_text = false
})

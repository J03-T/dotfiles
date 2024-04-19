local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

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
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
        vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', opts)
        vim.keymap.set('n', 'gu', '<cmd>Telescope lsp_references<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
        vim.keymap.set('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
        vim.keymap.set('n', 'gP', '<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<cr>', opts)
        vim.keymap.set('n', 'gN', '<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<cr>', opts)
        vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr>',
            { buffer = event.buf, silent = true, desc = "Format code" })
        vim.keymap.set('i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    end
})


local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    completion = {
        autocomplete = false
    }
})
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>",
    { noremap = true, silent = true, desc = "Show line diagnostics" })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
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

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gR', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
        vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr>',
            { buffer = event.buf, silent = true, desc = "Format code" })
    end
})

local default_setup = function(server)
    local lsp_setup = {}
    if server == 'pylsp' then
        lsp_setup = {
            settings = {
                pylsp = {
                    plugins = {
                        --- formatters
                        yapf = { enabled = false },
                        autopep8 = { enabled = false },
                        black = { enabled = true },
                        flake8 = { enabled = false },

                        --- linters
                        pyflakes = { enabled = false },
                        pylint = { enabled = true, executable = 'pylint' },
                        pycodestyle = { enabled = false },

                        --- isort
                        pyls_isort = { enabled = true },

                        --- completion
                        jedi_completion = { enabled = true, fuzzy = true },

                        -- mypy
                        pyls_mypy = { enabled = true, live_mode = true },
                    },
                },
            },
        }
    elseif server == 'rust_analyzer' then
        lsp_setup = {
            settings = {
                ['rust-analyzer'] = {
                    checkOnSave = {
                        allFeatures = true,
                        overrideCommand = {
                            'cargo', 'clippy', '--all-features', '--all-targets', '--message-format=json'
                        },
                    },
                },
            },
        }
    end
    lspconfig[server].setup(lsp_setup)
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = { default_setup },
})
local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        -- Enter key confirms completion item
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping.confirm({ select = false }),
        -- Ctrl + space triggers completion menu
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>",
    { noremap = true, silent = true, desc = "Show line diagnostics" })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        underline = true
    }
)

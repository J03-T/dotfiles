require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "python", "markdown", "latex", "vim", "vimdoc", "query" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = {"latex"},
        additional_vim_regex_highlighting = false,
    },
}

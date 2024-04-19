function commentLine()
    local cur_line = vim.api.nvim_get_current_line()
    if vim.bo.filetype == "tex" then
        if string.sub(cur_line, 1, 1) == '%' then
            vim.cmd('s/%//')
        else
            vim.cmd('s/^/\\%')
        end
    elseif vim.bo.filetype == "python" then
        if string.sub(cur_line, 1, 1) == '#' then
            vim.cmd('s/#//')
        else
            vim.cmd('s/^/#')
        end
    elseif vim.bo.filetype == "lua" then
        if string.sub(cur_line, 1, 2) == '--' then
            vim.cmd('s/--//')
        else
            vim.cmd('s/^/--')
        end
    elseif vim.bo.filetype == "c" or vim.bo.filetype == "cpp" or vim.bo.filetype == "rust" or vim.bo.filetype == "java" then
        if string.sub(cur_line, 1, 2) == '//' then
            vim.cmd('s/\\/\\//')
        else
            vim.cmd('s/^/\\/\\//')
        end
    end
    vim.cmd.noh()
end

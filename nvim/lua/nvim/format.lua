function formatFile()
    if vim.bo.filetype == "python" then
        vim.cmd('!black %')
    elseif vim.bo.filetype == "rust" then
        vim.cmd('!cargo fmt --all')
    elseif vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
        vim.cmd('!clang-format -i %')
    end
end



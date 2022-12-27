local M = {}

function M.ShowDetails()
    vim.cmd("norm yyp")
    vim.cmd("s/.* \\([a-f0-9]\\{7,40}\\).*/\\1")
    local current_word = vim.call('expand','<cword>')
    vim.cmd("r !git-show-format-nodiff.sh "..current_word)
    vim.cmd("?commit [a-f0-9]\\{6}")
    vim.cmd("norm kddO")
end

function M.GoFirstParent()
    vim.cmd("norm yyp")
    vim.cmd("s/.* \\([a-f0-9]\\{7,40}\\).*/\\1")
    local current_word = vim.call('expand','<cword>')
    vim.cmd("norm dd")
    vim.cmd("r !git log --pretty=format:\\%p -1 "..current_word)
    local parent = vim.call('expand','<cword>')
    vim.cmd("norm dd")
    vim.cmd("/"..parent)
end

function M.GoSecondParent()
    vim.cmd("norm yyp")
    vim.cmd("s/.* \\([a-f0-9]\\{7,40}\\).*/\\1")
    local current_word = vim.call('expand','<cword>')
    vim.cmd("norm dd")
    vim.cmd("r !git log --pretty=format:\\%p -1 "..current_word)
    vim.cmd("norm w")
    local parent = vim.call('expand','<cword>')
    vim.cmd("norm dd")
    vim.cmd("/"..parent)
end

return M

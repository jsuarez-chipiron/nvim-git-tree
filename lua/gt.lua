local M = {}

function M.GitTree(args)
    vim.cmd("new")
    vim.cmd("r !gittree "..args)
    vim.cmd("norm ggdd")
    vim.cmd("set ft=gt")
end

function M.ShowDetails()
    local current_line = vim.api.nvim_get_current_line()
    local commit = vim.fn.substitute(current_line,".* \\([a-f0-9]\\{7,40}\\).*", "\\1", "")
    vim.cmd("r !git-show-format-nodiff.sh "..commit)
    vim.cmd("set ft=gt")
end

function M.ShowDetailsAll()
    local current_line = vim.api.nvim_get_current_line()
    local commit = vim.fn.substitute(current_line,".* \\([a-f0-9]\\{7,40}\\).*", "\\1", "")
    vim.cmd("r !git-show.sh "..commit)
    vim.cmd("set ft=git")
end

function M.GoFirstParent()
    local current_line = vim.api.nvim_get_current_line()
    local commit = vim.fn.substitute(current_line,".* \\([a-f0-9]\\{7,40}\\).*", "\\1", "")
    local parents = vim.fn.system("git log --pretty=format:\\%p -1 "..commit)
    local parent = vim.fn.substitute(parents,"\\s.*$", "", "")
    vim.fn.search(parent, "s")
end

function M.GoSecondParent()
    local current_line = vim.api.nvim_get_current_line()
    local commit = vim.fn.substitute(current_line,".* \\([a-f0-9]\\{7,40}\\).*", "\\1", "")
    local parents = vim.fn.system("git log --pretty=format:\\%p -1 "..commit)
    local parent = vim.fn.substitute(parents,"^.*\\s", "", "")
    vim.fn.search(parent, "s")
end

return M


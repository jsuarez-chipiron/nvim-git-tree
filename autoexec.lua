local bufnr = 3 -- Change me with the command :lua vim.api.nvim_get_current_buf()
-- :luafile autoexec.lua

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("AUTOEXEC", { clear = true }),
    pattern = "main.cpp",
    callback = function()
        local append_data = function(_, data)
            if data then
                vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
            end
        end
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {"output:", ""})
        vim.fn.jobstart({"./run.sh"}, {
            stdout_buffered = true,
            on_stdout = append_data,
            on_stderr = append_data,
        })
    end,
})

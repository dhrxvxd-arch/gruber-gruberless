local M = {}

--- hello
function M.setup()
    vim.o.background = "dark"

    vim.cmd("highlight Normal guifg=#b8bac3 guibg=#878787")
    vim.cmd("highlight Comment guifg=#95a5c7 gui=italic")
    vim.cmd("highlight Keyword guifg=#222a2c gui=bold")
    vim.cmd("highlight Function guifg=#626c80")
    vim.cmd("highlight String guifg=#7f849c")
end

return M


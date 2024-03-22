local status, floaterm = pcall(require, "floaterm.health")
if not status then
    vim.notify("没有找到 vim-floaterm: ")
    return
end

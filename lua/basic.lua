-- 缩进2个空格等于一个Tab
-- vim.o.tabstop = 2
-- vim.bo.tabstop = 2
-- vim.o.softtabstop = 2
-- vim.o.shiftround = true

-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500

-- 允许隐藏被修改过的buffer
vim.o.hidden = true


-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true


-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"

-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = false
vim.o.listchars = "space:·"

-- 永远显示最上方的 tabline
vim.o.showtabline = 2

-- 使用增强状态栏插件 bufferline 后不再需要 vim 的模式提示
vim.o.showmode = false

-- 设置 .xpu 文件的文件类型为 C++
--vim.cmd([[
--  augroup xpu_filetype
--    autocmd!
--    autocmd BufNewFile,BufRead *.xpu set filetype=cpp
--  augroup end
--]])

-- 配置 ctags 将 .xpu 文件视为 C++ 文件进行解析
-- vim.api.nvim_command('!ctags --langmap=c++:+.xpu')

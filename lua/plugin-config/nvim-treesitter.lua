local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end

treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = { "c", "cpp", "cuda", "vim", "lua", "make", "python", "vimdoc"},
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,   -- 关闭 vim 的正则语法高亮
  },
  -- 启用代码缩进模块 (=)
--   indent = {
--     enable = true,
--   },
})



-- 内置的代码折叠模块
-- 使用了 zc 组合键来折叠 {} 中的内容，还可以使用 zo 组合键来打开对应的折叠
-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99



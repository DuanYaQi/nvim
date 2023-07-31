local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
  return
end


local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
				vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
				vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
				vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
				vim.keymap.set('n', 'i', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
				vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
				vim.keymap.set('n', '<F5>', api.tree.reload, opts('Refresh'))
				vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
				vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
				vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
				vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
				vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
				vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
				vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
end


-- 列表操作快捷键
local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    -- 不显示 git 状态图标
    git = {
        enable = false,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 40,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        hide_root_folder = false,
        -- 自定义列表中快捷键
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = true,
        },
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        cmd = 'wsl-open', -- mac 直接设置为 open
    },

		on_attach = my_on_attach,
})
-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])



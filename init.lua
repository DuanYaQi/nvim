-- 基础设置
require('basic')

-- 主题设置
require("colorscheme")

-- 快捷键映射
require("keybindings")

-- Packer 插件管理
require("plugins")


-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter") 
require("plugin-config.symbols-outline")
require("plugin-config.vim-floaterm")
require("plugin-config.lazygit") -- Install lazygit first
require("plugin-config.diffview")

-- 内置LSP
require("lsp.setup")


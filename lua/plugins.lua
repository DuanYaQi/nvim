local packer = require("packer")

packer.startup({
  function(use)
   -- Packer 可以管理自己本身
   use('wbthomason/packer.nvim')

   -- 1. dracula color theme
   use('Mofiqul/dracula.nvim')
   -- 2. symbol-outline 符号列表
   use('simrat39/symbols-outline.nvim')
   -- 3. 终端悬浮窗
   use('voldikss/vim-floaterm')
   -- 4. nvim-tree 文件夹目录
   use({ 'nvim-tree/nvim-tree.lua', requires = "nvim-tree/nvim-web-devicons" })
   -- 5. bufferline 顶部标签页 
   use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
   -- 6. lualine 底部信息栏
   use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
     use("arkav/lualine-lsp-progress") -- lsp 进度显示

   -- 7. telescope 字符文件模糊搜索(fzf 替代品)
   use({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } })
     use("LinArcX/telescope-env.nvim") -- 环境变量插件

   -- 8. dashboard-nvim 启动面板
   use({"glepnir/dashboard-nvim", requires = 'nvim-tree/nvim-web-devicons'})
     use("ahmedkhalf/project.nvim") -- 保存历史项目

   -- 9. nvim-treesitter 语法高亮
   use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

   -- 10. lazygit git 插件
   use({ "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {"nvim-lua/plenary.nvim",},
   })
  
   -- 11. diffview 插件
   use("sindrets/diffview.nvim") 

   --------------------- LSP --------------------
   -- 语言服务器
   use({ "williamboman/mason.nvim" })
   use({ "williamboman/mason-lspconfig.nvim" })

   -- 配置 LSP Server
   use({ "neovim/nvim-lspconfig" })

   -------------------- 补全引擎 ------------------
   -- 补全引擎插件
   use("hrsh7th/nvim-cmp")
   -- snippet 引擎
   use("hrsh7th/vim-vsnip") -- 自定义代码段
   -- 补全源
   use("hrsh7th/cmp-vsnip")
   use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }   Neovim 内置 LSP 提供的补全内容
   use("hrsh7th/cmp-buffer") -- { name = 'buffer' },    补全当前 buffer 的内容
   use("hrsh7th/cmp-path") -- { name = 'path' }         补全路径
   use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }   命令行的补全

   -- 常见编程语言代码段
   use("rafamadriz/friendly-snippets") -- 包含了大部分常用语言的代码段

  end,
  config = {
    -- 浮动窗口，单边框
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
  }
})


-- 每次保存 plugins.lua 自动安装插件
-- 因为 Neovim 还没有实现自动命令的 API, 所以我们需要使用 vim.cmd 命令来执行这段脚本
-- BufWritePost 事件时，如果改的是 lua/plugins.lua 文件，就自动重新加载并调用 :PackerSync 命令，这样就不用手动重启，可以自动安装插件了
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

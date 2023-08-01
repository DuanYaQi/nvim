local packer = require("packer")
packer.startup({
  function(use)
   -- Packer 可以管理自己本身
   use('wbthomason/packer.nvim')
   -- 你的插件列表...
   use('Mofiqul/dracula.nvim') -- colortheme
	 use({ 'nvim-tree/nvim-tree.lua', requires = "nvim-tree/nvim-web-devicons" }) -- nvim-tree
	 use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
   use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
   use("arkav/lualine-lsp-progress")
	 use({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }) -- telescope
	 use("LinArcX/telescope-env.nvim") -- telescope extensions
	 use({"glepnir/dashboard-nvim", requires = 'nvim-tree/nvim-web-devicons'}) -- dashboard-nvim
   use("ahmedkhalf/project.nvim")
	 use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- nvim-treesitter
   -- LSP --
   use({ "williamboman/mason.nvim" })
   use({ "williamboman/mason-lspconfig.nvim" })
   use({ "neovim/nvim-lspconfig" })
   -- 补全引擎 --
   use("hrsh7th/nvim-cmp")
   -- snippet 引擎
   use("hrsh7th/vim-vsnip")
   -- 补全源
   use("hrsh7th/cmp-vsnip")
   use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
   use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
   use("hrsh7th/cmp-path") -- { name = 'path' }
   use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
   -- 常见编程语言代码段
   use("rafamadriz/friendly-snippets")

  end,
config = {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
}
})


-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

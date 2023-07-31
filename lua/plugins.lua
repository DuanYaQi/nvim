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
	 use("glepnir/dashboard-nvim") -- dashboard-nvim
   use("ahmedkhalf/project.nvim")
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

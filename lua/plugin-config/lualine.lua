-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("没有找到 lualine")
  return
end

lualine.setup({
  options = {
    theme = "auto", -- 配色
    component_separators = { left = "|", right = "|" }, -- 设置分段分隔符
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = { left = " ", right = "" },  -- 设置分段中的组件分隔符
  },
  extensions = { "nvim-tree", "toggleterm" },
  sections = {
    lualine_c = {
    --   "filename",
      {
        "lsp_progress", -- 由我们之前安装的 arkav/lualine-lsp-progress 提供的
        -- spinner_symbols = { '▙ ', '▛ ', '▜ ', '▟ ' },
        spinner_symbols = { "⠇", "⠋", "⠙", "⠸", "⠴", "⠦" },
      },
    },
    lualine_x = {
      "filesize",
      {
        -- "fileformat",
        -- symbols = {
        --   unix = '', -- e712
        --   dos = '', -- e70f
        --   mac = '', -- e711
        -- },
        -- symbols = {
        --   unix = "LF",
        --   dos = "CRLF",
        --   mac = "CR",
        -- },
      },
    --   "encoding",
    --   "filetype",
    },
  },
})


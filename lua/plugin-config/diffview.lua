
local status, diffview = pcall(require, "diffview")
if not status then
    vim.notify("没有找到 diffview")
  return
end


diffview.setup({
  git_cmd = { "/home/duanyaqi/.git-2.31.0/git" },
})

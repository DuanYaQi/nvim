local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.setup({
 theme = 'doom',
 config = {
   header = {
     [[]],
		 [[]],
		 [[]],
     [[     ;;;;;;;;;;;;;;;;;;;]],
     [[     ;;;;;;;;;;;;;;;;;;;]],
     [[     ;                 ;]],
     [[     ;                 ;]],
     [[     ;                 ;]],
     [[     ;                 ;]],
     [[     ;                 ;]],
     [[     ;                 ;]],
     [[     ;                 ;]],
     [[,;;;;;            ,;;;;;]],
     [[;;;;;;            ;;;;;;]],
     [[`;;;;'            `;;;;']],
		 [[]],
       [[]],
       [[]],
	 },
   --project = { enable = false, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' }, 
   packages = { enable = false },
	 mru = { limit = 3 },
   shortcut = {
        { desc = '󰊳 init.lua', 
	  group = '@property', 
	  action = 'edit ~/.config/nvim/init.lua', 
	  key = 'e' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Projects',
          group = 'DiagnosticHint',
          action = 'Telescope projects',
          key = 'a',
        },
        {
          desc = ' Code',
          group = 'Number',
          action = 'Telescope live_grep',
          key = 'p',
        },
    },

	 center = {
   {
    icon = "  ",
    desc = "Projects                            ",
    action = "Telescope projects",
    key = "p",
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
    key = "r",
  },
  {
    icon = "  ",
    desc = "Edit keybindings                    ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "  ",
    desc = "Edit Projects                       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },

	 },

	 footer = {
  "",
  "",
  "",
  "Remember your Dream!",
	 },

 }
}
)

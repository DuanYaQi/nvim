# 目录结构

`<leader>` 空格

`<C-Left>` control + 左方向

`<CR>` 回车

`<A-k>` alt(option) + k

Item2 设置方式为 Preference -> Profiles -> Default --> Keys --> Left Option key --> 选中 Esc+

- lua/
    - lsp/: 对 Neovim 内置 LSP 功能的配置，包括常见编程语言与语法提示等
        - config/: 文件夹包含各种语言服务器单独的配置文件
            - clangd.lua: ?
            - cmake.lua: ?
        - common-config.lua: ?
        - setup.lua: 内置 LSP 的配置
    - plugin-config/: 对第三方插件的配置
        - bufferline.lua:
        - dashboard.lua:
        - lualine.lua:
        - nvim-tree.lua:
        - nvim-treesitter.lua:
        - project.lua:
        - symbols-outline.lua:
        - telescope.lua:
        - vim-floaterm.lua: 悬浮窗
    - basic.lua: 基础配置，是对默认配置的一个重置
    - colorscheme.lua: 安装的主题皮肤配置，在这里切换主题
    - keybindings.lua: 快捷键的设置，所有插件的快捷键放在这里
    - plugins.lua: 插件安装管理，插件安装或卸载在这里设置
- plugin/
    - packer_compiled.lua
- init.lua: 整个配置的入口文件，负责引用所有其他的模块，基本上想要打开或关闭某个插件只要在这里修改一行代码即可



pcall 在 Lua 中用于捕获错误


---
## keybindings.lua

vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options')

n Normal 模式

i Insert 模式

v Visual 模式

t Terminal 模式

c Command 模式

按键 就是你按下的键

映射为 可以是多个按键组合，比如 5j 就是连续点击5和j,  也可以是一条命令比如 :q<CR>，表示退出。

options 大部分会设置为 `{noremap = true, silent = true}`。
- `noremap` 表示不会重新映射. 比如你有一个映射 A -> B , 还有一个 B -> C, 这个时候如果你设置 `noremap = false` 的话，表示会重新映射，那么 A 就会被映射为 C。
- `silent` 为 true, 表示不会输出多余的信息。

---
## basic.lua

vim.g.{name}: 全局变量

vim.b.{name}: 缓冲区变量

vim.w.{name}: 窗口变量

vim.bo.{option}: buffer-local 选项

vim.wo.{option}: window-local 选项


---

## plugins.lua

管理插件

在 packer.startup() 中 使用 use 'name/repo' 来安装插件

配置生效后, Neovim 会增加以下命令。

:PackerCompil: 每次改变插件配置时，必须运行此命令或 PackerSync, 重新生成编译的加载文件
:PackerClean: 清除所有不用的插件
:PackerInstall: 清除，然后安装缺失的插件
:PackerUpdate: 清除，然后更新并安装插件
:PackerSync : 执行 PackerUpdate 后，再执行 PackerCompile
:PackerLoad : 立刻加载 opt 插件

Neovim 推荐将数据存储在 标准数据目录下（:h base-directories 查看详细文档），标准数据目录默认是 ~/.local/share/nvim/ ，你可以通过调用 :echo stdpath("data") 命令查看你系统下的实际路径。

Packer 会将插件默认安装在 标准数据目录/site/pack/packer/start 中，完整目录也就是 ~/.local/share/nvim/site/pack/packer/start 目录下。


---

## colorscheme.lua

Neovim 本身内置了一些主题配色，你可以通过 `:colorscheme Tab键` 命令来查看， 回车确认选中。 

这里列出的都是内置的 colorscheme, 它们都保存在 $VIMRUNTIME/colors/ 目录下。

你可以在 Neovim 中输入命令 :echo $VIMRUNTIME 来查看 $VIMRUNTIME 具体的路径，比如我的路径显示如下：

~/.local/usr/local/share/nvim/runtime/


通常我们都会选择专门为 Neovim 制作的第三方主题，因为它们大多都会支持基于 TreeSitter 的语法高亮

- 一个现代化的主题，必须支持 nvim-treesitter 语法高亮。

nvim-treesitter 的官方 wiki 上列出了许多支持 Treesitter 的主题，如果你想寻找更多的主题配色，可以到 nvim-treesitter wiki 页里查看。

- 一个优秀的现代化主题的第二个特点，就是能支持很多流行 Lua 插件的配色。

比如刚刚安装的 tokyonight 主题，就支持非常多的 Lua 插件，也是 Github 上星星最多的一款主题，我在这里强烈推荐，本书后续也将使用这款主题配色。

## project.lua

:lua print(require("project_nvim.utils.path").historyfile)

可以删除历史

## nvim-treesitter

`run = ":TSUpdate"` 是 Packer.nvim 的一个 Post-install hook。表示当组件安装或更新完成时会执行 :TSUpdate 命令。

~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/parser

报错 treesitter/query.lua:248: Query error at 9:4. Invalid node type "heredoc_end"

https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position

执行 `:echo nvim_get_runtime_file('parser', v:true)`

然后把除 nvim-treesitter 之外的路径下的 parser 删除

['/home/duanyaqi/.local/share/nvim/site/pack/packer/start/nvim-treesitter/parser', '/home/duanyaqi/.local/usr/local/lib/nvim/parser']

## lazygit

安装 lazygit

https://github.com/jesseduffield/lazygit

## LSP

Neovim 与 VSCode 相同内置了一套 Language Client 端的实现，这样我们就可以跟 VSCode 一样，来调用第三方 language servers ，实现高质量的语法补全等功能。


1. 配置客户端 (nvim-lspconfig)

2. 安装特定 language server (mason 管理)

3. 配置对应语言 require('lspconfig').xx.setup{…}

4. `:lua print(vim.inspect(vim.lsp.buf_get_clients()))` 查看 LSP 连接状态



lua-language-server

安装 lua 和 luarocks：https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix

 wget http://www.lua.org/ftp/lua-5.3.6.tar.gz

 wget https://luarocks.github.io/luarocks/releases/luarocks-3.11.0.tar.gz


### mason

:Mason 管理


### Cmp

补全引擎


### format

- 使用专门的格式化插件
- 给 Language Server 注入格式化功能


## indent-blankline

不需要魔法括号线，在待取消的文件内时输入 :echo &filetype 回车，状态栏会输出该文件的类型，加入 filetype_exclude 变量中排除
